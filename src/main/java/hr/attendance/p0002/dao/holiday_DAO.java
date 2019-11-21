package hr.attendance.p0002.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.attendance.p0002.vo.business_VO;
import hr.attendance.p0002.vo.holiday_VO;

public interface holiday_DAO {
	public List<business_VO> searchList_busin(Map<String, Object> searchMap) throws DataAccessException;

	public List<holiday_VO> searchList_holi(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<HashMap<String,String>> select() throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;

	public void GetData(Map<String, String> row) throws DataAccessException;

	public void insertData_holi(Map<String, String> row) throws DataAccessException;



	

}
