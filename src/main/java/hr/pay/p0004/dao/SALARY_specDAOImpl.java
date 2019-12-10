package hr.pay.p0004.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.pay.p0004.vo.SALARY_specVO;








@Repository("SALARY_specDAO")
public class SALARY_specDAOImpl implements SALARY_specDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SALARY_specVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list = sqlSession.selectList("hr.pay.p0004.searchList", searchMap);
		System.out.println(searchMap);
		return list;
	}
	
	@Override
	public List<SALARY_specVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list = sqlSession.selectList("hr.pay.p0004.searchList2", searchMap);
		System.out.println(searchMap);
		return list;
	}
	
	@Override
	public List<SALARY_specVO> SiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list = sqlSession.selectList("hr.pay.p0004.siteList", searchMap);
		System.out.println(searchMap);
		return list;
	}
	
	@Override
	public List<SALARY_specVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list = sqlSession.selectList("hr.pay.p0004.deptList", searchMap);
		System.out.println(searchMap);
		return list;
	}
	
	
	@Override
	public List<SALARY_specVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list = sqlSession.selectList("hr.pay.p0004.deptList2", searchMap);
		System.out.println(searchMap);
		return list;
	}

	
	@Override
	public List<SALARY_specVO> yearday(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list = sqlSession.selectList("hr.pay.p0004.yearday", searchMap);
		System.out.println(searchMap);
		return list;
	}
	
	@Override
	public List<SALARY_specVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_specVO> list = sqlSession.selectList("hr.pay.p0004.yeardayd", searchMap);
		System.out.println(searchMap);
		return list;
	}
	
	
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		System.out.println("1."+row);
		sqlSession.update("hr.pay.p0004.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		System.out.println("save:"+row);
		sqlSession.update("hr.pay.p0004.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.pay.p0004.deleteData", row);
	}

}
