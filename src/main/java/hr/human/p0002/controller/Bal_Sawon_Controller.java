package hr.human.p0002.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;


public interface Bal_Sawon_Controller {
	public ModelAndView insaBal_Sawon(HttpServletRequest request, HttpServletResponse response) throws Exception; // 인사발령 사원

	public ModelAndView bal_Num_Code(HttpServletRequest request, HttpServletResponse response) throws Exception;
}