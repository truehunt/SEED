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
	public String loadLinePathList(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception {
		
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
		System.out.println(userno);
        
		modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
    	
		List<?> listview  = signConfigDAO.selectSignLinePathList(userno);
		
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

}
