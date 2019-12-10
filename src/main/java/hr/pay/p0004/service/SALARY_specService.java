package hr.pay.p0004.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.pay.p0004.vo.SALARY_specVO;






public interface SALARY_specService {
	 public List<SALARY_specVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	 public	List<SALARY_specVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;

	 public List<SALARY_specVO> SiteList(Map<String, Object> searchMap) throws DataAccessException;

	 public	List<SALARY_specVO> DeptList(Map<String, Object> searchMap) throws DataAccessException;
 
	 public List<SALARY_specVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException;

	 public List<SALARY_specVO> yearday(Map<String, Object> searchMap) throws DataAccessException;

	 public List<SALARY_specVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException;
	 
	 
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);






}
