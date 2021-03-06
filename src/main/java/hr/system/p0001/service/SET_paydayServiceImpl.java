package hr.system.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.system.p0001.dao.SET_paydayDAO;
import hr.system.p0001.vo.SET_paydayVO;






@Service("SET_paydayService")
@Transactional(propagation = Propagation.REQUIRED)
public class SET_paydayServiceImpl implements SET_paydayService {
	@Autowired
	private SET_paydayDAO SET_paydayDAO;

	@Override
	public List<SET_paydayVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("2. "+searchMap);
		List<SET_paydayVO> list =  SET_paydayDAO.searchList(searchMap); 
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
				SET_paydayDAO.insertData(row);
			}else if("U".equals(str)) { // ????
				SET_paydayDAO.updateData(row);
			}else if("D".equals(str)) { // ????
				SET_paydayDAO.deleteData(row);
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
