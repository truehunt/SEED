package hr.attendance.p0001.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.attendance.p0001.dao.day_regist_DAO;
import hr.attendance.p0001.vo.day_regist_VO;
import project.common.DateVO;



//조회
@Service("day_regist_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class day_regist_ServiceImpl implements day_regist_Service {
	@Autowired
	private day_regist_DAO p0001DAO;

	//사원 조회
	public List<day_regist_VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("sawon_2: "+searchMap);
		List<day_regist_VO> list =  p0001DAO.searchList(searchMap); 
		
		List<DateVO> calenList = new ArrayList<DateVO>();
		return list;
	}
	
	
	//사원 출근시 사원정보
	public List<day_regist_VO> searchList_sawon(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("sawon2_2: "+searchMap);
		List<day_regist_VO> list =  p0001DAO.searchList_sawon(searchMap); 
		
		List<DateVO> calenList = new ArrayList<DateVO>();
		return list;
	}
	
	//관리자 화면
	

	public List<day_regist_VO> da_searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("sawon_da_2: "+searchMap);	
		List<day_regist_VO> list =  p0001DAO.da_searchList(searchMap); 
		return list;
	}
	
	//select문
	public List<HashMap<String,String>> select() throws DataAccessException {
		List<HashMap<String,String>> list =  p0001DAO.select(); 
		return list;
	}


	//데이터 저장
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

	@Override
	public void updateMember(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		
	}

	
	@Override
	public void insertMember(Map<String, Object> dataMap) {
		
	}	
	

}
