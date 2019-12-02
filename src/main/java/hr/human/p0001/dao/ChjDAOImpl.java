package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.vo.CertVO;
import hr.human.p0001.vo.ChjVO;

@Repository("h_ChjDAO")
public class ChjDAOImpl implements ChjDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ChjVO> ISA_chj(Map<String, Object> searchMap) throws DataAccessException {
		List<ChjVO> list = sqlSession.selectList("hr.human.p0001.ISA_chj",searchMap);
		return list;
	}
	
	//
	@Override
	public void insertDataChj(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.insertDataChj", row);
		
		List<CertVO> listMap = sqlSession.selectList("hr.human.p0001.COUNTRY_select",row); // count_num이 0인지 아닌지를 조회
		int count_num = (int) listMap.get(0).getCount_num(); // 조회한 count_num을 변수 a에 저장 
		
		if(count_num == 0) { // 만약 자격종류가 기초코드에 없는 것일 경우 
			sqlSession.update("hr.human.p0001.COUNTRY_insert", row); // 기초코드에 추가시킨다.
		}
	}
	@Override
	public void updateDataChj(Map<String, String> row) throws DataAccessException {
		System.out.println(" - 확인중 -  :  CHJ" + row);
		sqlSession.update("hr.human.p0001.updateDataChj", row);
		
		List<CertVO> listMap = sqlSession.selectList("hr.human.p0001.COUNTRY_select",row); // count_num이 0인지 아닌지를 조회
		int count_num = (int) listMap.get(0).getCount_num(); // 조회한 count_num을 변수 a에 저장 
		
		if(count_num == 0) { // 만약 자격종류가 기초코드에 없는 것일 경우 
			sqlSession.update("hr.human.p0001.COUNTRY_insert", row); // 기초코드에 추가시킨다.
		}
	}
	
	@Override
	public void deleteDataChj(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.deleteDataChj", row);
	}


}
