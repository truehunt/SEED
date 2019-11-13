package hr.pay.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.pay.p0001.dao.TA_inputDAO;
import hr.pay.p0001.vo.TA_inputVO;






@Service("TA_inputService")
@Transactional(propagation = Propagation.REQUIRED)
public class TA_inputServiceImpl implements TA_inputService {
	@Autowired
	private TA_inputDAO TA_inputDAO;

	@Override
	public List<TA_inputVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<TA_inputVO> list =  TA_inputDAO.searchList(searchMap); 
		return list;
	}

	
	@Override
	public List<TA_inputVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<TA_inputVO> list =  TA_inputDAO.searchList2(searchMap); 
		return list;
	}
	
	@Override
	public List<TA_inputVO> SiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<TA_inputVO> list =  TA_inputDAO.SiteList(searchMap); 
		return list;
	}
	
	
	@Override
	public List<TA_inputVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<TA_inputVO> list =  TA_inputDAO.DeptList(searchMap); 
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
				TA_inputDAO.insertData(row);
			}else if("U".equals(str)) { // ????
				TA_inputDAO.updateData(row);
			}else if("D".equals(str)) { // ????
				TA_inputDAO.deleteData(row);
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
