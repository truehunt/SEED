package hr.human.s0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.s0001.vo.ComEnroll_VO;




public interface comEnroll_DAO {
	public List<ComEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	public List<ComEnroll_VO> comEnrollView(Map<String, Object> searchMap) throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;
	 
}
