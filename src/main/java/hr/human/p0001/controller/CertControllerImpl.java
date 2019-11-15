package hr.human.p0001.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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

import hr.human.p0001.service.CertService;
import hr.human.p0001.vo.CertVO;

@Controller("h_CertController")
public class CertControllerImpl implements CertController{
	private static final Logger logger = LoggerFactory.getLogger(CertControllerImpl.class);
	@Autowired
	CertService p0001Service;
	@Autowired
	CertVO CardFamVO;
	
		
	// 인사기록카드_면허/자격_조회
			@Override
			@RequestMapping(value = "/human/p0001/ISA_cert.do", method = { RequestMethod.GET, RequestMethod.POST })
			@ResponseBody
			public Map ISA_cert(HttpServletRequest request, HttpServletResponse response) throws Exception {
				request.setCharacterEncoding("utf-8");
				Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
				Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
				// 검색조건설정
				searchMap.put("fk_CERTIFICATE_SAWON_CODE", request.getParameter("fk_CERTIFICATE_SAWON_CODE")); // 변경해야하니 알고있을것
				//데이터 조회
				List<CertVO> data = p0001Service.ISA_cert(searchMap);
				resultMap.put("Data", data);
					      
				return resultMap;
			}

	
	
			// 인사기록카드_면허/자격
			@Override
			@RequestMapping(value = "/human/p0001/insertCert.do", method = { RequestMethod.GET, RequestMethod.POST })
			@ResponseBody
			public Map saveDataCert(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
				String fk_CERT_SAWON_CODE = request.getParameter("fk_CERTIFICATE_SAWON_CODE");  
				
				Map<String, String> result = new HashMap<String, String>();
				try {
					p0001Service.saveDataCert(dataMap, fk_CERT_SAWON_CODE);
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
