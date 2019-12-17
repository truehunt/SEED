package hr.system.p0002.controller;

import java.io.File;
import java.io.IOException;
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

import hr.system.p0002.service.Insa_infoEnroll_Service;
import hr.elect.p0002.vo.SignImageVO;
import hr.system.p0001.vo.SawonVO;
import hr.system.p0002.vo.Insa_personEnroll_VO;//인적정보
import hr.system.p0002.vo.Insa_emEnroll_VO;//재직 정보
import hr.system.p0002.vo.Insa_salEnroll_VO;//급여 정보
import hr.system.p0002.vo.Insa_popup_VO;//공통 팝업
import hr.system.p0002.dao.Insa_infoEnroll_DAO;
import project.common.FileUtil;
import project.common.FileVO;

@Controller("adInsa_infoEnroll_Controller")
public class Insa_infoEnroll_ControllerImpl implements Insa_infoEnroll_Controller {
   private static final Logger logger = LoggerFactory.getLogger(Insa_infoEnroll_ControllerImpl.class);
   @Autowired
   Insa_infoEnroll_Service Insa_infoEnroll_Service;
   @Autowired
   SawonVO SawonVO;
   Insa_personEnroll_VO Insa_personEnroll_VO;
   Insa_emEnroll_VO Insa_emEnroll_VO;
   Insa_salEnroll_VO Insa_salEnroll_VO;
   Insa_popup_VO Insa_popup_VO;
   @Autowired
   Insa_infoEnroll_DAO Insa_infoEnroll_DAO; 
   
   @Override
   @RequestMapping(value = "/system/p0002/init.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = getViewName(request);
      viewName = "/system/p0002/init";
      request.setCharacterEncoding("utf-8");
      //ModelAndView main = new ModelAndView("hr/p0001_init");
      ModelAndView main = new ModelAndView(viewName);
      return main;
   }
   
   @Override // 인사정보등록
   @RequestMapping(value = "/system/p0002/Insa_infoEnroll.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView Insa_infoEnroll(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = getViewName(request);
      viewName = "/system/p0002/Insa_infoEnroll";
      request.setCharacterEncoding("utf-8");
      //ModelAndView main = new ModelAndView("hr/p0001_init");
      ModelAndView main = new ModelAndView(viewName);
      return main;
   }
   
   @Override // 인사정보등록-인적 정보
   @RequestMapping(value = "/system/p0002/Insa_personEnroll.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView Insa_personEnroll(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = getViewName(request);
      viewName = "/system/p0002/Insa_personEnroll";
      request.setCharacterEncoding("utf-8");
      //ModelAndView main = new ModelAndView("hr/p0001_init");
      ModelAndView main = new ModelAndView(viewName);
      return main;
   }
   
   @Override //인사정보등록-재직 정보
   @RequestMapping(value = "/system/p0002/Insa_emEnroll.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView Insa_emEnroll(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = getViewName(request);
      viewName = "/system/p0002/Insa_emEnroll";
      request.setCharacterEncoding("utf-8");
      //ModelAndView main = new ModelAndView("hr/p0001_init");
      ModelAndView main = new ModelAndView(viewName);
      return main;
   }
   
   @Override // 인사정보등록-급여 정보
   @RequestMapping(value = "/system/p0002/Insa_salEnroll.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView Insa_salEnroll(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = getViewName(request);
      viewName = "/system/p0002/Insa_salEnroll";
      request.setCharacterEncoding("utf-8");
      //ModelAndView main = new ModelAndView("hr/p0001_init");
      ModelAndView main = new ModelAndView(viewName);
      return main;
   }
   
   @Override // 인사정보등록-공통 팝업
   @RequestMapping(value = "/system/p0002/Modal_Popup.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView Modal_Popup(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = getViewName(request);
      viewName = "/system/p0002/Modal_Popup";
      request.setCharacterEncoding("utf-8");
      //ModelAndView main = new ModelAndView("hr/p0001_init");
      ModelAndView main = new ModelAndView(viewName);
      return main;
   }
   
   @Override // 인사정보등록-부서 팝업
   @RequestMapping(value = "/system/p0002/Modal_Popup_Dept.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView Modal_Popup_Dept(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = getViewName(request);
      viewName = "/system/p0002/Modal_Popup_Dept";
      request.setCharacterEncoding("utf-8");
      //ModelAndView main = new ModelAndView("hr/p0001_init");
      ModelAndView main = new ModelAndView(viewName);
      return main;
   }

   @Override
   @RequestMapping(value = "/system/p0002/ibsheet.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView ibSheet(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = getViewName(request);
      viewName = "/system/p0002/ibsheet_basic";
      request.setCharacterEncoding("utf-8");
      //ModelAndView main = new ModelAndView("hr/p0001_init");
      ModelAndView main = new ModelAndView(viewName);
      return main;
   }
   
