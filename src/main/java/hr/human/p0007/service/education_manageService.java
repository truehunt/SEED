package hr.human.p0007.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.human.p0007.vo.education_manageVO;





public interface education_manageService {
	public List<education_manageVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<education_manageVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<education_manageVO> searchList3(Map<String, Object> searchMap) throws DataAccessException;

	public List<education_manageVO> sawon_search(Map<String, Object> searchMap);
	
	public List<education_manageVO> DeptList(Map<String, Object> searchMap) throws DataAccessException;
	
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException;

	public void saveData2(Map<String, String[]> dataMap) throws DataAccessException;
	
	public void saveData3(Map<String, String[]> dataMap) throws DataAccessException;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);

	

	





}
