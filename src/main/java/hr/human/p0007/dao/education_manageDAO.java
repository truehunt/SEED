package hr.human.p0007.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0007.vo.education_manageVO;





public interface education_manageDAO {
	public List<education_manageVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	public List<education_manageVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<education_manageVO> searchList3(Map<String, Object> searchMap) throws DataAccessException;

	
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void insertData2(Map<String, String> row) throws DataAccessException;
	
	public void insertData3(Map<String, String> row) throws DataAccessException;


	public void updateData(Map<String, String> row) throws DataAccessException;
	
	public void updateData2(Map<String, String> row) throws DataAccessException;
	
	public void updateData3(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;

	public void deleteData2(Map<String, String> row) throws DataAccessException;

	public void deleteData3(Map<String, String> row) throws DataAccessException;



	 
}