   @Override // 인사정보등록
   @RequestMapping(value = "/system/p0002/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
      
      // 검색조건설정
      //searchMap.put("pk_company_code", request.getParameter("p_id"));
      System.out.println("command 확인 : "+ request.getParameter("command"));
      System.out.println("sawon_search 확인 : "+ request.getParameter("sawon_search"));
      
      searchMap.put("command", request.getParameter("command"));
      searchMap.put("sawon_search", request.getParameter("sawon_search"));
      
      //데이터 조회
      List<SawonVO> data = Insa_infoEnroll_Service.searchList(searchMap);
      	resultMap.put("Data", data);
      	
        return resultMap;
   }
   
   @Override // 인사정보등록-인적 정보
   @RequestMapping(value = "/system/p0002/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
      
      System.out.println("sawonController1 : "+ request.getParameter("sawon_code"));
      // 검색조건설정
      searchMap.put("sawon_code", request.getParameter("sawon_code"));
      System.out.println("sawonController2 ="+searchMap);
      
      //데이터 조회
      List<Insa_personEnroll_VO> data = Insa_infoEnroll_Service.searchList2(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
   }
   
   @Override // 인사정보등록-재직 정보
   @RequestMapping(value = "/system/p0002/searchList3.do", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public Map searchList3(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
      
      System.out.println("sawonController3 : "+ request.getParameter("sawon_code"));
      // 검색조건설정
      searchMap.put("sawon_code", request.getParameter("sawon_code"));
      System.out.println("sawonController4 ="+searchMap);
      
      //데이터 조회
      List<Insa_emEnroll_VO> data = Insa_infoEnroll_Service.searchList3(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
   }
   
   @Override // 인사정보등록-급여 정보
   @RequestMapping(value = "/system/p0002/searchList4.do", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public Map searchList4(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
      
      System.out.println("sawonController5 : "+ request.getParameter("sawon_code"));
      // 검색조건설정
      searchMap.put("sawon_code", request.getParameter("sawon_code"));
      System.out.println("sawonController6 ="+searchMap);
      
      
      //데이터 조회
      List<Insa_salEnroll_VO> data = Insa_infoEnroll_Service.searchList4(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
   }
   
   @Override // 인사정보등록-공통 팝업
   @RequestMapping(value = "/system/p0002/common_pop.do", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public Map common_pop(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
      
      searchMap.put("code_division", request.getParameter("code_division"));
      
      //데이터 조회
      List<Insa_popup_VO> data = Insa_infoEnroll_Service.common_pop(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
   }
   
   @Override // 인사정보등록-부서 팝업
   @RequestMapping(value = "/system/p0002/dept_pop.do", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public Map dept_pop(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
      
      //searchMap.put("code_division", request.getParameter("code_division"));
      
      //데이터 조회
      List<Insa_popup_VO> data = Insa_infoEnroll_Service.dept_pop(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
   }
   
   @Override // 인사정보등록
   @RequestMapping(value = "/system/p0002/insertData.do", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 저장할Data
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
    	  Insa_infoEnroll_Service.saveData(dataMap);   
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
   
   @Override // 인사정보등록-인적 정보
   @RequestMapping(value = "/system/p0002/insertData2.do", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public Map saveData2(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 저장할Data
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
    	  Insa_infoEnroll_Service.saveData2(dataMap);   
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
   
   @Override // 인사정보등록-재직 정보
   @RequestMapping(value = "/system/p0002/insertData3.do", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public Map saveData3(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 저장할Data
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
    	  Insa_infoEnroll_Service.saveData3(dataMap);   
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
   
   @Override // 인사정보등록-급여 정보
   @RequestMapping(value = "/system/p0002/insertData4.do", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public Map saveData4(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 저장할Data
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
    	  Insa_infoEnroll_Service.saveData4(dataMap);   
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
   
   /**
    * 결재이미지 저장, 업데이트.
    */
	@RequestMapping(value = "/system/p0002/imageSave")
	@ResponseBody
   public String imageSave(HttpServletRequest request,  HttpServletResponse response , SignImageVO signImageInfo)  throws IOException  {
		response.setContentType("text/html;charset=utf-8");
		
 		String sawon_code = request.getParameter("pk_sawon_code");
 	    
 		System.out.println("sawon_code = "+sawon_code);
 		
 		signImageInfo.setPK_SAWON_CODE(sawon_code);
 		
 		FileUtil fs = new FileUtil();
 	       
 		FileVO fileInfo = fs.saveImage(signImageInfo.getPhotofile());
 		if (fileInfo != null) {
 			signImageInfo.setPhoto(fileInfo.getRealname());
 			Insa_infoEnroll_DAO.updateSignImage(signImageInfo);
 		}
 		
 		String photo = signImageInfo.getPhoto();
       System.out.println(photo);
       
 		return photo;
   }

	//이미지
	@RequestMapping(value = "/system/p0002/imageDelete")
	@ResponseBody
   public void imageDelete(HttpServletRequest request,  HttpServletResponse response , SignImageVO signImageInfo)  throws IOException  {
		response.setContentType("text/html;charset=utf-8");
		
 		String userno = request.getParameter("PK_SAWON_CODE");
 		System.out.println("확인중..." + userno);
 		Insa_infoEnroll_DAO.deleteSignImage(signImageInfo);
       
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