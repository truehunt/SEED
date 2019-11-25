package hr.human.p0001.service;

import java.util.List;
import java.util.Map;


import org.springframework.dao.DataAccessException;

import hr.human.p0001.vo.CardVO;
import hr.human.p0001.vo.Com_codeVO;

public interface CardService {
	 public List<CardVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public List<CardVO> ISA(Map<String, Object> searchMap) throws DataAccessException;
	 public List<CardVO> ISA_c(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Com_codeVO> COM_CODE(Map<String, Object> searchMap) throws DataAccessException;
	 public List<CardVO> ISA_cha(Map<String, Object> searchMap) throws DataAccessException;
	 public List<CardVO> ISA_cha_N(Map<String, Object> searchMap) throws DataAccessException;
	 
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;
}
