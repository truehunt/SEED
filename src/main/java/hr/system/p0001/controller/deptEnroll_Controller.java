package hr.system.p0001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface deptEnroll_Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//부서 메인 ibSheet
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//부문등록 ibSheet
	public Map saveData2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//부서 메인
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//부문등록 popup, 부문코드도움 popup
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//사업장코드도움 popup
	public Map searchList3(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView dept_Enroll(HttpServletRequest request, HttpServletResponse response) throws Exception;//사업장등록	
	
}