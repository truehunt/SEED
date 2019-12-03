package hr.human.p0009.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import hr.human.p0009.vo.education_statusVO;





public interface education_statusService {
	public List<education_statusVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<education_statusVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<education_statusVO> searchList3(Map<String, Object> searchMap) throws DataAccessException;

	public List<education_statusVO> searchList4(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException;

	public void saveData2(Map<String, String[]> dataMap) throws DataAccessException;
	
	public void saveData3(Map<String, String[]> dataMap) throws DataAccessException;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);

	





}
