package hr.human.p0002.service;

import java.util.List;
import java.util.Map;


import org.springframework.dao.DataAccessException;

import hr.human.p0002.vo.BalVO;
import hr.system.p0001.vo.InsaCodeVO;

public interface Bal_Sawon_Service {
	public List<BalVO> searchNum(Map<String, Object> searchMap) throws DataAccessException;
	 
	public List<BalVO> BalDiv(Map<String, Object> searchMap) throws DataAccessException; 
	
	public List<BalVO> BalSearch(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<BalVO> fk_Sawon(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<BalVO> BalContent(Map<String, Object> searchMap) throws DataAccessException;

	public List<BalVO> EM_INFO(Map<String, Object> searchMap) throws DataAccessException;

	public List<BalVO> BalAfter_INFO(Map<String, Object> searchMap) throws DataAccessException;

	public List<BalVO> Content_Div(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;

	public List<BalVO> ContentSave(Map<String, Object> searchMap) throws DataAccessException;

	public List<BalVO> ISA_bal(Map<String, Object> searchMap) throws DataAccessException;

	

	

}
