package hr.human.p0001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface CardController {
	public ModelAndView insaBal(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView insaCard(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView sample(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map ISA(HttpServletRequest request, HttpServletResponse response) throws Exception;
}