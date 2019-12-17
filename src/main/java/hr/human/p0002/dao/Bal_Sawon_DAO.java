package hr.human.p0002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0002.vo.BalVO;
import hr.system.p0001.vo.InsaCodeVO;

public interface Bal_Sawon_DAO {
	public List<BalVO> searchNum(Map<String, Object> searchMap) throws DataAccessException;
	public List<BalVO> BalDiv(Map<String, Object> searchMap) throws DataAccessException;
	public List<BalVO> BalSearch(Map<String, Object> searchMap) throws DataAccessException;
	public List<BalVO> fk_Sawon(Map<String, Object> searchMap) throws DataAccessException;
	public List<BalVO> fk_Sawon_Contents(Map<String, Object> searchMap);
	public List<BalVO> BalContent(Map<String, Object> searchMap) throws DataAccessException;
	public List<BalVO> EM_INFO(Map<String, Object> searchMap) throws DataAccessException;
	public List<BalVO> INFO_DEPT(Map<String, Object> searchMap) throws DataAccessException;
	public List<BalVO> INFO_RANK(Map<String, Object> searchMap) throws DataAccessException;
	public List<BalVO> SAL_HOBONG(Map<String, Object> searchMap) throws DataAccessException;
	public List<BalVO> BalAfter_INFO(Map<String, Object> searchMap) throws DataAccessException;
	public List<BalVO> Content_Div(Map<String, Object> searchMap) throws DataAccessException;
	
	public void insertData(Map<String, String> row) throws DataAccessException;
	public void updateData(Map<String, String> row) throws DataAccessException;
	public void deleteData(Map<String, String> row) throws DataAccessException;
	public List<BalVO> ContentInsert(Map<String, Object> searchMap) throws DataAccessException;
	public List<BalVO> ISA_bal(Map<String, Object> searchMap) throws DataAccessException;
	
	
}
