package hr.pay.p0002.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.pay.p0002.vo.SALARY_calculVO;





public interface SALARY_calculService {
	 public List<SALARY_calculVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	 public	List<SALARY_calculVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;

	 public List<SALARY_calculVO> SiteList(Map<String, Object> searchMap) throws DataAccessException;

	 public List<SALARY_calculVO> DeptList(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);



}
