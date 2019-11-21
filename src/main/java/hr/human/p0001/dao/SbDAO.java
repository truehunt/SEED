package hr.human.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0001.vo.SbVO;

public interface SbDAO {
	public List<SbVO> ISA_sb(Map<String, Object> searchMap) throws DataAccessException;
	 
	//출장
		public void insertDataSb(Map<String, String> row) throws DataAccessException;
		public void updateDataSb(Map<String, String> row) throws DataAccessException;
		public void deleteDataSb(Map<String, String> row) throws DataAccessException;

}
