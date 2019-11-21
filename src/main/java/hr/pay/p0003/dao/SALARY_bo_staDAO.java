package hr.pay.p0003.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.pay.p0003.vo.SALARY_bo_staVO;





public interface SALARY_bo_staDAO {
	 public List<SALARY_bo_staVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	 
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;


	public List<SALARY_bo_staVO> SiteList(Map<String, Object> searchMap) throws DataAccessException;

	public List<SALARY_bo_staVO> DeptList(Map<String, Object> searchMap) throws DataAccessException;

	public List<SALARY_bo_staVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException;


	public List<SALARY_bo_staVO> yearday(Map<String, Object> searchMap) throws DataAccessException;


	public List<SALARY_bo_staVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException;





	
	 
}
