package hr.attendance.p0001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface day_regist_Controller {
	//ȭ��
	public ModelAndView day_regist_sawon(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView day_regist(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView day_deadline(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView month(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public ModelAndView month_da(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//��� 
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveData_da(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList(HttpServletRequest request, HttpServletResponse response,  ModelMap modelMap) throws Exception;
	public Map da_searchList(HttpServletRequest request, HttpServletResponse response,  ModelMap modelMap) throws Exception;
	public Map searchList_Sawon(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception;
	public Map month(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception;
	public Map month_click(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception;
	

	
	
}