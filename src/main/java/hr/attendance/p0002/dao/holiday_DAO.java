package hr.attendance.p0002.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.attendance.p0002.vo.business_VO;
import hr.attendance.p0002.vo.holiday_VO;

public interface holiday_DAO {
	
	public List<holiday_VO> searchList_holi(Map<String, Object> searchMap) throws DataAccessException;
	public List<holiday_VO> searchList_holi_da(Map<String, Object> searchMap) throws DataAccessException;
	public void insertData_holi(Map<String, String> row) throws DataAccessException;
	public void updateData_holi(Map<String, String> row) throws DataAccessException;
	public void updateData_holi_da(Map<String, String> row) throws DataAccessException;
	public void deleteData_holi(Map<String, String> row) throws DataAccessException;
	
	
	public List<business_VO> searchList_busin(Map<String, Object> searchMap) throws DataAccessException;
	public List<business_VO> searchList_busin_da(Map<String, Object> searchMap) throws DataAccessException;
	public void insertData_busin(Map<String, String> row) throws DataAccessException;
	public void updateData_busin(Map<String, String> row) throws DataAccessException;
	public void updateData_busin_da(Map<String, String> row) throws DataAccessException;
	public void deleteData_busin(Map<String, String> row) throws DataAccessException;
	
	
	public List<HashMap<String,String>> select() throws DataAccessException;

	public void GetData(Map<String, String> row) throws DataAccessException;
	
	public List<holiday_VO> searchList_calc(Map<String, Object> searchMap) throws DataAccessException;
//	public List<holiday_VO> searchList_calc1(Map<String, Object> searchMap)throws DataAccessException;
	public void insertData_calc(Map<String, String> row);
	public void updateData_calc(Map<String, String> row) throws DataAccessException;
	public void deleteData_calc(Map<String, String> row) throws DataAccessException;
	
	
	
}
