package hr.human.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.human.p0001.dao.CarDAO;
import hr.human.p0001.service.CarService;
import hr.human.p0001.vo.CarVO;

@Service("h_CarService")
@Transactional(propagation = Propagation.REQUIRED)
public class CarServiceImpl implements CarService{
	@Autowired
	private CarDAO p0001DAO;

	@Override
	public List<CarVO> ISA_car(Map<String, Object> searchMap) throws DataAccessException {
		List<CarVO> list =  p0001DAO.ISA_car(searchMap);
		
		return list;
	}
	
	//경력
		@Override
		public void saveDataCar(Map<String, String[]> dataMap, String fk_CAR_SAWON_CODE)  throws DataAccessException  {
			String[] status = dataMap.get("STATUS");
			
			int length = status.length; // row수
			int i = 0;
			for (String str : status) {
				Map<String, String> row = getRow(dataMap, length, i, fk_CAR_SAWON_CODE); // 현재 Index의 Row Map
				if ("I".equals(str)) { // 추가
					p0001DAO.insertDataCar(row);
				} else if ("U".equals(str)) { // 수정
					p0001DAO.updateDataCar(row);
				} else if ("D".equals(str)) { // 삭제
					p0001DAO.deleteDataCar(row);
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
