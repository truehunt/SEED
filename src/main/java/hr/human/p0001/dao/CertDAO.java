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

public interface CertDAO {
	 public List<CertVO> ISA_cert(Map<String, Object> searchMap) throws DataAccessException;
	 
	//면허자격
		public void insertDataCert(Map<String, String> row) throws DataAccessException;
		public void updateDataCert(Map<String, String> row) throws DataAccessException;
		public void deleteDataCert(Map<String, String> row) throws DataAccessException;
}
