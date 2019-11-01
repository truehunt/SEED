package hr.attendance.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.attendance.p0001.vo.day_regist_VO;
import hr.system.p0001.vo.SawonVO;

public interface day_regist_DAO {
	public List<day_regist_VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public List<day_regist_VO> da_searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;

	public void GetData(Map<String, String> row) throws DataAccessException;

}
