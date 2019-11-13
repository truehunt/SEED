package hr.human.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0001.vo.CarVO;
import hr.human.p0001.vo.CardFamVO;
import hr.human.p0001.vo.CardVO;
import hr.human.p0001.vo.CertVO;
import hr.human.p0001.vo.Com_codeVO;
import hr.human.p0001.vo.HlVO;

public interface FamDAO {
	 public List<CardFamVO> ISA_fam(Map<String, Object> searchMap) throws DataAccessException;
	 
	//가족
	public void insertDataFam(Map<String, String> row) throws DataAccessException;
	public void updateDataFam(Map<String, String> row) throws DataAccessException;
	public void deleteDataFam(Map<String, String> row) throws DataAccessException;

}
