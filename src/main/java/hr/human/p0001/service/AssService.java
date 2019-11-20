package hr.human.p0001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0001.vo.AssVO;

public interface AssService {
	public List<AssVO> ISA_ass(Map<String, Object> searchMap) throws DataAccessException;

	public void saveDataAss(Map<String, String[]> dataMap, String fk_HL_SAWON_CODE) throws DataAccessException;
}
