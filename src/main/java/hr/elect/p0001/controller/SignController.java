package hr.elect.p0001.controller;

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

import hr.elect.p0001.vo.SignDocVO;
import project.common.SearchVO;

public interface SignController {
	public ModelAndView signListTobe(HttpServletRequest request, HttpServletResponse response, SearchVO searchVO, ModelMap modelMap) throws Exception;
	public ModelAndView signListTo(HttpServletRequest request, HttpServletResponse response, SearchVO searchVO, ModelMap modelMap) throws Exception;
	public ModelAndView signDocTypeList(HttpServletRequest request, HttpServletResponse response, SearchVO searchVO, ModelMap modelMap) throws Exception;
	public ModelAndView signDocForm(HttpServletRequest request, SignDocVO signDocInfo, ModelMap modelMap) throws Exception;
}