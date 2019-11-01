package hr.attendance.p0001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface day_regist_Controller {
	//화면
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView ibSheet(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView day_regist_sawon(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView day_regist(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView day_deadline(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView mon_deadline(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deadline(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView inquery(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView holiday(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView holiday_calc(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView business(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView outside(HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	//기능 
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map da_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}