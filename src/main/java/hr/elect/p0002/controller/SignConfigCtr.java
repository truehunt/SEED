package hr.elect.p0002.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hr.elect.p0001.vo.SignDocVO;
import hr.elect.p0001.vo.SignVO;
import hr.elect.p0002.vo.SignLinePathVO;
import project.common.SearchVO;

public interface SignConfigCtr {
	public void saveLinePath(HttpServletRequest request, HttpServletResponse response, SignLinePathVO signLinePathVO) throws IOException;
	public String loadLinePathList(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception;
	public void signLinePathDelete(HttpServletRequest request, HttpServletResponse response, String PK_LINEPATH_NUM) throws IOException;
	
}