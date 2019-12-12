package hr.human.p0002.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hr.human.p0002.service.Bal_Sawon_Service;
import hr.human.p0002.vo.BalVO;
import hr.system.p0001.vo.InsaCodeVO;


@Controller("h_Bal_Sw_Controller")
public class Bal_Sawon_ControllerImpl implements Bal_Sawon_Controller{
	@Autowired
	Bal_Sawon_Service p0002Service;
	@Autowired
	BalVO p0002VO;
	
	// 인사발령 사원별
	@Override
	@RequestMapping(value = "/human/p0002/insa_ballyeong_Sawon.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insaBal_Sawon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/human/p0002/insa_ballyeong_Sawon";
		request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	// 인사발령 호수 popup 페이지
	@Override
	@RequestMapping(value = "/human/p0002/bal_Num_Code.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bal_Num_Code(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/human/p0002/balNum_code_pop";
		request.setCharacterEncoding("utf-8");
		
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	// 발령내역
		@Override
		@RequestMapping(value = "/human/p0002/bal_Content.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView bal_Content(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = getViewName(request);
			viewName = "/human/p0002/bal_Content";
			request.setCharacterEncoding("utf-8");
			
			ModelAndView main = new ModelAndView(viewName);
			return main;
		}
	
	// search > ibsheet : 호수조회
	@Override
	@RequestMapping(value = "/human/p0002/Sawon_BalNum.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map Sawon_BalNum(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("bal_NUM", request.getParameter("bal_NUM"));
		searchMap.put("bal_DIV_CODE", request.getParameter("bal_DIV_CODE"));
		searchMap.put("bal_DATE", request.getParameter("bal_DATE"));
		
		//데이터 조회
		List<BalVO> data = p0002Service.searchNum(searchMap);
	    resultMap.put("Data", data);
	       
	    return resultMap;
	}
	
	// 발령구분 
	@Override
	@RequestMapping(value = "/human/p0002/BalDiv.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map BalDiv(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("bal_NUM", request.getParameter("bal_NUM"));
		
		//데이터 조회
		List<BalVO> data = p0002Service.BalDiv(searchMap);
	    resultMap.put("Data", data);
	       
	    return resultMap;
	}
	
	// 발령일자 및 제목 
	@Override
	@RequestMapping(value = "/human/p0002/BalSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map BalSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("bal_DIV_CODE", request.getParameter("bal_DIV"));
		searchMap.put("bal_NUM", request.getParameter("bal_Number"));
		
		//데이터 조회
		List<BalVO> data = p0002Service.BalSearch(searchMap);
	    resultMap.put("Data", data);
	       
	    return resultMap;
	}
	
	// 발령대상자 
	@Override
	@RequestMapping(value = "/human/p0002/fk_Sawon.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map fk_Sawon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("bal_DIV_CODE", request.getParameter("bal_DIV_CODE"));
		searchMap.put("bal_NUM", request.getParameter("bal_NUM"));
		searchMap.put("bal_DATE", request.getParameter("bal_DATE"));
		searchMap.put("bal_TITLE", request.getParameter("bal_TITLE"));
		searchMap.put("fk_BAL_SAWON_CODE", request.getParameter("fk_BAL_SAWON_CODE"));
		
		//데이터 조회
		List<BalVO> data = p0002Service.fk_Sawon(searchMap);
	    resultMap.put("Data", data);
	       
	    return resultMap;
	}
	
//========================================================================================================================	
	// 발령내역 
	@Override
	@RequestMapping(value = "/human/p0002/BalContent.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map BalContent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		String fk_PERSON_BC_CODE_NUM = "HF";
		searchMap.put("fk_PERSON_BC_CODE_NUM", fk_PERSON_BC_CODE_NUM);
		
		//데이터 조회
		List<BalVO> data = p0002Service.BalContent(searchMap);
	    resultMap.put("Data", data);
	       
	    return resultMap;
	}
	
	// 현 정보 
		@Override
		@RequestMapping(value = "/human/p0002/EM_INFO.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public Map EM_INFO(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
			Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
			// 검색조건설정
			String info = null;
			System.out.println("Code값은? -------- "+request.getParameter("Code"));
			if("B01".equals(request.getParameter("Code"))) {
				info = "dept_NAME";
			}else if("B02".equals(request.getParameter("Code"))) {
				info = "em_INFO_WORK_GROUP_CD";
			}else if("B03".equals(request.getParameter("Code"))) {
				info = "em_INFO_PROJECT_NAME";
			}else if("B04".equals(request.getParameter("Code"))) {
				info = "em_INFO_OFFI_DIVISION";
			}else if("B05".equals(request.getParameter("Code"))) {
				info = "em_INFO_EMPLY_FORM_NM";
			}else if("B06".equals(request.getParameter("Code"))) {
				info = "occupation_NAME";
			}else if("B07".equals(request.getParameter("Code"))) {
				info = "rank_NAME";
			}else if("B08".equals(request.getParameter("Code"))) {
				info = "fk_HOBONG_CODE";
			}else {
				return null;
			}
			
			System.out.println("들어온 값 확인 ==================== " + info);
			searchMap.put("info", info);
			searchMap.put("sawon", request.getParameter("Sawon"));
			
			//데이터 조회
			List<BalVO> data = p0002Service.EM_INFO(searchMap);
		    resultMap.put("Data", data);
		       
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
