package hr.human.p0002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.human.p0002.dao.Bal_Sawon_DAO;
import hr.human.p0002.service.Bal_Sawon_Service;
import hr.human.p0002.vo.BalVO;

@Service("h_Bal_Sw_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class Bal_Sawon_ServiceImpl implements Bal_Sawon_Service {
	@Autowired
	private Bal_Sawon_DAO p0002DAO;
	
	@Override
	public List<BalVO> ISA_bal(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list =  p0002DAO.ISA_bal(searchMap); 
		return list;
	}
	
	@Override
	public List<BalVO> searchNum(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list =  p0002DAO.searchNum(searchMap); 
		return list;
	}
	
	@Override
	public List<BalVO> BalDiv(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list =  p0002DAO.BalDiv(searchMap); 
		return list;
	}
	
	@Override
	public List<BalVO> BalSearch(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list =  p0002DAO.BalSearch(searchMap); 
		return list;
	}
	
	@Override
	public List<BalVO> BalAfter_INFO(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list =  p0002DAO.BalAfter_INFO(searchMap); 
		return list;
	}
	
	@Override
	public List<BalVO> fk_Sawon(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = null;
		String sawon = (String)searchMap.get("fk_BAL_SAWON_CODE");
		if(sawon == null) {
			list =  p0002DAO.fk_Sawon(searchMap);
		}else {
			list =  p0002DAO.fk_Sawon_Contents(searchMap);
		}
		 
		return list;
	}
	
	@Override
	public List<BalVO> Content_Div(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list =  p0002DAO.Content_Div(searchMap); 
		return list;
	}
	
	
	@Override
	public List<BalVO> BalContent(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list =  p0002DAO.BalContent(searchMap); 
		return list;
	}
	
	// 현 정보
	@Override
	public List<BalVO> EM_INFO(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = null;
		String INFO = (String)searchMap.get("info");
		if(INFO.equals("dept_NAME")) { // 발령내역이 부서일 때
			list =  p0002DAO.INFO_DEPT(searchMap);
		}else if(INFO.equals("rank_NAME")) { // 발령내역이 직급일 때
			list =  p0002DAO.INFO_RANK(searchMap);
		}else if(INFO.equals("fk_HOBONG_CODE")) { // 발령내역이 호봉일 때
			list =  p0002DAO.SAL_HOBONG(searchMap);
		}else {  // 그외
			list =  p0002DAO.EM_INFO(searchMap);
		}
		
		
		return list;
	}
	
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
	
	// 현정보 저장
	@Override
	public List<BalVO> ContentSave(Map<String, Object> searchMap)  throws DataAccessException  {
		List<BalVO> list =  p0002DAO.ContentInsert(searchMap); 
		return list;
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
