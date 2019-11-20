package hr.human.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0001.vo.ChjVO;

public interface ChjDAO {
	public List<ChjVO> ISA_chj(Map<String, Object> searchMap) throws DataAccessException;
	 
	//출장
		public void insertDataChj(Map<String, String> row) throws DataAccessException;
		public void updateDataChj(Map<String, String> row) throws DataAccessException;
		public void deleteDataChj(Map<String, String> row) throws DataAccessException;

}
