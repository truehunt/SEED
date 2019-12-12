package hr.attendance.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.attendance.p0001.vo.day_regist_VO;

public interface day_regist_Service {
	public List<day_regist_VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<day_regist_VO> searchList_sawon(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<day_regist_VO> da_searchList(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<day_regist_VO> searchList_month(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<day_regist_VO> searchList_month_click(Map<String, Object> searchMap) throws DataAccessException;
	
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);

	public List<HashMap<String,String>> select() throws DataAccessException;

	public void saveData_da(Map<String, String[]> dataMap) throws DataAccessException;


	
	
}
