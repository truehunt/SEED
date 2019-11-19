package hr.system.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.system.p0001.vo.InsaCodeVO;
import hr.system.p0001.vo.HBTableVO;

public interface HBCodeDAO {
	public List<InsaCodeVO> hobongCode(Map<String, Object> searchMap) throws DataAccessException;
	public List<HBTableVO> hobongApp(Map<String, Object> searchMap) throws DataAccessException;
	public List<HBTableVO> hobongTable(Map<String, Object> searchMap) throws DataAccessException;
	
	public void insertData(Map<String, String> row) throws DataAccessException;
	public void updateData(Map<String, String> row) throws DataAccessException;
	public void deleteData(Map<String, String> row) throws DataAccessException;
	
	public void updatePRICE(Map<String, String> row) throws DataAccessException;
	
}
