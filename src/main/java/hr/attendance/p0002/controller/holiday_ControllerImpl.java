package hr.attendance.p0002.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hr.attendance.p0002.vo.business_VO;
import hr.attendance.p0002.vo.holiday_VO;
import hr.attendance.p0001.vo.day_regist_VO;
import hr.attendance.p0002.service.holiday_Service;
import project.common.DateVO;
import project.common.Field3VO;

@Controller("holiday_Controller")
public class holiday_ControllerImpl implements holiday_Controller {
	private static final Logger logger = LoggerFactory.getLogger(holiday_ControllerImpl.class);
	@Autowired
	holiday_Service holiday_Service;
	@Autowired
	holiday_VO holiday_VO;
	business_VO business_VO;

	// ��ü ���� ȭ��
	
	// �ް���û
	@Override
	@RequestMapping(value = "attendance/p0002/holiday.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView holiday(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "attendance/p0002/holiday";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// �����û
	@Override
	@RequestMapping(value = "attendance/p0002/business.do", method = { RequestMethod.GET, RequestMethod.POST })
	// impl �̸� = business
	public ModelAndView business(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "attendance/p0002/business";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// �ܱٽ�û
	@Override
	@RequestMapping(value = "attendance/p0002/outside.do", method = { RequestMethod.GET, RequestMethod.POST })
	// impl �̸� = business
	public ModelAndView outside(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "attendance/p0002/outside";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}

	// �ް��ϼ� ���
	@Override
	@RequestMapping(value = "attendance/p0002/holiday_calc.do", method = { RequestMethod.GET, RequestMethod.POST })
	// impl �̸� = business
	public ModelAndView holiday_calc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/attendance/p0002/holiday_calc";
		request.setCharacterEncoding("utf-8");
		// ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}


	@ResponseBody
	@RequestMapping(value = "attendance/p0002/select.do", method = { RequestMethod.GET, RequestMethod.POST },produces="application/text;charset=utf-8")
	// impl �̸� = business
	public String select(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		//viewName = "/attendance/p0001/select";
		request.setCharacterEncoding("utf-8");
		List<HashMap<String,String>> result = holiday_Service.select();
		ObjectMapper mapper = new ObjectMapper();
		String resultJson=mapper.writeValueAsString(result);
		return resultJson;
		//return main;
	}

	// ============================================================================================================
	// ��� ����

	// 출장 조회화면
	@Override
	@RequestMapping(value = "attendance/p0002/searchList_busin.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_busin(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap)
			throws Exception {
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();

		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �??��조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과

		searchMap.put("PK_SAWON_CODE", request.getParameter("pk_SAWON_CODE"));

		// ?��?��?�� 조회
		List<business_VO> data = holiday_Service.searchList_busin(searchMap);
		List<DateVO> calenList = new ArrayList<DateVO>();
		Field3VO fld = new Field3VO();
		fld.setField1(userno);
		resultMap.put("Data", data);
		resultMap.put("calenList", calenList);
		System.out.println("business_con: " + request.getParameter("pk_SAWON_CODE"));
		System.out.println("searchMap: " + searchMap);
		System.out.println("resultMap : " + resultMap);

		return resultMap;

	}
	
	



	@Override
	@RequestMapping(value = "attendance/p0002/searchList_holi.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_holi(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap)
			throws Exception {
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();

		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �??��조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과

		searchMap.put("PK_SAWON_CODE", request.getParameter("pk_SAWON_CODE"));

		// ?��?��?�� 조회
				List<holiday_VO> data = holiday_Service.searchList_holi(searchMap);
				List<DateVO> calenList = new ArrayList<DateVO>();
				Field3VO fld = new Field3VO();
				fld.setField1(userno);
				resultMap.put("Data", data);
//				resultMap.put("calenList", calenList);
				System.out.println("holiday_controller: " + request.getParameter("pk_SAWON_CODE"));
				System.out.println("searchMap: " + searchMap);
				System.out.println("resultMap : " + data);
				return resultMap;

			}


	
		// �߰�<����x>
		@Override
		@RequestMapping(value = "attendance/p0002/insertData_holi.do", method = { RequestMethod.GET, RequestMethod.POST })
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
				System.out.println("controller_name :" + name);
				System.out.println("controller_values :" +values);
				dataMap.put(name, values);
			}

			Map<String, String> result = new HashMap<String, String>();
			System.out.println("1. " + dataMap);
			try {
				holiday_Service.saveData(dataMap);
				result.put("Code", "0");
				result.put("Message", "???��?��?��?��?��?��");
			} catch (Exception e) {
				result.put("Code", "-1");
				result.put("Message", "???��?�� ?��?��?��???��?��?��");
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
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}

}
