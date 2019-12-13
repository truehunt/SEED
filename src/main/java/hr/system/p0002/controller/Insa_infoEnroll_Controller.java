package hr.system.p0002.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hr.elect.p0002.vo.SignImageVO;

public interface Insa_infoEnroll_Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView ibSheet(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception; // 인사정보등록
	public Map saveData2(HttpServletRequest request, HttpServletResponse response) throws Exception; // 인사정보등록-인적 정보
	public Map saveData3(HttpServletRequest request, HttpServletResponse response) throws Exception; // 인사정보등록-재직 정보
	public Map saveData4(HttpServletRequest request, HttpServletResponse response) throws Exception; // 인사정보등록-급여 정보
	
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception; // 인사정보등록
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception; // 인사정보등록-인적 정보
	public Map searchList3(HttpServletRequest request, HttpServletResponse response) throws Exception; // 인사정보등록-재직 정보
	public Map searchList4(HttpServletRequest request, HttpServletResponse response) throws Exception; // 인사정보등록-급여 정보
	
	public ModelAndView Insa_infoEnroll(HttpServletRequest request, HttpServletResponse response) throws Exception;//인사정보등록
	public ModelAndView Insa_personEnroll(HttpServletRequest request, HttpServletResponse response) throws Exception;//인사정보등록-인적 정보
	public ModelAndView Insa_emEnroll(HttpServletRequest request, HttpServletResponse response) throws Exception;//인사정보등록-재직 정보
	public ModelAndView Insa_salEnroll(HttpServletRequest request, HttpServletResponse response) throws Exception;//인사정보등록-급여 정보
	
	public String imageSave(HttpServletRequest request, HttpServletResponse response, SignImageVO signImageInfo)  throws IOException ;
}