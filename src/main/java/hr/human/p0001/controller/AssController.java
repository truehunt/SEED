package hr.human.p0001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AssController {
	public Map saveDataAss(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public Map ISA_ass(HttpServletRequest request, HttpServletResponse response) throws Exception; // 학력
}