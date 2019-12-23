package hr.system.p0001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.system.p0001.vo.InsaCodeVO;



public interface InsaCodeService {
	 
	 public List<InsaCodeVO> outPut(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public List<InsaCodeVO> deTai(Map<String, Object> searchMap) throws DataAccessException;
	 
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;
}
