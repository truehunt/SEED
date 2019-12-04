package hr.human.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.human.p0001.dao.FamDAO;
import hr.human.p0001.service.FamService;
import hr.human.p0001.vo.CardFamVO;

@Service("h_FamService")
@Transactional(propagation = Propagation.REQUIRED)
public class FamServiceImpl implements FamService {
	@Autowired
	private FamDAO p0001DAO;

	@Override
	public List<CardFamVO> ISA_fam(Map<String, Object> searchMap) throws DataAccessException {
		List<CardFamVO> list =  p0001DAO.ISA_fam(searchMap); 
		return list;
	}
	
	//가족
	@Override
	public void saveDataFam(Map<String, String[]> dataMap, String fk_FAM_SAWON_CODE)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		
		int length = status.length; // row수
		
		int i = 0;
			
		for (String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, fk_FAM_SAWON_CODE); // 현재 Index의 Row Map
			if ("I".equals(str)) { // 추가
				p0001DAO.insertDataFam(row);
			} else if ("U".equals(str)) { // 수정
				p0001DAO.updateDataFam(row);
			} else if ("D".equals(str)) { // 삭제
				p0001DAO.deleteDataFam(row);
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
	
	private Map getRow2(Map<String, String[]> dataMap, int length, int i) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[i]);
			}
		}		
		return row;
	}

}
