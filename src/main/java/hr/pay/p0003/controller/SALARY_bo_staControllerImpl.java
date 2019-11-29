package hr.pay.p0003.controller;

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

import hr.pay.p0001.vo.TA_inputVO;
import hr.pay.p0002.vo.SALARY_calculVO;
import hr.pay.p0003.service.SALARY_bo_staService;
import hr.pay.p0003.vo.SALARY_bo_staVO;




@Controller("SALARY_bo_staController")
public class SALARY_bo_staControllerImpl implements SALARY_bo_staController {
	private static final Logger logger = LoggerFactory.getLogger(SALARY_bo_staControllerImpl.class);
	@Autowired
	SALARY_bo_staService SALARY_bo_staService;
	@Autowired
	SALARY_bo_staVO SALARY_bo_staVO;
	
	@Override
	@RequestMapping(value = "/pay/p0003/init.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		//ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView("pay/p0003/SALARY_bo_sta");
		return main;
	}
	
	@Override
	@RequestMapping(value = "/pay/p0003/calendar.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Calendar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "pay/p0003/calendar";
		request.setCharacterEncoding("utf-8");
		//ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	@Override
	@RequestMapping(value = "/pay/p0003/SALARY_bo_sta.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ibSheet(HttpServletRequest request, HttpServletResponse response) throws Exception {
	request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView("pay/p0003/SALARY_bo_sta");
		return main;
	}
	
	@Override
	@RequestMapping(value = "/pay/p0003/calendar2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Calendar2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "pay/p0003/calendar2";
		request.setCharacterEncoding("utf-8");
		//ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	
	
	
	
	@Override
	@RequestMapping(value = "/pay/SALARY_bo_sta/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �뇦猿볦삕�뜝�럡�돰�댖怨뚰�쀦뤃?
		Map<String, Object> resultMap = new HashMap<String, Object>(); // �댖怨뚰��?�뤂�뇦猿됲��?沅�
		
		// �뇦猿볦삕�뜝�럡�돰�댖怨뚰�쀦뤃酉귥삕�땻類㏃삕?�젧
		searchMap.put("SAL_INFO_TRANS_AMOUNT_O", request.getParameter("SAL_INFO_TRANS_AMOUNT_O"));
		searchMap.put("FK_SALARY_CAL_SAWON_CODE", request.getParameter("FK_SALARY_CAL_SAWON_CODE"));
	
		searchMap.put("SAL_INFO_ACC_NUM_ONE", request.getParameter("SAL_INFO_ACC_NUM_ONE"));
		searchMap.put("SALARY_CAL_PAYMENTDAY", request.getParameter("SALARY_CAL_PAYMENTDAY"));

		
		searchMap.put("fk_TA_SAWON_CODE", request.getParameter("fk_TA_SAWON_CODE"));
		searchMap.put("ta_SAWON_NAME", request.getParameter("ta_SAWON_NAME"));

		searchMap.put("pk_TA_WORKPLACE_CODE", request.getParameter("pk_TA_WORKPLACE_CODE"));
		
		searchMap.put("fk_SAWON_CODE", request.getParameter("fk_SAWON_CODE"));
		
		searchMap.put("TA_ATTRIBUTION", request.getParameter("TA_ATTRIBUTION"));
		searchMap.put("TA_PAYMENTDAY", request.getParameter("TA_PAYMENTDAY"));
		
		searchMap.put("FK_WORKPLACE_CODE", request.getParameter("FK_WORKPLACE_CODE"));
		searchMap.put("FK_SAWON_WORKPLACE_CODE", request.getParameter("FK_SAWON_WORKPLACE_CODE"));
		searchMap.put("PK_DEPT_CODE", request.getParameter("PK_DEPT_CODE"));
		searchMap.put("FK_DEPT_CODE", request.getParameter("FK_DEPT_CODE"));
		searchMap.put("PK_WORKPLACE_CODE", request.getParameter("PK_WORKPLACE_CODE"));
		
		
		

		//�뜝�럥�몥�뜝�럩逾졾뜝�럡�댉 �댖怨뚰��?�뤂
		List<SALARY_bo_staVO> data = SALARY_bo_staService.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	

	
	@Override
	@RequestMapping(value = "/pay/SALARY_bo_sta/SiteList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map SiteList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 野껓옙占쎄퉳鈺곌퀗援?
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 鈺곌퀬?돳野껉퀗?궢
		
		// 野껓옙占쎄퉳鈺곌퀗援뷂옙苑뺧옙?젟
		
		searchMap.put("FK_SAWON_WORKPLACE_CODE", request.getParameter("FK_SAWON_WORKPLACE_CODE"));

		searchMap.put("SAL_INFO_TRANS_AMOUNT_O", request.getParameter("SAL_INFO_TRANS_AMOUNT_O"));
		searchMap.put("FK_SALARY_CAL_SAWON_CODE", request.getParameter("FK_SALARY_CAL_SAWON_CODE"));
	
		searchMap.put("SAL_INFO_ACC_NUM_ONE", request.getParameter("SAL_INFO_ACC_NUM_ONE"));
		
		
		searchMap.put("FK_WORKPLACE_CODE", request.getParameter("FK_WORKPLACE_CODE"));
		searchMap.put("FK_SAWON_WORKPLACE_CODE", request.getParameter("FK_SAWON_WORKPLACE_CODE"));
		searchMap.put("PK_DEPT_CODE", request.getParameter("PK_DEPT_CODE"));
		searchMap.put("FK_DEPT_CODE", request.getParameter("FK_DEPT_CODE"));
		
		//占쎈쑓占쎌뵠占쎄숲 鈺곌퀬?돳
		List<SALARY_bo_staVO> data = SALARY_bo_staService.SiteList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/pay/SALARY_bo_sta/DeptList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map DeptList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 野껓옙占쎄퉳鈺곌퀗援?
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 鈺곌퀬?돳野껉퀗?궢
		
		// 野껓옙占쎄퉳鈺곌퀗援뷂옙苑뺧옙?젟
		
		searchMap.put("pk_WORKPLACE_CODE", request.getParameter("SiteList"));

		
		//占쎈쑓占쎌뵠占쎄숲 鈺곌퀬?돳
		List<SALARY_bo_staVO> data = SALARY_bo_staService.DeptList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/pay/SALARY_bo_sta/DeptList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map DeptList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 野껓옙占쎄퉳鈺곌퀗援?
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 鈺곌퀬?돳野껉퀗?궢
		
		// 野껓옙占쎄퉳鈺곌퀗援뷂옙苑뺧옙?젟
		
		searchMap.put("pk_WORKPLACE_CODE", request.getParameter("SiteList"));
		searchMap.put("fk_DEPT_CODE", request.getParameter("SiteList"));
		searchMap.put("workplace_INQUIRY_CODE", request.getParameter("SiteList"));
		searchMap.put("dept_INQUIRY_CODE", request.getParameter("SiteList"));
		
		//占쎈쑓占쎌뵠占쎄숲 鈺곌퀬?돳
		List<SALARY_bo_staVO> data = SALARY_bo_staService.DeptList2(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/pay/SALARY_bo_sta/yearday.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map yearday(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 野껓옙占쎄퉳鈺곌퀗援?
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 鈺곌퀬?돳野껉퀗?궢
		
		// 野껓옙占쎄퉳鈺곌퀗援뷂옙苑뺧옙?젟
	

		
		//占쎈쑓占쎌뵠占쎄숲 鈺곌퀬?돳
		List<SALARY_bo_staVO> data = SALARY_bo_staService.yearday(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	
	
	@Override
	@RequestMapping(value = "/pay/SALARY_bo_sta/yeardayd.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map yeardayd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 野껓옙占쎄퉳鈺곌퀗援?
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 鈺곌퀬?돳野껉퀗?궢
		
		// 野껓옙占쎄퉳鈺곌퀗援뷂옙苑뺧옙?젟
		
		searchMap.put("pk_D_B_PAYMENT_SEQ_CODE", request.getParameter("yearday"));
		

		
		//占쎈쑓占쎌뵠占쎄숲 鈺곌퀬?돳
		List<SALARY_bo_staVO> data = SALARY_bo_staService.yeardayd(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	
	
	
	
	@Override
	@RequestMapping(value = "/pay/SALARY_bo_sta/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // �뜝�룞�삕�뜝�럩�궋�뜝�럥留덬aa
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 嶺뚳퐣瑗�?遊븅뇦猿됲��?沅�
		
		// �뜝�룞�삕�뜝�럩�궋 Data ?鍮딃겫�슧�긷뜝�럥由��뼨�먯삕
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			SALARY_bo_staService.saveData(dataMap);	
			result.put("Code","0");
			result.put("Message","���옣�릺�뿀�뒿�땲�떎.");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","�삤瑜섍� 諛쒖깮�븯���뒿�땲�떎.");
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
