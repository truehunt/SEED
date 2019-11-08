package hr.pay.p0001.controller;

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

import hr.pay.p0001.service.TA_inputService;
import hr.pay.p0001.vo.TA_inputVO;




@Controller("TA_inputController")
public class TA_inputControllerImpl implements TA_inputController {
	private static final Logger logger = LoggerFactory.getLogger(TA_inputControllerImpl.class);
	@Autowired
	TA_inputService TA_inputService;
	@Autowired
	TA_inputVO TA_inputVO;
	
	@Override
	@RequestMapping(value = "/pay/p0001/init.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		//ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView("pay/p0001/TA_input");
		return main;
	}
	
	@Override
	@RequestMapping(value = "/pay/p0001/calendar.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Calendar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "pay/p0001/calendar";
		request.setCharacterEncoding("utf-8");
		//ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	@Override
	@RequestMapping(value = "/pay/p0001/calendar2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Calendar2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "pay/p0001/calendar2";
		request.setCharacterEncoding("utf-8");
		//ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	
	
	@Override
	@RequestMapping(value = "/pay/p0001/p0001.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ibSheet(HttpServletRequest request, HttpServletResponse response) throws Exception {
	request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView("pay/p0001/p0001");
		return main;
	}
	
	@Override
	@RequestMapping(value = "/pay/p0001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 野껓옙占쎄퉳鈺곌퀗援?
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 鈺곌퀬?돳野껉퀗?궢
		
		// 野껓옙占쎄퉳鈺곌퀗援뷂옙苑뺧옙?젟
		searchMap.put("TA_ATTRIBUTION", request.getParameter("TA_ATTRIBUTION"));
		searchMap.put("TA_PAYMENTDAY", request.getParameter("TA_PAYMENTDAY"));

		searchMap.put("FK_WORKPLACE_CODE", request.getParameter("FK_WORKPLACE_CODE"));
		searchMap.put("FK_SAWON_WORKPLACE_CODE", request.getParameter("FK_SAWON_WORKPLACE_CODE"));
		searchMap.put("PK_DEPT_CODE", request.getParameter("PK_DEPT_CODE"));
		searchMap.put("FK_DEPT_CODE", request.getParameter("FK_DEPT_CODE"));
		
		System.out.println(request.getParameter("FK_WORKPLACE_CODE"));
		//占쎈쑓占쎌뵠占쎄숲 鈺곌퀬?돳
		List<TA_inputVO> data = TA_inputService.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/pay/p0001/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 野껓옙占쎄퉳鈺곌퀗援?
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 鈺곌퀬?돳野껉퀗?궢
		
		// 野껓옙占쎄퉳鈺곌퀗援뷂옙苑뺧옙?젟
		searchMap.put("PK_SAWON_CODE", request.getParameter("PK_SAWON_CODE"));
	
		
		
		//占쎈쑓占쎌뵠占쎄숲 鈺곌퀬?돳
		List<TA_inputVO> data = TA_inputService.searchList2(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/pay/p0001/SiteList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map SiteList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 野껓옙占쎄퉳鈺곌퀗援?
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 鈺곌퀬?돳野껉퀗?궢
		
		// 野껓옙占쎄퉳鈺곌퀗援뷂옙苑뺧옙?젟
	

		
		//占쎈쑓占쎌뵠占쎄숲 鈺곌퀬?돳
		List<TA_inputVO> data = TA_inputService.SiteList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	
	
	@Override
	@RequestMapping(value = "/pay/p0001/DeptList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map DeptList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 野껓옙占쎄퉳鈺곌퀗援?
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 鈺곌퀬?돳野껉퀗?궢
		
		// 野껓옙占쎄퉳鈺곌퀗援뷂옙苑뺧옙?젟
		
		searchMap.put("pk_WORKPLACE_CODE", request.getParameter("SiteList"));

		
		//占쎈쑓占쎌뵠占쎄숲 鈺곌퀬?돳
		List<TA_inputVO> data = TA_inputService.DeptList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	
	
	
	
	
	
	
	@Override
	@RequestMapping(value = "/pay/p0001/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 占쏙옙占쎌삢占쎈막Daa
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 筌ｌ꼶?봺野껉퀗?궢
		
		// 占쏙옙占쎌삢 Data ?빊遺욱뀱占쎈릭疫뀐옙
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			TA_inputService.saveData(dataMap);	
			result.put("Code","0");
			result.put("Message","저장되었습니다.");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","오류가 발생하였습니다.");
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
