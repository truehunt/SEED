
package hr.pay.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.pay.p0001.vo.TA_inputVO;





public interface TA_inputDAO {
	 public List<TA_inputVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	 public List<TA_inputVO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	 
	 
	 public	List<TA_inputVO> SiteList(Map<String, Object> searchMap) throws DataAccessException;

	 public	List<TA_inputVO> DeptList(Map<String, Object> searchMap) throws DataAccessException;

	 
	 
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;



	
	 
}
