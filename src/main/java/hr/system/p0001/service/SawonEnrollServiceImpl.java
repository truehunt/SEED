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

import hr.system.p0001.dao.SawonEnrollDAO;
import hr.system.p0001.vo.SawonVO;


@Service("sawonEnrollService")
@Transactional(propagation = Propagation.REQUIRED)
public class SawonEnrollServiceImpl implements SawonEnrollService {
	@Autowired
	private SawonEnrollDAO sawonEnrollDAO;

	@Override
	public List<SawonVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SawonVO> list =  sawonEnrollDAO.searchList(searchMap); 
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
				sawonEnrollDAO.insertData(row);
			}else if("U".equals(str)) { // ����
				sawonEnrollDAO.updateData(row);
			}else if("D".equals(str)) { // ����
				sawonEnrollDAO.deleteData(row);
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
}
