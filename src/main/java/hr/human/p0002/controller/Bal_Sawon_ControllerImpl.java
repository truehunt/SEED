package hr.human.p0002.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller("h_Bal_Sw_Controller")
public class Bal_Sawon_ControllerImpl implements Bal_Sawon_Controller{
	
	// 인사발령 사원
	@Override
	@RequestMapping(value = "/human/p0002/insa_ballyeong_Sawon.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insaBal_Sawon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/human/p0002/insa_ballyeong_Sawon";
		request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	@Override
	@RequestMapping(value = "/human/p0002/bal_Num_Code.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bal_Num_Code(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "/human/p0002/balNum_code_pop";
		request.setCharacterEncoding("utf-8");
		
		ModelAndView main = new ModelAndView(viewName);
		return main;
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
