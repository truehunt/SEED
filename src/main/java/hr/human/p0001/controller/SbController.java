package hr.human.p0001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SbController {
	public Map saveDataSb(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public Map ISA_sb(HttpServletRequest request, HttpServletResponse response) throws Exception; // 상벌
}