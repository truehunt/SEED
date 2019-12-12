package hr.pay.p0004.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.pay.p0004.vo.SALARY_specVO;






public interface SALARY_specDAO {
	 public List<SALARY_specVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	 public List<SALARY_specVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	 
	 
	 public	List<SALARY_specVO> SiteList(Map<String, Object> searchMap) throws DataAccessException;

	 public	List<SALARY_specVO> DeptList(Map<String, Object> searchMap) throws DataAccessException;

	public List<SALARY_specVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException;

	 public List<SALARY_specVO> yearday(Map<String, Object> searchMap) throws DataAccessException;

	 public List<SALARY_specVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException;
	 
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;


	



	
	 
}
