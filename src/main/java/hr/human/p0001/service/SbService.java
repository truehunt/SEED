package hr.human.p0001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.p0001.vo.SbVO;

public interface SbService {
	public List<SbVO> ISA_sb(Map<String, Object> searchMap) throws DataAccessException;

	public void saveDataSb(Map<String, String[]> dataMap, String fk_SAWON_CODE) throws DataAccessException;
}
