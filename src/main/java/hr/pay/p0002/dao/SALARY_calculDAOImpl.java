package hr.pay.p0002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.pay.p0001.vo.TA_inputVO;
import hr.pay.p0002.vo.SALARY_calculVO;






@Repository("SALARY_calculDAO")
public class SALARY_calculDAOImpl implements SALARY_calculDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SALARY_calculVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.searchList", searchMap);
		 
		return list;
	}
	
	@Override
	public List<SALARY_calculVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.searchList2", searchMap);
		 
		return list;
	}
	
	@Override
	public List<SALARY_calculVO> SiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.siteList", searchMap);
		 
		return list;
	}
	
	@Override
	public List<SALARY_calculVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.deptList", searchMap);
		 
		return list;
	}

	
	@Override
	public List<SALARY_calculVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.deptList2", searchMap);
		 
		return list;
	}

	
	@Override
	public List<SALARY_calculVO> yearday(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.yearday", searchMap);
		 
		return list;
	}
	
	@Override
	public List<SALARY_calculVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.yeardayd", searchMap);
		 
		return list;
	}
	
	@Override
	public List<SALARY_calculVO> payList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.payList", searchMap);
		 
		return list;
	}
	
	@Override
	public List<SALARY_calculVO> payList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.payList2", searchMap);
		 
		return list;
	}
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		System.out.println("1."+row);
		sqlSession.update("hr.pay.p0002.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		System.out.println("save:"+row);
		sqlSession.update("hr.pay.p0002.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.pay.p0002.deleteData", row);
	}

}
