package hr.system.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.system.p0001.vo.WorkEnroll_VO;




public interface workEnroll_DAO {
	public List<WorkEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;
	 
}
