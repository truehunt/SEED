package hr.attendance.p0001.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
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
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hr.attendance.p0001.service.day_regist_Service;
import hr.attendance.p0001.vo.day_regist_VO;
import project.common.DateVO;
import project.common.Field3VO;
import project.common.Util4calen;

@Controller("day_regist_Controller")
public class day_regist_ControllerImpl implements day_regist_Controller {
	private static final Logger logger = LoggerFactory.getLogger(day_regist_ControllerImpl.class);
	@Autowired
	day_regist_Service day_regist_Service;
	@Autowired
	day_regist_VO day_regist_VO;

	
	

	// ���ϱ���Ȯ��_(���)
	@Override
	@RequestMapping(value = "Amonth", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView month(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/month";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}


	// ���ϱ���Ȯ��_(���)
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

	
	
	// ���ϱ��µ��_��üȭ��(������)
	@Override
	@RequestMapping(value = "Aday_regist", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView day_regist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/day_regist";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// ���� ��������
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

	// ����/����/�߰� �ٹ���ȸ//연장 근무 조회
	@Override
	@RequestMapping(value = "attendance/p0001/inquery.do", method = { RequestMethod.GET, RequestMethod.POST }) // ���θ�(������
																												// �ּ�)
	public ModelAndView inquery(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0001/inquery";// �����̸�
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	
	@ResponseBody
	@RequestMapping(value = "attendance/p0001/select.do", method = { RequestMethod.GET, RequestMethod.POST },produces="application/text;charset=utf-8")
	// impl �̸� = business
	public String select(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		//viewName = "/attendance/p0001/select";
		request.setCharacterEncoding("utf-8");
		List<HashMap<String,String>> result = day_regist_Service.select();
		ObjectMapper mapper = new ObjectMapper();
		String resultJson=mapper.writeValueAsString(result);
		return resultJson;
		//return main;
	}
	


	// ============================================================================================================
	// ��� ����

	// 조회화면
		@Override
		@RequestMapping(value = "attendance/p0001/searchList_month.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public Map month(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap)
				throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> searchMap = new HashMap<String, Object>(); // �??��조건
			Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
			// �??��조건?��?��
			searchMap.put("fd_year", request.getParameter("fd_year"));
			searchMap.put("option", request.getParameter("option"));
			searchMap.put("sawon_num", request.getParameter("sawon_num"));
			
			// ?��?��?�� 조회
			
			List<day_regist_VO> data = day_regist_Service.searchList_month(searchMap);
			List<DateVO> calenList = new ArrayList<DateVO>();
			Field3VO fld = new Field3VO();
			resultMap.put("Data", data);
			resultMap.put("calenList", calenList);
			return resultMap;
			
		}

		// 조회화면
		@Override
		@RequestMapping(value = "attendance/p0001/searchList_month_click.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public Map month_click(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap)
				throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> searchMap = new HashMap<String, Object>(); // �??��조건
			Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
			// �??��조건?��?��
			searchMap.put("sawon_code", request.getParameter("sawon_code"));
			searchMap.put("fd_year", request.getParameter("fd_year"));
			searchMap.put("option", request.getParameter("option"));
			// ?��?��?�� 조회
			List<day_regist_VO> data = day_regist_Service.searchList_month_click(searchMap);
			List<DateVO> calenList = new ArrayList<DateVO>();
			Field3VO fld = new Field3VO();
			resultMap.put("Data", data);
			resultMap.put("calenList", calenList);
			return resultMap;
			
		}
		
	// 조회화면
	@Override
	@RequestMapping(value = "attendance/p0001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap)
			throws Exception {
		// request.getSession() => 현재 세션이 존재하면 기존 세션 리턴, 없으면 새로생성한 세션 리턴
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();

		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �??��조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과

		// �??��조건?��?��
		searchMap.put("PK_DAILY_TA_WORKING_DATE", request.getParameter("PK_DAILY_TA_WORKING_DATE"));
		searchMap.put("PK_SAWON_CODE", request.getParameter("pk_SAWON_CODE"));
		searchMap.put("work", request.getParameter("work"));
		
		// ?��?��?�� 조회
		
		
		List<day_regist_VO> data = day_regist_Service.searchList(searchMap);
		List<DateVO> calenList = new ArrayList<DateVO>();
		Field3VO fld = new Field3VO();
		fld.setField1(userno);
		resultMap.put("Data", data);
		resultMap.put("calenList", calenList);
		System.out.println("searchMap: " + searchMap);
		
		return resultMap;
	}


	@Override
	@RequestMapping(value = "attendance/p0001/searchList_sawon.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_Sawon(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap)
			throws Exception {
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();

		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �??��조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과

		searchMap.put("PK_SAWON_CODE", request.getParameter("pk_SAWON_CODE"));
		searchMap.put("pk_DAILY_TA_WORKING_DATE", request.getParameter("PK_DAILY_TA_WORKING_DATE"));

		// ?��?��?�� 조회
		List<day_regist_VO> data = day_regist_Service.searchList_sawon(searchMap);
		List<DateVO> calenList = new ArrayList<DateVO>();
		Field3VO fld = new Field3VO();
		fld.setField1(userno);
		resultMap.put("Data", data);
		resultMap.put("calenList", calenList);
		System.out.println("sawon1_2: " + request.getParameter("pk_SAWON_CODE"));
		System.out.println("searchMap: " + searchMap);
		System.out.println("resultMap : " + resultMap);

		return resultMap;

	}

	// 출퇴근 관리 관리자화면
	@Override
	@RequestMapping(value = "attendance/p0001/da_searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map da_searchList(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �??��조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과

		// �??��조건?��?��
		searchMap.put("PK_DAILY_TA_WORKING_DATE2", request.getParameter("PK_DAILY_TA_WORKING_DATE2"));// VO 값 => 넘겨주는 값
		searchMap.put("PK_DAILY_TA_WORKING_DATE3", request.getParameter("PK_DAILY_TA_WORKING_DATE3"));// NO
		searchMap.put("PK_SAWON_CODE", request.getParameter("pk_SAWON_CODE"));
		searchMap.put("sawon_num", request.getParameter("sawon_num"));// NO
		searchMap.put("option",request.getParameter("option"));
		
		System.out.println("searchMap111 : " + request.getParameter("sawon_num"));
		// ?��?��?�� 조회
		List<day_regist_VO> data = day_regist_Service.da_searchList(searchMap);
		System.out.println("searchMap2 : " + searchMap);
		resultMap.put("Data", data);
		System.out.println("searchMap3 : " + searchMap);
		System.out.println("resultMap :" +resultMap);

		return resultMap;
	}

	// �߰�<����x>
	@Override
	@RequestMapping(value = "attendance/p0001/insertData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // ???��?��Daa
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 처리결과

		// ???�� Data 추출?���?
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			System.out.println(name);
			System.out.println(values);
			dataMap.put(name, values);
		}

		Map<String, String> result = new HashMap<String, String>();
		System.out.println("1. " + dataMap);
		try {
			day_regist_Service.saveData(dataMap);
			result.put("Code", "0");
			result.put("Message", "저장을 완료하였습니다");
		} catch (Exception e) {
			result.put("Code", "-1");
			result.put("Message", "저장을 완료하지 못하였습니다");
			e.printStackTrace();
		}

		resultMap.put("Result", result);
		return resultMap;
	}
	
	// �߰�<����x>
		@Override
		@RequestMapping(value = "attendance/p0001/insertData_da.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public Map saveData_da(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, String[]> dataMap = new HashMap<String, String[]>(); // ???��?��Daa
			Map<String, Object> resultMap = new HashMap<String, Object>(); // 처리결과

			// ???�� Data 추출?���?
			Enumeration enu = request.getParameterNames();
			while (enu.hasMoreElements()) {
				String name = (String) enu.nextElement();
				String[] values = request.getParameterValues(name);
				System.out.println(name);
				System.out.println(values);
				dataMap.put(name, values);
			}

			Map<String, String> result = new HashMap<String, String>();
			System.out.println("1. " + dataMap);
			try {
				day_regist_Service.saveData_da(dataMap);
				result.put("Code", "0");
				result.put("Message", "저장을 완료하였습니다");
			} catch (Exception e) {
				result.put("Code", "-1");
				result.put("Message", "저장을 완료하지 못하였습니다");
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
		map.put("name", "ȫ�浿");
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
