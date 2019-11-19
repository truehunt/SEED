package hr.system.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.system.p0001.dao.HBCodeDAO;
import hr.system.p0001.vo.HBTableVO;
import hr.system.p0001.vo.InsaCodeVO;


@Service("h_HBCodeService")
@Transactional(propagation = Propagation.REQUIRED)
public class HBCodeServiceImpl implements HBCodeService {
	@Autowired
	private HBCodeDAO p0001DAO;
	
	private String fk_RANK_CODE = "";
	private String hobong_TABLE_START_DATE_APPLI = "";
	
//	직급코드
	@Override
	public List<InsaCodeVO> hobongCode(Map<String, Object> searchMap) throws DataAccessException {
		List<InsaCodeVO> list =  p0001DAO.hobongCode(searchMap); 
		return list;
	}
	
//	호봉이력
	public List<HBTableVO> hobongApp(Map<String, Object> searchMap) throws DataAccessException {
		List<HBTableVO> list =  p0001DAO.hobongApp(searchMap); 
		return list;
	}
	
//	호봉이력
	public List<HBTableVO> hobongTable(Map<String, Object> searchMap) throws DataAccessException {
		List<HBTableVO> list =  p0001DAO.hobongTable(searchMap); 
		return list;
	}
	
	@Override
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row��
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
			if("I".equals(str)) { // �߰�
				p0001DAO.insertData(row);
			}else if("U".equals(str)) { // ����
				p0001DAO.updateData(row);
			}else if("D".equals(str)) { // ����
				p0001DAO.deleteData(row);
			}
			i++;
		}
	}
	
	@Override
	public void updateData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row��
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
			if("U".equals(str)) { // ����
				p0001DAO.updatePRICE(row);
			}
			i++;
		}
	}
	
	private Map getRow(Map<String, String[]> dataMap, int length, int i) {
		Map<String, String> row = new HashMap<String, String>();
		
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			
			if(length == data.length) {
				row.put(name, data[i]);
			}else if(length != data.length){
				if("hobong_TABLE_START_DATE_APPLI".equals(name)) {
					if(i == 0) {
						hobong_TABLE_START_DATE_APPLI = data[i];
					}
					row.put(name, hobong_TABLE_START_DATE_APPLI);
				}else if("fk_RANK_CODE".equals(name)) {
					if(i==0) {
						fk_RANK_CODE = data[i];
					}
					row.put(name, fk_RANK_CODE);
				}
			}
		}		
		return row;
	}
}
