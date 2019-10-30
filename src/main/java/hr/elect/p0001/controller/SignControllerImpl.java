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
import hr.elect.p0001.vo.SignVO;
import hr.system.p0001.service.SignDocSvc;
import project.common.SearchVO;

@Controller("signController")
public class SignControllerImpl implements SignController {
	private static final Logger logger = LoggerFactory.getLogger(SignControllerImpl.class);
	@Autowired
	private SignDAO signDAO;
	@Autowired
	SignService signService;
	@Autowired
	SignVO signVO;
	@Autowired
    private SignDocSvc signDocSvc;
	
	/**
     * 결제 받을 문서 리스트.
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
		//ModelAndView main = new ModelAndView("hr/sign_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
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
