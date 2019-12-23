package hr.human.p0002.dao;

import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0002.vo.BalVO;

@Repository("h_Bal_Sw_DAO")
public class Bal_Sawon_DAOImpl implements Bal_Sawon_DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BalVO> ISA_bal(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.ISA_bal",searchMap);
		return list;
	}
	
	@Override
	public List<BalVO> searchNum(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.searchNum",searchMap);
		
		return list;
	}
	
	@Override
	public List<BalVO> BalDiv(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.BalDiv",searchMap);
		
		return list;
	}
	
	@Override
	public List<BalVO> BalSearch(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.BalSearch",searchMap);
		
		return list;
	}
	
	@Override
	public List<BalVO> fk_Sawon(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.fk_Sawon",searchMap);
		return list;
	}
	
	@Override
	public List<BalVO> fk_Sawon_Contents(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.fk_Sawon_Contents",searchMap);
		return list;
	}
	
	@Override
	public List<BalVO> Content_Div(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.Content_Div",searchMap);
		return list;
	}
	
	// 발령내역 코드
	@Override
	public List<BalVO> BalContent(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.system.p0001.deTai",searchMap);
		return list;
	}
	
	// 현 정보
	@Override
	public List<BalVO> EM_INFO(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.EM_INFO",searchMap);
		return list;
	}
	// 발령내역이 부서
	@Override
	public List<BalVO> INFO_DEPT(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.INFO_DEPT",searchMap);
		return list;
	}
	// 발령내역이 직급
	@Override
	public List<BalVO> INFO_RANK(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.INFO_RANK",searchMap);
		return list;
	}
	// 발령내역이 호봉
	@Override
	public List<BalVO> SAL_HOBONG(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.SAL_HOBONG",searchMap);
		return list;
	}
	// 발령후 정보 -> 부서일 때
	@Override
	public List<BalVO> BalAfter_INFO(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.BalAfter_INFO",searchMap);
		return list;
	}
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.insert("hr.human.p0002.ContentInsert", row);
	}
	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0002.ContentUpdate", row);
	}
	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.delete("hr.human.p0002.ContentDelete", row);
	}
	
	//적용버튼
	@Override
	public List<BalVO> ContentInsert(Map<String, Object> searchMap) throws DataAccessException {
		sqlSession.update("hr.human.p0002.Update",searchMap);
		sqlSession.update("hr.human.p0002.apply",searchMap);
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.Content_Div",searchMap);
		return list;
	}
	

}
