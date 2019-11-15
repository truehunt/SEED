package hr.system.p0001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.system.p0001.vo.InsaCodeVO;



public interface HBCodeService {
	public List<InsaCodeVO> hobongCode(Map<String, Object> searchMap) throws DataAccessException;
	public List<InsaCodeVO> hobongApp(Map<String, Object> searchMap) throws DataAccessException;
	 
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;
}
