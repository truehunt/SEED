package hr.human.p0001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.human.p0001.vo.CardFamVO;
import hr.human.p0001.vo.CardVO;
import hr.human.p0001.vo.Com_codeVO;
import hr.human.p0001.vo.HlVO;

public interface CardService {
	 public List<CardVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public List<CardVO> ISA(Map<String, Object> searchMap) throws DataAccessException;
	 public List<CardVO> ISA_c(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Com_codeVO> COM_CODE(Map<String, Object> searchMap) throws DataAccessException;
	 public List<CardFamVO> ISA_fam(Map<String, Object> searchMap) throws DataAccessException;
	 public List<HlVO> ISA_hl(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;
	public void saveDataFam(Map<String, String[]> dataMap, String fk_FAM_SAWON_CODE) throws DataAccessException;
	public void saveDataHL(Map<String, String[]> dataMap, String fk_HL_SAWON_CODE) throws DataAccessException;
	
	
	
	
	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);

	

	
}
