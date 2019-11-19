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

public interface HoBongController {
	public ModelAndView hobong(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map hobongCode(HttpServletRequest request, HttpServletResponse response) throws Exception;  
	public Map hobongApp(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map hobongTable(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map updateData(HttpServletRequest request, HttpServletResponse response) throws Exception;
}