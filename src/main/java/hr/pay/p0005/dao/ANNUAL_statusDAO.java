package hr.pay.p0005.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.pay.p0005.vo.ANNUAL_statusVO;





public interface ANNUAL_statusDAO {
	 public List<ANNUAL_statusVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	 
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;


	public List<ANNUAL_statusVO> SiteList(Map<String, Object> searchMap) throws DataAccessException;

	public List<ANNUAL_statusVO> DeptList(Map<String, Object> searchMap) throws DataAccessException;

	public List<ANNUAL_statusVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException;


	public List<ANNUAL_statusVO> yearday(Map<String, Object> searchMap) throws DataAccessException;


	public List<ANNUAL_statusVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException;





	
	 
}
