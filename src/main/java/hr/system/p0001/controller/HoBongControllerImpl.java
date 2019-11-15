package hr.system.p0001.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hr.system.p0001.service.HBCodeService;
import hr.system.p0001.vo.InsaCodeVO;

@Controller("h_hobongController")
public class HoBongControllerImpl implements HoBongController {
	private static final Logger logger = LoggerFactory.getLogger(HoBongControllerImpl.class);
	@Autowired
	HBCodeService p0001Service;
	@Autowired
	InsaCodeVO p0001VO;
	
		@Override
		@RequestMapping(value = "/system/p0001/hobong.do", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView hobong(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = getViewName(request);
			viewName = "/system/p0001/hobong";
			request.setCharacterEncoding("utf-8");
			ModelAndView main = new ModelAndView(viewName);
			return main;
		}
	
		
		@Override
		@RequestMapping(value = "/system/p0001/hobongCode.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public Map hobongCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
			Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
			
			//데이터 조회
			List<InsaCodeVO> data = p0001Service.hobongCode(searchMap);
	        resultMap.put("Data", data);
	        
	        return resultMap;
		}
		
		
		
		
		@Override
		@RequestMapping(value = "/system/p0001/hobongApp.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public Map hobongApp(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
			Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
			// 검색조건설정
			searchMap.put("fk_RANK_CODE", request.getParameter("fk_RANK_CODE"));
			
			//데이터 조회
			List<InsaCodeVO> data = p0001Service.hobongApp(searchMap);
	        resultMap.put("Data", data);
	        
	        return resultMap;
		}
		
//	@Override
//	@RequestMapping(value = "/system/p0001/insertData.do", method = { RequestMethod.GET, RequestMethod.POST })
//	@ResponseBody
//	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 占쏙옙占쎌삢占쎈막Daa
//		Map<String, Object> resultMap = new HashMap<String, Object>(); // 筌ｌ꼶�봺野껉퀗�궢
//		
//		// 占쏙옙占쎌삢 Data �빊遺욱뀱占쎈릭疫뀐옙
//		Enumeration enu = request.getParameterNames();
//		while (enu.hasMoreElements()) {
//			String name = (String) enu.nextElement();
//			String[] values = request.getParameterValues(name);
//			System.out.println("name:"+name+"  values:"+ request.getParameterValues(name));
//			dataMap.put(name, values);
//		}
//		
//		Map<String, String> result = new HashMap<String, String>();
//		System.out.println("1."+dataMap+" \n...�뜝�럩�꼪�뜝�럩逾ι쨹恝�삕...");
//		try {
//			p0001Service.saveData(dataMap);	
//			result.put("Code","0");
//			result.put("Message","占쏙옙占쎌삢占쎈┷占쎈�占쎈뮸占쎈빍占쎈뼄");
//		}catch(Exception e) {
//			result.put("Code","-1");
//			result.put("Message","占쏙옙占쎌삢占쎈퓠 占쎈뼄占쎈솭占쎈릭占쏙옙占쎈뮸占쎈빍占쎈뼄");
//			e.printStackTrace();
//		}
//		
//		resultMap.put("Result", result);         
//        return resultMap;
//	}
	
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
