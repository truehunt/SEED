package hr.human.p0008.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0008.vo.education_evaluationVO;






public interface education_evaluationDAO {
	public List<education_evaluationVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	public List<education_evaluationVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<education_evaluationVO> searchList3(Map<String, Object> searchMap) throws DataAccessException;

	
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void insertData2(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;

	public void updateData2(Map<String, String> row) throws DataAccessException;

	public void deleteData2(Map<String, String> row) throws DataAccessException;



	 
}
