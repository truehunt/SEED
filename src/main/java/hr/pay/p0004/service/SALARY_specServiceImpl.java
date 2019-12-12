package hr.pay.p0004.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.pay.p0004.vo.SALARY_specVO;
import hr.pay.p0004.dao.SALARY_specDAO;






@Service("SALARY_specService")
@Transactional(propagation = Propagation.REQUIRED)
public class SALARY_specServiceImpl implements SALARY_specService {
	@Autowired
	private SALARY_specDAO SALARY_specDAO;

	@Override
	public List<SALARY_specVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list =  SALARY_specDAO.searchList(searchMap); 
		return list;
	}

	
	@Override
	public List<SALARY_specVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list =  SALARY_specDAO.searchList2(searchMap); 
		return list;
	}
	
	@Override
	public List<SALARY_specVO> SiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list =  SALARY_specDAO.SiteList(searchMap); 
		return list;
	}
	
	
	@Override
	public List<SALARY_specVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list =  SALARY_specDAO.DeptList(searchMap); 
		return list;
	}
	
	@Override
	public List<SALARY_specVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list =  SALARY_specDAO.DeptList2(searchMap); 
		return list;
	}
	
	
	@Override
	public List<SALARY_specVO> yearday(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list =  SALARY_specDAO.yearday(searchMap); 
		return list;
	}
	
	
	@Override
	public List<SALARY_specVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list =  SALARY_specDAO.yeardayd(searchMap); 
		return list;
	}
	
	@Override
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row??
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // ???? Index?? Row Map
			if("I".equals(str)) { // ???
				SALARY_specDAO.insertData(row);
			}else if("U".equals(str)) { // ????
				SALARY_specDAO.updateData(row);
			}else if("D".equals(str)) { // ????
				SALARY_specDAO.deleteData(row);
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
		// TODO Auto-generated method stub
		
	}	
}
