package hr.human.p0002.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hr.human.p0001.vo.CardFamVO;
import hr.human.p0002.service.BalService;
import hr.human.p0002.vo.BalVO;
import hr.system.p0001.vo.InsaCodeVO;

@Controller("h_BalController")
public class BalControllerImpl implements BalController{
	private static final Logger logger = LoggerFactory.getLogger(BalControllerImpl.class);
	@Autowired
	BalService p0002Service;
	@Autowired
	BalVO p0002VO;
	
	//인사발령_페이지
	@Override
	@RequestMapping(value = "/human/p0002/insa_ballyeong.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insaBal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/human/p0002/insa_ballyeong";
		request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	@RequestMapping(value = "/human/p0002/ballyeong_Popup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Popup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/human/p0002/ballyeong_Popup";
		request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	// code
	@Override
	@RequestMapping(value = "/human/p0002/code.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map Code(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		String fk_PERSON_BC_CODE_NUM = "HD"; // 발령구분
		searchMap.put("fk_PERSON_BC_CODE_NUM", fk_PERSON_BC_CODE_NUM);
		
		//데이터 조회
		List<InsaCodeVO> data = p0002Service.Code(searchMap);
	    resultMap.put("Data", data);
	       
	    return resultMap;
	}
	
	// 발령	
	@Override
	@RequestMapping(value = "/human/p0002/ballyeong.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map ballyeong(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("fk_PERSON_BC_CODE_NUM", request.getParameter(""));
		
		//데이터 조회
		List<BalVO> data = p0002Service.Ballyeong(searchMap);
	    resultMap.put("Data", data);
	       
	    return resultMap;
	}
	
	
	
	
		@Override
		@RequestMapping(value = "/human/p0002/insertBal.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 저장할Daa
			Map<String, Object> resultMap = new HashMap<String, Object>(); // 처리결과
			
			// 저장 Data 추출하기
			Enumeration enu = request.getParameterNames();
			while (enu.hasMoreElements()) {
				String name = (String) enu.nextElement();
				String[] values = request.getParameterValues(name);
				dataMap.put(name, values);
			}
			
			Map<String, String> result = new HashMap<String, String>();
			try {
				p0002Service.saveData(dataMap);
				result.put("Code","0");
				result.put("Message","저장되었습니다");
			}catch(Exception e) {
				result.put("Code","-1");
				result.put("Message","저장에 실패하였습니다");
				e.printStackTrace();
			}
			
			resultMap.put("Result", result);         
	        return resultMap;
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
