package hr.elect.p0001.controller;

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
import hr.system.p0001.service.SignDocSvc;
import hr.system.p0001.vo.SignDocTypeVO;
import project.common.FileUtil;
import project.common.FileVO;
import project.common.SearchVO;

@Controller("signController")
public class SignControllerImpl implements SignController {
	private static final Logger logger = LoggerFactory.getLogger(SignControllerImpl.class);
	@Autowired
	private SignDAO signDAO;
	@Autowired
	private SignService signService;
	@Autowired
    private SignDocSvc signDocSvc;
	@Autowired
	private SignVO signVO;
	
	/**
     * 결제 받을 문서 리스트. -> 개인 문서함 
     */
	@Override
	@RequestMapping(value = "/signListTobe", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView signListTobe(HttpServletRequest request, HttpServletResponse response, SearchVO searchVO, ModelMap modelMap) throws Exception {
		
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
		modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
    	
        // 
        searchVO.setPK_SAWON_CODE(userno);
        searchVO.pageCalculate( signDAO.selectSignDocTobeCount(searchVO) ); // startRow, endRow
        List<?> listview  = signDAO.selectSignDocTobeList(searchVO);
        
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("listview", listview);
        
		String viewName = getViewName(request);
		viewName = "elect/p0001/SignDocListTobe";
		request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	/**
     * 결제 할 문서 리스트 -> 결재 문서함 
     */
	@Override
	@RequestMapping(value = "/signListTo", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView signListTo(HttpServletRequest request, HttpServletResponse response, SearchVO searchVO, ModelMap modelMap) throws Exception {
		
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
		modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
    	
        //
		if (searchVO.getSearchExt1()==null || "".equals(searchVO.getSearchExt1())) searchVO.setSearchExt1("sign");
		searchVO.setPK_SAWON_CODE(userno);
        searchVO.pageCalculate( signDAO.selectSignDocCount(searchVO) ); // startRow, endRow
        List<?> listview  = signDAO.selectSignDocList(searchVO);
        
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("listview", listview);
        
		String viewName = getViewName(request);
		viewName = "elect/p0001/SignDocList";
		request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	/** 
     * 기안하기1. -> 양식 리스트 불러오기
     */
	@Override
	@RequestMapping(value = "/signDocTypeList", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView signDocTypeList(HttpServletRequest request, HttpServletResponse response, SearchVO searchVO, ModelMap modelMap) throws Exception {
		
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
		modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
    	
		List<?> listview  = signDocSvc.selectSignDocTypeList(searchVO);
        
        modelMap.addAttribute("listview", listview);
        
		String viewName = getViewName(request);
		viewName = "elect/p0001/SignDocTypeList";
		request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	/** 
     * 기안하기2. -> 양식읽기, 쓰기, 결재경로
     */
	@Override
	@RequestMapping(value = "/signDocForm", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView signDocForm(HttpServletRequest request, SignDocVO signDocInfo, ModelMap modelMap) throws Exception {
		
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
		modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
		
		// 개별 작업
        List<?> signlist = null;
        if (signDocInfo.getPK_AD_NUM() == null) {	// 신규
        	signDocInfo.setAD_DOCSTATUS("1");
        	SignDocTypeVO docType = signDocSvc.selectSignDocTypeOne(signDocInfo.getPK_DOCTYPE_NUM());
        	signDocInfo.setPK_DOCTYPE_NUM(docType.getPK_DOCTYPE_NUM());
        	signDocInfo.setAD_CONTENT(docType.getDOCTYPE_DTCONTENTS());
        	signDocInfo.setPK_SAWON_CODE(userno);
        	// 사번, 이름, 기안/합의/결제, 직책
            signlist = signDAO.selectSignLast(signDocInfo);
            String signPath = "";
            for (int i=0; i<signlist.size();i++){
            	SignVO svo = (SignVO) signlist.get(i);
            	signPath += svo.getPK_SAWON_CODE() + "," + svo.getSAWON_NAME() + "," + svo.getAPPROVAL_SSTYPE() + "," + svo.getAPPROVAL_USER_POS() + "||";  
            }
            signDocInfo.setAD_DOCSIGNPATH(signPath);
        } else {								// 수정
            signDocInfo = signDAO.selectSignDocOne(signDocInfo);
            signlist = signDAO.selectSign(signDocInfo.getPK_AD_NUM());
            //파일정보 읽기
            List<?> listview2 = signDAO.selectSignFileList(signDocInfo.getPK_AD_NUM());
            modelMap.addAttribute("listview2", listview2);
        }
        modelMap.addAttribute("signDocInfo", signDocInfo);
        modelMap.addAttribute("signlist", signlist);
        
		String viewName = getViewName(request);
		viewName = "elect/p0001/SignDocForm";
		request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
    /**
     * 저장.
     */
	@Override
    @RequestMapping(value = "/signDocSave")
    public String signDocSave(HttpServletRequest request, SignDocVO signDocInfo, ModelMap modelMap) {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
    	signDocInfo.setPK_SAWON_CODE(userno);
    	
    	String[] fileno = request.getParameterValues("fileno");
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFiles(signDocInfo.getUploadfile());
    	
        signService.insertSignDoc(signDocInfo, filelist, fileno);

        return "redirect:/signListTobe";
    }
    
    /**
     * 읽기.
     */
	@Override
    @RequestMapping(value = "/signDocRead")
    public String signDocRead(HttpServletRequest request, SignDocVO SignDocVO, ModelMap modelMap) {
        // 페이지 공통: alert
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        // etcSvc.setCommonAttribute(userno, modelMap);
    	
        // 개별 작업
        
        SignDocVO signDocInfo = signDAO.selectSignDocOne(SignDocVO);
        List<? >signlist = signDAO.selectSign(signDocInfo.getPK_AD_NUM());
        String signer = signDAO.selectCurrentSigner(SignDocVO.getPK_AD_NUM());
        //파일정보 읽기
        List<?> listview2 = signDAO.selectSignFileList(signDocInfo.getPK_AD_NUM());
        modelMap.addAttribute("listview2", listview2);
        
        modelMap.addAttribute("signDocInfo", signDocInfo);
        modelMap.addAttribute("signlist", signlist);
        modelMap.addAttribute("signer", signer);
        
        return "elect/p0001/SignDocRead";
    }
    
    /**
     * 삭제.
     */
	@Override
    @RequestMapping(value = "/signDocDelete")
    public String signDocDelete(HttpServletRequest request, SignDocVO SignDocVO) {

    	signDAO.deleteSignDoc(SignDocVO);
        
        return "redirect:/signListTobe";
    }
    /**
     * 회수.
     */
	@Override
    @RequestMapping(value = "/signDocCancel")
    public String signDocCancel(HttpServletRequest request, String PK_AD_NUM) {
    	signDAO.updateSignDocCancel(PK_AD_NUM);
        
        return "redirect:/signListTobe";
    }
    /**
     * 결재.
     */
	@Override
    @RequestMapping(value = "/signSave")
    public String signSave(HttpServletRequest request, SignVO signInfo) {

    	signService.updateSign(signInfo);
        
        return "redirect:/signListTo";
    }
    
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
		}
		return viewName;
	}

}
