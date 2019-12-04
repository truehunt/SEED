package hr.human.p0002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.human.p0001.vo.CardFamVO;
import hr.human.p0002.dao.BalDAO;
import hr.human.p0002.service.BalService;
import hr.human.p0002.vo.BalVO;
import hr.system.p0001.vo.InsaCodeVO;

@Service("h_BalService")
@Transactional(propagation = Propagation.REQUIRED)
public class BalServiceImpl implements BalService {
	@Autowired
	private BalDAO p0002DAO;

	@Override
	public List<BalVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list =  p0002DAO.searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<InsaCodeVO> Code(Map<String, Object> searchMap) {
		List<InsaCodeVO> list =  p0002DAO.Code(searchMap); 
		return list;
	}
	
	@Override
	public List<BalVO> Ballyeong(Map<String, Object> searchMap) {
		List<BalVO> list =  p0002DAO.Ballyeong(searchMap); 
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
				p0002DAO.insertData(row);
			} else if ("U".equals(str)) { // 수정
				p0002DAO.updateData(row);
			} else if ("D".equals(str)) { // 삭제
				p0002DAO.deleteData(row);
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
