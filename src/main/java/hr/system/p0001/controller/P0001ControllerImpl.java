package hr.system.p0001.controller;

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
import javax.servlet.http.Cookie;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hr.system.p0001.service.P0001Service;
import hr.system.p0001.vo.LoginVO;
import hr.system.p0001.vo.SawonVO;

@Controller("p0001Controller")
public class P0001ControllerImpl implements P0001Controller {
	private static final Logger logger = LoggerFactory.getLogger(P0001ControllerImpl.class);
	private static final Integer cookieExpire = 60 * 60 * 24 * 30; // 1 month
	
	@Autowired
	P0001Service p0001Service;
	@Autowired
	SawonVO sawonVO;
	
	@Override
	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception {
		
		String    userid = get_cookie("sid", request);    
        modelMap.addAttribute("PK_SAWON_CODE", userid);
		
		String viewName = getViewName(request);
		viewName = "/login/*";
		request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	/**
     * 로그인 처리.
     */
    @RequestMapping(value = "memberLoginChk")
    public String memberLoginChk(HttpServletRequest request,HttpServletResponse response, LoginVO loginInfo, ModelMap modelMap) {

    	SawonVO mdo = p0001Service.selectMember4Login(loginInfo);
        
        if (mdo  ==  null) {
            modelMap.addAttribute("msg", "로그인 할 수 없습니다.");
            return "common/message";
        }
        
        p0001Service.insertLogIn(mdo.getPK_SAWON_CODE());
        
        HttpSession session = request.getSession();
        
        session.setAttribute("PK_SAWON_CODE", mdo.getPK_SAWON_CODE());
        session.setAttribute("SAWON_VIEW_PERMISSION",mdo.getSAWON_VIEW_PERMISSION());
        session.setAttribute("SAWON_NAME",  mdo.getSAWON_NAME());
        
        if ("Y".equals(loginInfo.getRemember())) {
            set_cookie("sid", loginInfo.getPK_SAWON_CODE(), response);
        } else { 
            set_cookie("sid", "", response);       
        }
        
        return "redirect:/index";
    }
    
    /**
     * 로그아웃.
     */
    @RequestMapping(value = "memberLogout")
    public String memberLogout(HttpServletRequest request, ModelMap modelMap) {
        HttpSession session = request.getSession();
        
        String userno = session.getAttribute("PK_SAWON_CODE").toString();
        
        p0001Service.insertLogOut(userno);
        
        session.removeAttribute("PK_SAWON_CODE"); 
        session.removeAttribute("SAWON_VIEW_PERMISSION");        
        session.removeAttribute("SAWON_NAME");        
        
        return "redirect:/login.do";
    }
    
    
    /** 
     * 사용자가 관리자페이지에 접근하면 오류 출력.
     */
    @RequestMapping(value = "noAuthMessage")
    public String noAuthMessage(HttpServletRequest request) {
        return "common/noAuth";
    }
  
    /*
     * -------------------------------------------------------------------------
     */
    /**
     * 쿠키 저장.     
     */
    public static void set_cookie(String cid, String value, HttpServletResponse res) {

        Cookie ck = new Cookie(cid, value);
        ck.setPath("/");
        ck.setMaxAge(cookieExpire);
        res.addCookie(ck);        
    }

    /**
     * 쿠키 가져오기.     
     */
    public static String get_cookie(String cid, HttpServletRequest request) {
        String ret = "";

        if (request == null) {
            return ret;
        }
        
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return ret;
        }
        
        for (Cookie ck : cookies) {
            if (ck.getName().equals(cid)) {
                ret = ck.getValue();
                
                ck.setMaxAge(cookieExpire);
                break; 
            }
          }
        return ret; 
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
