package hr.attendance.p0002.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.attendance.p0002.dao.holiday_DAO;
import hr.attendance.p0002.vo.business_VO;
import hr.attendance.p0002.vo.holiday_VO;
import project.common.DateVO;



//조회
@Service("holiday_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class holiday_ServiceImpl implements holiday_Service {
	@Autowired
	private holiday_DAO p0002DAO;

	//사원 조회
	public List<business_VO> searchList_busin(Map<String, Object> searchMap) throws DataAccessException {
		
		List<business_VO> list =  p0002DAO.searchList_busin(searchMap); 
		System.out.println("service_business: "+searchMap);
		List<DateVO> calenList = new ArrayList<DateVO>();
		return list;
	}
	
	
	
	//데이터 저장
	@Override
	public void saveData_busin(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row��
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
			if("I".equals(str)) { // �߰�
				p0002DAO.insertData_busin(row);
			}else if("U".equals(str)) { // ����
				p0002DAO.updateData_busin(row);
			}else if("D".equals(str)) { // ����
				p0002DAO.deleteData_busin(row);
			}
			i++;
		}
	}
	
	
	//조회
	public List<holiday_VO> searchList_holi(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("service_searchList_holi: "+searchMap);
		List<holiday_VO> list =  p0002DAO.searchList_holi(searchMap); 
		
		List<DateVO> calenList = new ArrayList<DateVO>();
		return list;
	}
	


	//데이터 저장
	@Override
	public void saveData_holi(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row��
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
			if("I".equals(str)) { // �߰�
				p0002DAO.insertData_holi(row);
			}else if("U".equals(str)) { // ����
				p0002DAO.updateData_holi(row);
			}else if("D".equals(str)) { // ����
				p0002DAO.deleteData_holi(row);
			}
			i++;
		}
	}
	
//----------------------------------------------------------------------------------------------------	
	private Map getRow(Map<String, String[]> dataMap, int length, int index) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
			}
		}		
		return row;
	}

	//select문
	public List<HashMap<String,String>> select() throws DataAccessException {
		List<HashMap<String,String>> list =  p0002DAO.select(); 
		return list;
	}

//-------------------------------------------------------------------------------------	
	
	
	@Override
	public void updateMember(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		
	}

	
	@Override
	public void insertMember(Map<String, Object> dataMap) {
		
	}	
	

}
