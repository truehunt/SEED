package hr.human.p0002.service;

import java.util.List;
import java.util.Map;


import org.springframework.dao.DataAccessException;

import hr.human.p0002.vo.BalVO;
import hr.system.p0001.vo.InsaCodeVO;

public interface BalService {
	 public List<BalVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;

	public List<InsaCodeVO> Code(Map<String, Object> searchMap);

	public List<BalVO> Ballyeong(Map<String, Object> searchMap);

	public List<BalVO> Sawon(Map<String, Object> searchMap);

	public List<BalVO> DeptList(Map<String, Object> searchMap);

	public List<BalVO> Sawon_NC(Map<String, Object> searchMap);

	public List<BalVO> Sawon_Add_Search(Map<String, Object> searchMap);
}
