package hr.attendance.p0001.controller;

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

import hr.attendance.p0001.service.day_regist_Service;
import hr.attendance.p0001.vo.day_regist_VO;

@Controller("day_regist_Controller")
public class day_regist_ControllerImpl implements day_regist_Controller {
	private static final Logger logger = LoggerFactory.getLogger(day_regist_ControllerImpl.class);
	@Autowired
	day_regist_Service day_regist_Service;
	@Autowired
	day_regist_VO day_regist_VO;

	// 전체 메인 화면
	@Override
	@RequestMapping(value = "attendance/p0001/init.do", method = { RequestMethod.GET, RequestMethod.POST }) // 매핑 주소
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {// 컨트롤러에 들어가는 이름
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/init";// jsp파일 명
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// ibsheet 예시 화면
	@Override
	@RequestMapping(value = "attendance/p0001/ibsheet.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ibSheet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/ibsheet_basic";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// 일일근태확인_(사원)
	@Override
	@RequestMapping(value = "attendance/p0001/day_regist_sawon.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView day_regist_sawon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/day_regist_sawon";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// 일일근태등록_전체화면(관리자)
	@Override
	@RequestMapping(value = "attendance/p0001/day_regist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView day_regist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/day_regist";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// 일일 마감관리
	@Override
	@RequestMapping(value = "attendance/p0001/day_deadline.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView day_deadline(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/day_deadline";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// 월마감관리
	@Override
	@RequestMapping(value = "attendance/p0001/mon_deadline.do", method = { RequestMethod.GET, RequestMethod.POST }) // 매핑명(매핑할
																														// 주소)
	public ModelAndView mon_deadline(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/mon_deadline";// 파일이름
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// 휴일/연장/야간 근무조회
	@Override
	@RequestMapping(value = "attendance/p0001/inquery.do", method = { RequestMethod.GET, RequestMethod.POST }) // 매핑명(매핑할
																												// 주소)
	public ModelAndView inquery(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/inquery";// 파일이름
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// 휴가신청
	@Override
	@RequestMapping(value = "attendance/p0001/holiday.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView holiday(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/holiday";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// 출장신청
	@Override
	@RequestMapping(value = "attendance/p0001/business.do", method = { RequestMethod.GET, RequestMethod.POST })
	// impl 이름 = business
	public ModelAndView business(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/business";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// 외근신청
	@Override
	@RequestMapping(value = "attendance/p0001/outside.do", method = { RequestMethod.GET, RequestMethod.POST })
	// impl 이름 = business
	public ModelAndView outside(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/outside";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// 휴가일수 계산
	@Override
	@RequestMapping(value = "attendance/p0001/holiday_calc.do", method = { RequestMethod.GET, RequestMethod.POST })
	// impl 이름 = business
	public ModelAndView holiday_calc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/holiday_calc";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	@Override
	@RequestMapping(value = "attendance/p0001/deadline.do", method = { RequestMethod.GET, RequestMethod.POST })
	// impl 이름 = business
	public ModelAndView deadline(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/deadline";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	
	//============================================================================================================
	//기능 매핑
	
	// 사원화면 조회
	@Override
	@RequestMapping(value = "attendance/p0001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 寃??깋議곌굔
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 議고쉶寃곌낵

		// 寃??깋議곌굔?꽕?젙
		searchMap.put("PK_DAILY_TA_WORKING_DATE", request.getParameter("PK_DAILY_TA_WORKING_DATE"));

		// ?뜲?씠?꽣 議고쉶
		List<day_regist_VO> data = day_regist_Service.searchList(searchMap);
		resultMap.put("Data", data);

		return resultMap;
	}

	
	// 관리자화면 사원화면 조회
		@Override
		@RequestMapping(value = "attendance/p0001/da_searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public Map da_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> searchMap = new HashMap<String, Object>(); // 寃??깋議곌굔
			Map<String, Object> resultMap = new HashMap<String, Object>(); // 議고쉶寃곌낵

			// 寃??깋議곌굔?꽕?젙
			searchMap.put("PK_DAILY_TA_WORKING_DATE", request.getParameter("PK_DAILY_TA_WORKING_DATE"));

			// ?뜲?씠?꽣 議고쉶
			List<day_regist_VO> data = day_regist_Service.searchList(searchMap);
			resultMap.put("Data", data);

			return resultMap;
		}
	
	
	// 추가<실행x>
	@Override
	@RequestMapping(value = "attendance/p0001/insertData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // ???옣?븷Daa
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 泥섎━寃곌낵

		// ???옣 Data 異붿텧?븯湲?
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			System.out.println(name);
			System.out.println(values);
			dataMap.put(name, values);
		}

		Map<String, String> result = new HashMap<String, String>();
		System.out.println("1. "+dataMap);
		try {
			day_regist_Service.saveData(dataMap);
			result.put("Code", "0");
			result.put("Message", "???옣?릺?뿀?뒿?땲?떎");
		} catch (Exception e) {
			result.put("Code", "-1");
			result.put("Message", "???옣?뿉 ?떎?뙣?븯???뒿?땲?떎");
			e.printStackTrace();
		}

		resultMap.put("Result", result);
		return resultMap;
	}

	@RequestMapping(value = "common/ajaxTest", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> ajaxTest() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "hong");
		map.put("name", "홍占썸동");
		return map;
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
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}

}
