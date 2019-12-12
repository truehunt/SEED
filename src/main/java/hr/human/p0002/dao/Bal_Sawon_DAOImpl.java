package hr.human.p0002.dao;

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
	
	// 발령전정보가 있는지 확인하는 코드
		@Override
		public List<BalVO> BF_INFO(Map<String, Object> searchMap) throws DataAccessException {
			List<BalVO> list = sqlSession.selectList("hr.human.p0002.BF_INFO",searchMap);
			return list;
		}
	
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		System.out.println(row);
		sqlSession.update("hr.human.p0002.insertDataBal", row);
	}
	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		System.out.println(row);
		sqlSession.update("hr.human.p0002.updateDataBal", row);
	}
	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		System.out.println(row);
		sqlSession.update("hr.human.p0002.deleteDataBal", row);
	}

}
