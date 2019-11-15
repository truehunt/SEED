package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.vo.CarVO;

@Repository("h_CarDAO")
public class CarDAOImpl implements CarDAO {
	@Autowired
	private SqlSession sqlSession;
	private String num;
	private int car_code;

	
	@Override
	public List<CarVO> ISA_car(Map<String, Object> searchMap) throws DataAccessException {
		List<CarVO> list = sqlSession.selectList("hr.human.p0001.ISA_car",searchMap);
		
		for(int i=0; i<list.size(); i++){
			num = list.get(i).getPk_CAR_CODE();
		}
		
		if(num != null && num != "") {
			car_code = Integer.parseInt(num);
		}else if(num == null ) {
			car_code = 1;
		}
		
		return list;
	}
	
	//경력
		@Override
		public void insertDataCar(Map<String, String> row) throws DataAccessException {
			car_code++;
			if(car_code < 10 ) {
				row.put("pk_CAR_CODE", "000"+car_code);
			}else if(car_code >= 10 && car_code < 100 ) {
				row.put("pk_CAR_CODE", "00"+car_code);
			}else if(car_code >= 100 && car_code < 1000) {
				row.put("pk_CAR_CODE", "0"+car_code);
			}
			sqlSession.update("hr.human.p0001.insertDataCar", row);
		}
		@Override
		public void updateDataCar(Map<String, String> row) throws DataAccessException {
			sqlSession.update("hr.human.p0001.updateDataCar", row);
		}
		@Override
		public void deleteDataCar(Map<String, String> row) throws DataAccessException {
			sqlSession.update("hr.human.p0001.deleteDataCar", row);
		}
		

}
