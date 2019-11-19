package hr.system.p0001.service;

import java.util.List;
import java.util.Map;
import org.springframework.dao.DataAccessException;

import hr.system.p0001.vo.HBTableVO;
import hr.system.p0001.vo.InsaCodeVO;

public interface HBCodeService {
	public List<InsaCodeVO> hobongCode(Map<String, Object> searchMap) throws DataAccessException;
	public List<HBTableVO> hobongApp(Map<String, Object> searchMap) throws DataAccessException;
	public List<HBTableVO> hobongTable(Map<String, Object> searchMap) throws DataAccessException;
	 
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;
	public void updateData(Map<String, String[]> dataMap)  throws DataAccessException ;
}
