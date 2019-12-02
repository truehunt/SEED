package hr.human.p0008.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.human.p0008.vo.education_evaluationVO;






public interface education_evaluationService {
	public List<education_evaluationVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<education_evaluationVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<education_evaluationVO> searchList3(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;

	public void saveData2(Map<String, String[]> dataMap) throws DataAccessException;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);



}
