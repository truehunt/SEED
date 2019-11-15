package hr.elect.p0002.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hr.elect.p0001.dao.SignDAO;
import hr.elect.p0001.service.SignService;
import hr.elect.p0001.vo.SignDocVO;
import hr.elect.p0001.vo.SignVO;
import hr.elect.p0002.dao.SignConfigDAO;
import hr.elect.p0002.vo.SignImageVO;
import hr.elect.p0002.vo.SignLinePathVO;
import hr.system.p0001.service.SignDocSvc;
import hr.system.p0001.vo.SignDocTypeVO;
import project.common.FileUtil;
import project.common.FileVO;
import project.common.SearchVO;

@Controller("signConfigCtr")
public class SignConfigCtrImpl implements SignConfigCtr {
	private static final Logger logger = LoggerFactory.getLogger(SignConfigCtrImpl.class);
	@Autowired
	private SignConfigDAO signConfigDAO;
	@Autowired
	private SignLinePathVO signLinePathVO;
	@Autowired
	private SignImageVO signImageVO;
	
    /**
     * 결재선 저장.
     * @throws IOException 
     */
	@Override
    @RequestMapping(value = "/saveLinePath", method = { RequestMethod.GET, RequestMethod.POST })
    public void saveLinePath(HttpServletRequest request, HttpServletResponse response, SignLinePathVO signLinePathVO) throws IOException {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        signLinePathVO.setPK_SAWON_CODE(userno);
        
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("LINEPATH_NAME");
        String ret = request.getParameter("ret");
        signLinePathVO.setLINEPATH_NAME(name);
        signLinePathVO.setLINEPATH_SIGNPATH(ret);
        
        response.setContentType("text/html;charset=utf-8");
  		PrintWriter out = response.getWriter();
		
  		try {
		signConfigDAO.insertSignLinePath(signLinePathVO);
        
        out.print("결재선을 저장하였습니다.");
  		} catch (Exception e) {
 			System.out.println("결재선 저장 실패 : " + e);
 		}
    }
	
	/** 
     * 결재선 리스트 불러오기
     */
	@Override
	@RequestMapping(value = "/loadLinePath", method = { RequestMethod.GET, RequestMethod.POST })
	public String loadLinePathList(HttpServletRequest request, HttpServletResponse response, SignLinePathVO signLinePathVO, ModelMap modelMap) throws Exception {
		
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
		System.out.println(userno);
        
		modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
    	
		List<?> listview  = signConfigDAO.selectSignLinePathList(userno);
		
		// 2019001,팀장,0,기안||user1,박홍준,2,부회장|| 값을 분해하기
		for (int listview_num=0 ; listview_num<listview.size(); listview_num++) {

			SignLinePathVO map1 = (SignLinePathVO)listview.get(listview_num);
			String temp3 = map1.getLINEPATH_SIGNPATH().toString();
			Object[] temp = temp3.split("\\|\\|");
			
			String replace_path = ""; // 화면에 뿌려지는 값.
			for(int path_num=0 ; path_num <temp.length; path_num++) {
				String[] temp1 =((String) temp[path_num]).split(",");
				replace_path += temp1[1].toString() + " - ";
			}
			// if (path_num < (temp.length -1)) 일때 - 붙이게 하면 마지막에 '-' 안붙음
			String replace_path2 = replace_path.substring(0, replace_path.length()-3);
			
			((SignLinePathVO)listview.get(listview_num)).setLINEPATH_SIGNPATH_View(replace_path2);
			
		}
		
        modelMap.addAttribute("listview", listview);
        
		return "elect/p0002/popupSignLinePath";
	}
	
	/**
     * 결재라인 화면에서 결재라인 삭제
	 * @throws
     */
	@Override
    @RequestMapping(value = "/deleteLinePath")
    public void signLinePathDelete(HttpServletRequest request, HttpServletResponse response, String PK_LINEPATH_NUM) throws IOException {
    	
		response.setContentType("text/html;charset=utf-8");
  		PrintWriter out = response.getWriter();
		
  		try {
  			signConfigDAO.signLinePathDelete(PK_LINEPATH_NUM);
        
        out.print("결재라인을 삭제하였습니다.");
  		} catch (Exception e) {
 			System.out.println("결재라인 삭제 실패 : " + e);
 		}
    }
	
	/**
     * 결재이미지 등록화면
     */
    @RequestMapping(value = "/signImageForm")
    public String memberForm(HttpServletRequest request, ModelMap modelMap) {
        String save = request.getParameter("save");

        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        SignImageVO signImageInfo = signConfigDAO.selectSignImageOne(userno);
        
        modelMap.addAttribute("signImageInfo", signImageInfo);
        modelMap.addAttribute("save", save);
        
        return "elect/p0002/signImageForm";
    }
    
    /**
     * 결재이미지 저장, 업데이트.
     */
    @RequestMapping(value = "/imageSave")
    public String imageSave(HttpServletRequest request, ModelMap modelMap, SignImageVO signImageInfo) {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        signImageInfo.setPK_SAWON_CODE(userno);
        
        FileUtil fs = new FileUtil();
        FileVO fileInfo = fs.saveImage(signImageInfo.getPhotofile());
        if (fileInfo != null) {
        	signImageInfo.setPhoto(fileInfo.getRealname());
        }
        signConfigDAO.updateSignImage(signImageInfo);

        return "redirect:/elect/p0002/signImageForm?save=OK";
    }

}
