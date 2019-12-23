package hr.system.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.system.p0001.vo.DeptEnroll_VO;

public interface deptEnroll_DAO {
	public List<DeptEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<DeptEnroll_VO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<DeptEnroll_VO> searchList3(Map<String, Object> searchMap) throws DataAccessException;
	 
	//부서 메인 ibSheet
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;
	
	//부문등록 ibSheet
	public void insertData2(Map<String, String> row) throws DataAccessException;

	public void updateData2(Map<String, String> row) throws DataAccessException;

	public void deleteData2(Map<String, String> row) throws DataAccessException;
	 
}
