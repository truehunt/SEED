package hr.human.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0001.vo.CardFamVO;
import hr.human.p0001.vo.CardVO;
import hr.human.p0001.vo.Com_codeVO;
import hr.human.p0001.vo.HlVO;

public interface CardDAO {
	 public List<CardVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public List<CardVO> ISA(Map<String, Object> searchMap) throws DataAccessException;
	 public List<CardVO> ISA_c(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Com_codeVO> COM_CODE(Map<String, Object> searchMap) throws DataAccessException;
	 public List<CardFamVO> ISA_fam(Map<String, Object> searchMap) throws DataAccessException;
	 public List<HlVO> ISA_hl(Map<String, Object> searchMap) throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;
	public void updateData(Map<String, String> row) throws DataAccessException;
	public void deleteData(Map<String, String> row) throws DataAccessException;
	
	
	//가족
	public void insertDataFam(Map<String, String> row) throws DataAccessException;
	public void updateDataFam(Map<String, String> row) throws DataAccessException;
	public void deleteDataFam(Map<String, String> row) throws DataAccessException;
	
	
	//학력
	public void insertDataHL(Map<String, String> row) throws DataAccessException;
	public void updateDataHL(Map<String, String> row) throws DataAccessException;
	public void deleteDataHL(Map<String, String> row) throws DataAccessException;
	 
}
