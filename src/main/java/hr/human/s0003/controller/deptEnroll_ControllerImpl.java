package hr.human.s0003.controller;

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

import hr.human.s0003.service.deptEnroll_Service;
import hr.human.s0003.vo.DeptEnroll_VO;

@Controller("addeptEnroll_Controller")
public class deptEnroll_ControllerImpl implements deptEnroll_Controller {
   private static final Logger logger = LoggerFactory.getLogger(deptEnroll_ControllerImpl.class);
   @Autowired
   deptEnroll_Service deptEnroll_Service;
   @Autowired
   DeptEnroll_VO DeptEnroll_VO;
   
   @Override
   @RequestMapping(value = "/human/s0003/init.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = getViewName(request);
      viewName = "/human/s0003/init";
      request.setCharacterEncoding("utf-8");
      //ModelAndView main = new ModelAndView("hr/p0001_init");
      ModelAndView main = new ModelAndView(viewName);
      return main;
   }
   
   @Override
   @RequestMapping(value = "/human/s0003/dept_Enroll.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView dept_Enroll(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = getViewName(request);
      viewName = "/human/s0003/dept_Enroll";
      request.setCharacterEncoding("utf-8");
      //ModelAndView main = new ModelAndView("hr/p0001_init");
      ModelAndView main = new ModelAndView(viewName);
      return main;
   }

   @Override
   @RequestMapping(value = "/human/s0003/ibsheet.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView ibSheet(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = getViewName(request);
      viewName = "/human/s0003/ibsheet_basic";
      request.setCharacterEncoding("utf-8");
      //ModelAndView main = new ModelAndView("hr/p0001_init");
      ModelAndView main = new ModelAndView(viewName);
      return main;
   }
   
   @Override
   @RequestMapping(value = "/human/s0003/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
      
      // 검색조건설정
      //searchMap.put("pk_company_code", request.getParameter("p_id"));
      
      //데이터 조회
      List<DeptEnroll_VO> data = deptEnroll_Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
   }
   
   @Override
   @RequestMapping(value = "/human/s0003/insertData.do", method = { RequestMethod.GET, RequestMethod.POST })
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
    	 deptEnroll_Service.saveData(dataMap);   
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