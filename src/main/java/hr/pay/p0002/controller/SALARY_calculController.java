package hr.pay.p0002.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface SALARY_calculController {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView Calendar(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView Calendar2(HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	public ModelAndView ibSheet(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map SiteList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map DeptList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map DeptList2(HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	public Map yearday(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map yeardayd(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public Map payList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map payList2(HttpServletRequest request, HttpServletResponse response) throws Exception;
}