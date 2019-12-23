package hr.human.p0002.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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

import hr.human.p0002.service.BalService;
import hr.human.p0002.service.Bal_Sawon_Service;
import hr.human.p0002.vo.BalVO;
import hr.system.p0001.vo.InsaCodeVO;


@Controller("h_Bal_Sw_Controller")
public class Bal_Sawon_ControllerImpl implements Bal_Sawon_Controller{
	@Autowired
	Bal_Sawon_Service p0002Service;
	@Autowired
	BalService BalService;
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
	
// ==============================================================================================
	
	// 인사기록카드 인사발령조회
	@Override
	@RequestMapping(value = "/human/p0002/ISA_bal.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map ISA_bal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("fk_BAL_SAWON_CODE", request.getParameter("fk_BAL_SAWON_CODE"));
		
		//데이터 조회
		List<BalVO> data = p0002Service.ISA_bal(searchMap);
	    resultMap.put("Data", data);
	    return resultMap;
	}
	
// ==============================================================================================
	
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
	
	// 현정보
	@Override
	@RequestMapping(value = "/human/p0002/Content_Div.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map Content_Div(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		String result = request.getParameter("bal_DETAILS");
		String info = null;
		
		if("근무조".equals(request.getParameter("bal_DETAILS"))) {
			info = "em_INFO_WORK_GROUP_CD";
		}else if("프로젝트".equals(request.getParameter("bal_DETAILS"))) {
			info = "em_INFO_PROJECT_NAME";
		}else if("재직구분".equals(request.getParameter("bal_DETAILS"))) {
			info = "em_INFO_OFFI_DIVISION";
		}else if("고용구분".equals(request.getParameter("bal_DETAILS"))) {
			info = "em_INFO_EMPLY_FORM_NM";
		}else if("직종".equals(request.getParameter("bal_DETAILS"))) {
			info = "occupation_NAME";
		}
		searchMap.put("fk_BAL_SAWON_CODE", request.getParameter("fk_BAL_SAWON_CODE"));
		searchMap.put("bal_DETAILS", request.getParameter("bal_DETAILS"));
		searchMap.put("info", info);
		
		
		//데이터 조회
		List<BalVO> data = p0002Service.Content_Div(searchMap);
	    resultMap.put("Data", data);
	    resultMap.put("result", result);
	    
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
		if("부서".equals(request.getParameter("Code"))) {
			info = "dept_NAME";
		}else if("근무조".equals(request.getParameter("Code"))) {
			info = "em_INFO_WORK_GROUP_CD";
		}else if("프로젝트".equals(request.getParameter("Code"))) {
			info = "em_INFO_PROJECT_NAME";
		}else if("재직구분".equals(request.getParameter("Code"))) {
			info = "em_INFO_OFFI_DIVISION";
		}else if("고용구분".equals(request.getParameter("Code"))) {
			info = "em_INFO_EMPLY_FORM_NM";
		}else if("직종".equals(request.getParameter("Code"))) {
			info = "occupation_NAME";
		}else if("직급".equals(request.getParameter("Code"))) {
			info = "rank_NAME";
		}else if("호봉".equals(request.getParameter("Code"))) {
			info = "fk_HOBONG_CODE";
		}else {
			return null;
		}
		
		searchMap.put("info", info);
		searchMap.put("sawon", request.getParameter("Sawon"));
		
		//데이터 조회
		List<BalVO> data = p0002Service.EM_INFO(searchMap);
	    resultMap.put("Data", data);
	       
	    return resultMap;
	}
	
	// 발령후 정보 (pop창)
	@Override
	@RequestMapping(value = "/human/p0002/BalAfter_INFO.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map BalAfter_INFO(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과

		// 검색조건설정
		String Code = null;
		// 부서와 프로젝트를 제외한 나머지 일 경우
		if("부서".equals(request.getParameter("Num_code"))) {
			//데이터 조회
			List<BalVO> data = p0002Service.BalAfter_INFO(searchMap);
		    resultMap.put("Data", data);
		}else {
			if("근무조".equals(request.getParameter("Num_code"))) {
				Code = "02"; // 근무조
			}else if("재직구분".equals(request.getParameter("Num_code"))) {
				Code = "HE"; // 재직구분
			}else if("고용구분".equals(request.getParameter("Num_code"))) {
				Code = "G1"; // 고용구분
			}else if("직종".equals(request.getParameter("Num_code"))) {
				Code = "G2"; // 직종
			}else if("직급".equals(request.getParameter("Num_code"))) {
				Code = "G4"; // 직급
			}else if("호봉".equals(request.getParameter("Num_code"))) {
				Code = "PE"; // 호봉
			}
			searchMap.put("fk_PERSON_BC_CODE_NUM", Code);
			
			//데이터 조회
			List<InsaCodeVO> data = BalService.Code(searchMap);
		    resultMap.put("Data", data);
		}
	       
	    return resultMap;
	}
	
	
	//----------------------------------------------------- 발령정보 저장
	@Override
	@RequestMapping(value = "/human/p0002/balContentSave.do", method = { RequestMethod.GET, RequestMethod.POST })
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
	
	// 적용버튼 클릭시 돌아가는 공간
	@Override
	@RequestMapping(value = "/human/p0002/ContentSave.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map ContentSave(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		String info = null;
		
		if("근무조".equals(request.getParameter("bal_DETAILS"))) {
			info = "em_INFO_WORK_GROUP_CD";
		}else if("프로젝트".equals(request.getParameter("bal_DETAILS"))) {
			info = "em_INFO_PROJECT_NAME";
		}else if("재직구분".equals(request.getParameter("bal_DETAILS"))) {
			info = "em_INFO_OFFI_DIVISION";
		}else if("고용구분".equals(request.getParameter("bal_DETAILS"))) {
			info = "em_INFO_EMPLY_FORM_NM";
		}else if("직종".equals(request.getParameter("bal_DETAILS"))) {
			info = "occupation_NAME";
		}
		
		searchMap.put("fk_BAL_SAWON_CODE", request.getParameter("fk_BAL_SAWON_CODE")); // 사원코드
		searchMap.put("bal_DETAILS", request.getParameter("bal_DETAILS")); // 발령내역
		searchMap.put("info", info); // 발령내역
		searchMap.put("bal_INFO", request.getParameter("bal_INFO")); // 현정보
		searchMap.put("button", request.getParameter("button")); // 버튼값
		searchMap.put("pk_BAL_CODE", request.getParameter("pk_BAL_CODE")); // pk값
		
		//데이터 조회
		List<BalVO> data = p0002Service.ContentSave(searchMap);
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
