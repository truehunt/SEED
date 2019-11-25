package hr.pay.p0002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.pay.p0001.vo.TA_inputVO;
import hr.pay.p0002.dao.SALARY_calculDAO;
import hr.pay.p0002.vo.SALARY_calculVO;






@Service("SALARY_calculService")
@Transactional(propagation = Propagation.REQUIRED)
public class SALARY_calculServiceImpl implements SALARY_calculService {
	@Autowired
	private SALARY_calculDAO SALARY_calculDAO;

	@Override
	public List<SALARY_calculVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list =  SALARY_calculDAO.searchList(searchMap); 
		return list;
	}

	
	@Override
	public List<SALARY_calculVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list =  SALARY_calculDAO.searchList2(searchMap); 
		return list;
	}
	
	@Override
	public List<SALARY_calculVO> SiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list =  SALARY_calculDAO.SiteList(searchMap); 
		return list;
	}
	
	
	@Override
	public List<SALARY_calculVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list =  SALARY_calculDAO.DeptList(searchMap); 
		return list;
	}
	
	
	@Override
	public List<SALARY_calculVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list =  SALARY_calculDAO.DeptList2(searchMap); 
		return list;
	}

	@Override
	public List<SALARY_calculVO> yearday(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list =  SALARY_calculDAO.yearday(searchMap); 
		return list;
	}
	
	
	@Override
	public List<SALARY_calculVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list =  SALARY_calculDAO.yeardayd(searchMap); 
		return list;
	}
	
	@Override
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row??
		int i = 0;
		
		System.out.println("dataMap: " + dataMap);
		for(String str : status) {
			System.out.println("i:"+i);
			System.out.println("length: " + length);
			Map<String, String> row = getRow(dataMap, length, i); // ???? Index?? Row Map
			if("I".equals(str)) { // ???
				System.out.println("services: " + row);
				SALARY_calculDAO.insertData(row);
			}else if("U".equals(str)) { // ????
				SALARY_calculDAO.updateData(row);
			}else if("D".equals(str)) { // ????
				SALARY_calculDAO.deleteData(row);
			}
			i++;
		}
	}
	
	private Map getRow(Map<String, String[]> dataMap, int length, int index) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			System.out.println(length+"_"+data.length);
			if(length == data.length) {
				System.out.println(length+"_"+data.length);
				System.out.println(name+data[index]);
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
