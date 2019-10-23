package hr.elect.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.elect.p0001.dao.P0001DAO;
import hr.elect.p0001.vo.P0001VO;




@Service("s0001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class P0001ServiceImpl implements P0001Service {
	@Autowired
	private P0001DAO p0001DAO;

	@Override
	public List<P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<P0001VO> list =  p0001DAO.searchList(searchMap); 
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
