package hr.pay.p0003.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.pay.p0003.vo.SALARY_bo_staVO;





public interface SALARY_bo_staService {
	 public List<SALARY_bo_staVO> searchList(Map<String, Object> searchMap) throws DataAccessException;


	 
	 
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);

}
