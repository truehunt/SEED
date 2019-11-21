package hr.pay.p0002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.pay.p0001.vo.TA_inputVO;
import hr.pay.p0002.vo.SALARY_calculVO;





public interface SALARY_calculDAO {
	 public List<SALARY_calculVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	 public List<SALARY_calculVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public List<SALARY_calculVO> SiteList(Map<String, Object> searchMap) throws DataAccessException;

	 public List<SALARY_calculVO> DeptList(Map<String, Object> searchMap) throws DataAccessException;
		
	public List<SALARY_calculVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException;

	 public List<SALARY_calculVO> yearday(Map<String, Object> searchMap) throws DataAccessException;

	public List<SALARY_calculVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException;

	 
	 
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;




	
	
	 
}
