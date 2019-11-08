package hr.pay.s0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.pay.s0001.vo.SET_paydayVO;





public interface SET_paydayDAO {
	 public List<SET_paydayVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	 
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;

	
	 
}
