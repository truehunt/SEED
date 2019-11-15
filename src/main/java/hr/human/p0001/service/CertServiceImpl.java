package hr.human.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.human.p0001.dao.CertDAO;
import hr.human.p0001.service.CertService;
import hr.human.p0001.vo.CertVO;

@Service("h_CertService")
@Transactional(propagation = Propagation.REQUIRED)
public class CertServiceImpl implements CertService{
	@Autowired
	private CertDAO p0001DAO;

	@Override
	public List<CertVO> ISA_cert(Map<String, Object> searchMap) throws DataAccessException {
		
		List<CertVO> list =  p0001DAO.ISA_cert(searchMap);
		
		return list;
	}
	
	//면허/자격
		@Override
		public void saveDataCert(Map<String, String[]> dataMap, String fk_CERT_SAWON_CODE)  throws DataAccessException  {
			String[] status = dataMap.get("STATUS");
			
			int length = status.length; // row수
			int i = 0;
			for (String str : status) {
				Map<String, String> row = getRow(dataMap, length, i, fk_CERT_SAWON_CODE); // 현재 Index의 Row Map
				if ("I".equals(str)) { // 추가
					p0001DAO.insertDataCert(row);
				} else if ("U".equals(str)) { // 수정
					p0001DAO.updateDataCert(row);
				} else if ("D".equals(str)) { // 삭제
					p0001DAO.deleteDataCert(row);
				}
				i++;
			}
		}
	
	private Map getRow(Map<String, String[]> dataMap, int length, int i, String x) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[i]);
				row.put("fk_SAWON_CODE", x);
			}
		}		
		return row;
	}
	
	private Map getRow2(Map<String, String[]> dataMap, int length, int i) {
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
