package hr.human.p0001.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.human.p0001.dao.CardDAO;
import hr.human.p0001.service.CardService;
import hr.human.p0001.vo.CardVO;
import hr.human.p0001.vo.Com_codeVO;

@Service("h_insaCardService")
@Transactional(propagation = Propagation.REQUIRED)
public class CardServiceImpl implements CardService {
	@Autowired
	private CardDAO p0001DAO;

	@Override
	public List<CardVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list =  p0001DAO.searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<CardVO> ISA(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list =  p0001DAO.ISA(searchMap); 
		return list;
	}
	
	@Override
	public List<CardVO> ISA_c(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list =  p0001DAO.ISA_c(searchMap); 
		return list;
	}
	
	@Override
	public List<Com_codeVO> COM_CODE(Map<String, Object> searchMap) throws DataAccessException {
		List<Com_codeVO> list =  p0001DAO.COM_CODE(searchMap); 
		return list;
	}
	
	
	@Override
	public List<CardVO> ISA_cha(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list =  p0001DAO.ISA_cha(searchMap); 
		return list;
	}
	
	
	//
	@Override
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row수
		int i = 0;
		
		for (String str : status) {
			Map<String, String> row = getRow2(dataMap, length, i); // 현재 Index의 Row Map
			if ("I".equals(str)) { // 추가
				p0001DAO.insertData(row);
			} else if ("U".equals(str)) { // 수정
				p0001DAO.updateData(row);
			} else if ("D".equals(str)) { // 삭제
				p0001DAO.deleteData(row);
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
