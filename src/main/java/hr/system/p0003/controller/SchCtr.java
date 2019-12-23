
package hr.system.p0003.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import hr.system.p0003.service.SchSvc;
import hr.system.p0003.vo.MonthVO;
import hr.system.p0003.vo.SchVO;
import project.common.Field3VO;
import project.common.SearchVO;
import project.common.Util4calen;
import project.common.EtcSvc;

@Controller 
public class SchCtr {

    @Autowired
    private SchSvc schSvc;
    
    @Autowired
    private EtcSvc etcSvc; 
    
    static final Logger LOGGER = LoggerFactory.getLogger(SchCtr.class);
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/schList")
    public String schList(HttpServletRequest request, MonthVO searchVO, ModelMap modelMap) {
        // 페이지 공통: alert
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
    	
        if("13".equals(searchVO.getMONTH())) {         // 13월 일때 연도증가, 월 1월로
    		searchVO.setYEAR(String.valueOf(Integer.valueOf(searchVO.getYEAR())+1));
    		searchVO.setMONTH("1");
    	} else if ("0".equals(searchVO.getMONTH())) {         // 0월 일때 연도감소, 월 12월로
    		searchVO.setYEAR(String.valueOf(Integer.valueOf(searchVO.getYEAR())-1));
    		searchVO.setMONTH("12");
    	} else if (searchVO.getYEAR()==null || "".equals(searchVO.getYEAR())) {
        	Date today = Util4calen.getToday();
        	searchVO.setYEAR(Util4calen.getYear(today).toString());
        	searchVO.setMONTH(Util4calen.getMonth(today).toString());
        	
        }
        Integer dayofweek = Util4calen.getDayOfWeek( Util4calen.str2Date(searchVO.getYEAR() + "-" + searchVO.getMONTH()+"-01"));
        
        List<?> listview  = schSvc.selectCalendar(searchVO, userno);
        
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("dayofweek", dayofweek);
        
        return "/system/p0003/SchList";
        // return "/SchList";
    }
    
    /** 
     * 쓰기. 
     */
    @RequestMapping(value = "/schForm")
    public String schForm(HttpServletRequest request, SchVO schInfo, ModelMap modelMap) {
        // 페이지 공통: alert
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
    	
        // 
        if (schInfo.getSSNO() != null) {
            schInfo = schSvc.selectSchOne(schInfo);
        
        } else{
        	schInfo.setSSTYPE("1");
        	schInfo.setSSISOPEN("Y");

        	String cddate = request.getParameter("CDDATE");
        	if (cddate==null || "".equals(cddate)) {
        		cddate = Util4calen.date2Str(Util4calen.getToday());
        	}
    		schInfo.setSSSTARTDATE(cddate);
    		schInfo.setSSSTARTHOUR("09");
    		schInfo.setSSENDDATE(cddate);
    		schInfo.setSSENDHOUR("18");
        }
        modelMap.addAttribute("schInfo", schInfo);
        
        List<?> sstypelist= etcSvc.selectClassCode("SE");
        modelMap.addAttribute("sstypelist", sstypelist);
        
        return "system/p0003/SchForm";
    }
    
    /**
     * 저장.
     */
    @RequestMapping(value = "/schSave")
    public String schSave(HttpServletRequest request, SchVO schInfo, ModelMap modelMap) {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
    	schInfo.setPK_SAWON_CODE(userno);
    	
        schSvc.insertSch(schInfo);

        return "redirect:/schList";
    }

    /**
     * 읽기.
     */
    @RequestMapping(value = "/schRead4Ajax")
    public String schRead4Ajax(HttpServletRequest request, SchVO schVO, String cddate, ModelMap modelMap) {
        SchVO schInfo = schSvc.selectSchOne4Read(schVO);

        modelMap.addAttribute("schInfo", schInfo);
        modelMap.addAttribute("CDDATE", cddate);
        
        return "system/p0003/SchRead4Ajax";
    }
    /**
     * 읽기.
     */
    @RequestMapping(value = "/schRead")
    public String schRead(HttpServletRequest request, SchVO schVO, ModelMap modelMap) {
        // 페이지 공통: alert
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
        // 
        
        SchVO schInfo = schSvc.selectSchOne4Read(schVO);

        modelMap.addAttribute("schInfo", schInfo);
        
        return "system/p0003/SchRead";
    }
    
    /**
     * 삭제.
     */
    @RequestMapping(value = "/schDelete")
    public String schDelete(HttpServletRequest request, SchVO schVO) {

        schSvc.deleteSch(schVO);
        
        return "redirect:/schList";
    }
   
}
