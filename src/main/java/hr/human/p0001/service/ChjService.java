package hr.human.p0001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0001.vo.ChjVO;

public interface ChjService {
	public List<ChjVO> ISA_chj(Map<String, Object> searchMap) throws DataAccessException;

	public void saveDataChj(Map<String, String[]> dataMap, String fk_HL_SAWON_CODE) throws DataAccessException;
}
