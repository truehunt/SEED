package hr.human.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0001.vo.CardVO;




public interface CardDAO {
	 public List<CardVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public List<CardVO> ISA(Map<String, Object> searchMap) throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;
	 
}
