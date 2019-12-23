package hr.human.p0001.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import hr.elect.p0002.vo.SignImageVO;

public interface CardController {
	public ModelAndView insaCard(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView sample(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public Map saveData(HttpServletRequest request, HttpServletResponse response ) throws Exception;
	
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map ISA(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map ISA_c(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map COM_CODE(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map ISA_cha(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String imageSave(HttpServletRequest request, HttpServletResponse response, SignImageVO signImageInfo)  throws IOException ;
	
}