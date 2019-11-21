package hr.attendance.p0002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.attendance.p0001.vo.day_regist_VO;
import hr.attendance.p0002.vo.business_VO;
import hr.attendance.p0002.vo.holiday_VO;

public interface holiday_Service {
	public List<business_VO> searchList_busin(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<holiday_VO> searchList_holi(Map<String, Object> searchMap) throws DataAccessException;
	
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);

	public List<HashMap<String,String>> select() throws DataAccessException;


	
	
}
