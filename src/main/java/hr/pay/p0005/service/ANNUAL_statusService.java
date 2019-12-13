package hr.pay.p0005.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.pay.p0005.vo.ANNUAL_statusVO;





public interface ANNUAL_statusService {
	 public List<ANNUAL_statusVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public List<ANNUAL_statusVO> SiteList(Map<String, Object> searchMap) throws DataAccessException;

	public List<ANNUAL_statusVO> DeptList(Map<String, Object> searchMap) throws DataAccessException;

	public List<ANNUAL_statusVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException;

	 
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);

	public List<ANNUAL_statusVO> yearday(Map<String, Object> searchMap) throws DataAccessException;

	public List<ANNUAL_statusVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException;







}
