package hr.human.p0009.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0009.vo.education_statusVO;







public interface education_statusDAO {
	public List<education_statusVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	public List<education_statusVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<education_statusVO> searchList3(Map<String, Object> searchMap) throws DataAccessException;

	public List<education_statusVO> searchList4(Map<String, Object> searchMap) throws DataAccessException;
	
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
