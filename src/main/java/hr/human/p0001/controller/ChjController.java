package hr.human.p0001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ChjController {
	public Map saveDataChj(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public Map ISA_chj(HttpServletRequest request, HttpServletResponse response) throws Exception; // 학력
}