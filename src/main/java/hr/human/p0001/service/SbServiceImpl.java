package hr.human.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.human.p0001.dao.SbDAO;
import hr.human.p0001.service.SbService;
import hr.human.p0001.vo.SbVO;

@Service("h_SbService")
@Transactional(propagation = Propagation.REQUIRED)
public class SbServiceImpl implements SbService {
	@Autowired
	private SbDAO p0001DAO;

	@Override
	public List<SbVO> ISA_sb(Map<String, Object> searchMap) throws DataAccessException {
		List<SbVO> list =  p0001DAO.ISA_sb(searchMap);
		return list;
	}
	
	//학력
	@Override
	public void saveDataSb(Map<String, String[]> dataMap, String fk_SB_SAWON_CODE)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row수
		int i = 0;
		for (String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, fk_SB_SAWON_CODE); // 현재 Index의 Row Map
			if ("I".equals(str)) { // 추가
				p0001DAO.insertDataSb(row);
			} else if ("U".equals(str)) { // 수정
				p0001DAO.updateDataSb(row);
			} else if ("D".equals(str)) { // 삭제
				p0001DAO.deleteDataSb(row);
			}
			i++;
		}
	}
	
	private Map getRow(Map<String, String[]> dataMap, int length, int i, String x) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[i]);
				row.put("fk_SAWON_CODE", x);
			}
		}		
		return row;
	}

}
