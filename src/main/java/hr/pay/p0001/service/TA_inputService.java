package hr.pay.p0001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.pay.p0001.vo.TA_inputVO;





public interface TA_inputService {
	 public List<TA_inputVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	 public	List<TA_inputVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;

	 
	 
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);

}
