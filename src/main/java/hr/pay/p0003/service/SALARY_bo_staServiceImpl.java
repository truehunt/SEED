package hr.pay.p0003.service;

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
import hr.pay.p0002.vo.SALARY_calculVO;
import hr.pay.p0003.dao.SALARY_bo_staDAO;
import hr.pay.p0003.vo.SALARY_bo_staVO;






@Service("SALARY_bo_staService")
@Transactional(propagation = Propagation.REQUIRED)
public class SALARY_bo_staServiceImpl implements SALARY_bo_staService {
	@Autowired
	private SALARY_bo_staDAO SALARY_bo_staDAO;

	@Override
	public List<SALARY_bo_staVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_bo_staVO> list =  SALARY_bo_staDAO.searchList(searchMap); 
		return list;
	}

	
	
	@Override
	public List<SALARY_bo_staVO> SiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_bo_staVO> list =  SALARY_bo_staDAO.SiteList(searchMap); 
		return list;
	}
	
	
	@Override
	public List<SALARY_bo_staVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_bo_staVO> list =  SALARY_bo_staDAO.DeptList(searchMap); 
		return list;
	}
	
	@Override
	public List<SALARY_bo_staVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_bo_staVO> list =  SALARY_bo_staDAO.DeptList2(searchMap); 
		return list;
	}
	
	@Override
	public List<SALARY_bo_staVO> yearday(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_bo_staVO> list =  SALARY_bo_staDAO.yearday(searchMap); 
		return list;
	}
	
	
	@Override
	public List<SALARY_bo_staVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_bo_staVO> list =  SALARY_bo_staDAO.yeardayd(searchMap); 
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
				SALARY_bo_staDAO.insertData(row);
			}else if("U".equals(str)) { // ????
				SALARY_bo_staDAO.updateData(row);
			}else if("D".equals(str)) { // ????
				SALARY_bo_staDAO.deleteData(row);
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
