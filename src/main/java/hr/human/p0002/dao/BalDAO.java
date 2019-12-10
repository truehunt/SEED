package hr.human.p0002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0002.vo.BalVO;
import hr.system.p0001.vo.InsaCodeVO;

public interface BalDAO {
	 public List<BalVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public void insertData(Map<String, String> row) throws DataAccessException;
	 public void updateData(Map<String, String> row) throws DataAccessException;
	 public void deleteData(Map<String, String> row) throws DataAccessException;
	 
	public List<InsaCodeVO> Code(Map<String, Object> searchMap);
	public List<BalVO> Ballyeong(Map<String, Object> searchMap);
	public List<BalVO> Sawon(Map<String, Object> searchMap);
	public List<BalVO> DeptList(Map<String, Object> searchMap);
	public List<BalVO> Sawon_NC(Map<String, Object> searchMap);
	public void insertData2(Map<String, String> row);
	public List<BalVO> Sawon_Add_Search(Map<String, Object> searchMap);
	
}
