package hr.human.p0002.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;


public interface BalController {
	public ModelAndView insaBal(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public Map saveData(HttpServletRequest request, HttpServletResponse response ) throws Exception;

	public Map Code(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map ballyeong(HttpServletRequest request, HttpServletResponse response) throws Exception;
}