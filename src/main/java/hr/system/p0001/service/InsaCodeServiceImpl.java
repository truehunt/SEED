package hr.system.p0001.service;

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

import hr.system.p0001.dao.InsaCodeDAO;
import hr.system.p0001.vo.InsaCodeVO;




@Service("c_s0001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class InsaCodeServiceImpl implements InsaCodeService {
	@Autowired
	private InsaCodeDAO p0001DAO;
	
	@Override
	public List<InsaCodeVO> outPut(Map<String, Object> searchMap) throws DataAccessException {
		List<InsaCodeVO> list =  p0001DAO.outPut(searchMap); 
		return list;
	}
	
	@Override
	public List<InsaCodeVO> deTai(Map<String, Object> searchMap) throws DataAccessException {
		List<InsaCodeVO> list =  p0001DAO.deTai(searchMap); 
		return list;
	}
	
	@Override
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; 
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i);
			if("I".equals(str)) { 
				p0001DAO.insertData(row);
			}else if("U".equals(str)) { 
				p0001DAO.updateData(row);
			}else if("D".equals(str)) { 
				p0001DAO.deleteData(row);
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
			}
		}		
		return row;
	}
}
