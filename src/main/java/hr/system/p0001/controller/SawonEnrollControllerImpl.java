package hr.system.p0001.controller;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hr.system.p0001.dao.SawonEnrollDAO;
import hr.system.p0001.service.SawonEnrollService;
import hr.system.p0001.vo.SawonVO;


@Controller("sawonEnrollController")
public class SawonEnrollControllerImpl implements SawonEnrollController {
	private static final Logger logger = LoggerFactory.getLogger(SawonEnrollControllerImpl.class);
	@Autowired
	private SawonEnrollDAO sawonEnrollDAO;
	@Autowired
	private SawonEnrollService sawonEnrollService;
	
	@Override
	@RequestMapping(value = "/adSawon_Enroll", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("system/p0001/Sawon_Enroll");
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/adSawon_Enroll_searchList", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		// 검색조건설정
		searchMap.put("SAWON_NAME", request.getParameter("SAWON_NAME"));
		searchMap.put("SelectDeptCode", request.getParameter("SelectDeptCode"));
		
		//데이터 조회
		List<SawonVO> data = sawonEnrollService.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/adSawon_Enroll_saveData", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 저장할Daa
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 처리결과
		
		// 로그인한 사원의 아이디값 받아오기
		System.out.println("==============================" + request.getSession().getAttribute("PK_SAWON_CODE").toString());
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        modelMap.addAttribute("PK_SAWON_CODE2", userno); 
		
		// 저장 Data 추출하기
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			sawonEnrollService.saveData(dataMap);	
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

}
