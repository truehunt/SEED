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

public interface HLDAO {
	public List<HlVO> ISA_hl(Map<String, Object> searchMap) throws DataAccessException;
	 
	//학력
		public void insertDataHL(Map<String, String> row) throws DataAccessException;
		public void updateDataHL(Map<String, String> row) throws DataAccessException;
		public void deleteDataHL(Map<String, String> row) throws DataAccessException;

}
