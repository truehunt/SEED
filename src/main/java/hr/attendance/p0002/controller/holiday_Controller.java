package hr.attendance.p0002.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

public interface holiday_Controller {
	//ȭ��
	public ModelAndView holiday(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView holiday_calc(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView business(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView outside(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String select(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
//	��� 
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList_holi(HttpServletRequest request, HttpServletResponse response,  ModelMap modelMap) throws Exception;
	public Map searchList_busin(HttpServletRequest request, HttpServletResponse response,  ModelMap modelMap) throws Exception;
	
	
}