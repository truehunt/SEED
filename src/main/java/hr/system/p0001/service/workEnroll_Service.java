package hr.system.p0001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.system.p0001.vo.WorkEnroll_VO;



public interface workEnroll_Service {
	public List<WorkEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);
}
