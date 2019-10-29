package hr.system.p0001.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import hr.system.p0001.service.SignDocSvc;
import hr.system.p0001.vo.SignDocTypeVO;
import project.common.SearchVO;
import project.common.EtcSvc;

@Controller 
public class SignDocCtr {

    @Autowired
    private SignDocSvc signDocSvc;
    
    @Autowired
    private EtcSvc etcSvc; 
    
    static final Logger LOGGER = LoggerFactory.getLogger(SignDocCtr.class);
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/adSignDocTypeList")
    public String signDocTypeList(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
        // 페이지 공통: alert
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
    	
        searchVO.pageCalculate( signDocSvc.selectSignDocTypeCount(searchVO) ); // startRow, endRow
        List<?> listview  = signDocSvc.selectSignDocTypeList(searchVO);
        
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("listview", listview);
        
        return "system/p0001/SignDocTypeList";
    }
    
    /** 
     * 쓰기. 
     */
    @RequestMapping(value = "/adSignDocTypeForm")
    public String signDocTypeForm(HttpServletRequest request, SignDocTypeVO signInfo, ModelMap modelMap) {
        // 페이지 공통: alert
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
    	
        // 개별 작업
        if (signInfo.getPK_DOCTYPE_NUM() != null) {
            signInfo = signDocSvc.selectSignDocTypeOne(signInfo.getPK_DOCTYPE_NUM());
        
            modelMap.addAttribute("signInfo", signInfo);
        }
        
        return "system/p0001/SignDocTypeForm";
    }
    
    /**
     * 저장.
     */
    @RequestMapping(value = "/adSignDocTypeSave")
    public String signDocTypeSave(HttpServletRequest request, SignDocTypeVO signInfo, ModelMap modelMap) {
    	
    	String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        modelMap.addAttribute("PK_SAWON_CODE", userno);
    	
        signDocSvc.insertSignDocType(signInfo, userno);

        return "redirect:/adSignDocTypeList";
    }

    /**
     * 삭제.
     */
    @RequestMapping(value = "/adSignDocTypeDelete")
    public String signDocTypeDelete(HttpServletRequest request, SignDocTypeVO signVO) {

        signDocSvc.deleteSignDocType(signVO);
        
        return "redirect:/adSignDocTypeList";
    }
   
}
