package hr.human.s0001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface comEnroll_Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView ibSheet(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map adsearchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//추가 내용 
	public ModelAndView adcompany_Enroll(HttpServletRequest request, HttpServletResponse response) throws Exception;//회사등록
	public Map comEnrollView(HttpServletRequest request, HttpServletResponse response) throws Exception; //회사등록 input
	
	public ModelAndView workplace_Enroll(HttpServletRequest request, HttpServletResponse response) throws Exception;//사업장등록
	public ModelAndView dept_Enroll(HttpServletRequest request, HttpServletResponse response) throws Exception;//부서등록
	
	
}