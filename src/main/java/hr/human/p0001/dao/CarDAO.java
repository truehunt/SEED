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

public interface CarDAO {
	public List<CarVO> ISA_car(Map<String, Object> searchMap) throws DataAccessException;
	 
	//경력
		public void insertDataCar(Map<String, String> row) throws DataAccessException;
		public void updateDataCar(Map<String, String> row) throws DataAccessException;
		public void deleteDataCar(Map<String, String> row) throws DataAccessException;
}
