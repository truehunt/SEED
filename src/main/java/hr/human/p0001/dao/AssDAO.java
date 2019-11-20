package hr.human.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0001.vo.AssVO;

public interface AssDAO {
	public List<AssVO> ISA_ass(Map<String, Object> searchMap) throws DataAccessException;
	 
	//학력
		public void insertDataAss(Map<String, String> row) throws DataAccessException;
		public void updateDataAss(Map<String, String> row) throws DataAccessException;
		public void deleteDataAss(Map<String, String> row) throws DataAccessException;

}
