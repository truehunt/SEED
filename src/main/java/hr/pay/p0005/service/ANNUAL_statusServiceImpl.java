package hr.pay.p0005.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import hr.pay.p0005.dao.ANNUAL_statusDAO;
import hr.pay.p0005.vo.ANNUAL_statusVO;






@Service("ANNUAL_statusService")
@Transactional(propagation = Propagation.REQUIRED)
public class ANNUAL_statusServiceImpl implements ANNUAL_statusService {
	@Autowired
	private ANNUAL_statusDAO ANNUAL_statusDAO;

	@Override
	public List<ANNUAL_statusVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("2. "+searchMap);
		List<ANNUAL_statusVO> list =  ANNUAL_statusDAO.searchList(searchMap); 
		return list;
	}

	
	
	@Override
	public List<ANNUAL_statusVO> SiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<ANNUAL_statusVO> list =  ANNUAL_statusDAO.SiteList(searchMap); 
		return list;
	}
	
	
	@Override
	public List<ANNUAL_statusVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<ANNUAL_statusVO> list =  ANNUAL_statusDAO.DeptList(searchMap); 
		return list;
	}
	
	@Override
	public List<ANNUAL_statusVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException {
		List<ANNUAL_statusVO> list =  ANNUAL_statusDAO.DeptList2(searchMap); 
		return list;
	}
	
	@Override
	public List<ANNUAL_statusVO> yearday(Map<String, Object> searchMap) throws DataAccessException {
		List<ANNUAL_statusVO> list =  ANNUAL_statusDAO.yearday(searchMap); 
		return list;
	}
	
	
	@Override
	public List<ANNUAL_statusVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException {
		List<ANNUAL_statusVO> list =  ANNUAL_statusDAO.yeardayd(searchMap); 
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
				ANNUAL_statusDAO.insertData(row);
			}else if("U".equals(str)) { // ????
				ANNUAL_statusDAO.updateData(row);
			}else if("D".equals(str)) { // ????
				ANNUAL_statusDAO.deleteData(row);
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
