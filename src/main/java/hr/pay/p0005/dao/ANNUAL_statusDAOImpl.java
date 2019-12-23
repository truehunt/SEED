package hr.pay.p0005.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import hr.pay.p0005.vo.ANNUAL_statusVO;






@Repository("ANNUAL_statusDAO")
public class ANNUAL_statusDAOImpl implements ANNUAL_statusDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ANNUAL_statusVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<ANNUAL_statusVO> list = sqlSession.selectList("hr.pay.p0005.searchList", searchMap);
		return list;
	}
	
	@Override
	public List<ANNUAL_statusVO> SiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<ANNUAL_statusVO> list = sqlSession.selectList("hr.pay.p0005.siteList", searchMap);
		return list;
	}
	
	@Override
	public List<ANNUAL_statusVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<ANNUAL_statusVO> list = sqlSession.selectList("hr.pay.p0005.deptList", searchMap);
		return list;
	}
	
	
	@Override
	public List<ANNUAL_statusVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException {
		List<ANNUAL_statusVO> list = sqlSession.selectList("hr.pay.p0005.deptList2", searchMap);
		return list;
	}
	
	@Override
	public List<ANNUAL_statusVO> yearday(Map<String, Object> searchMap) throws DataAccessException {
		List<ANNUAL_statusVO> list = sqlSession.selectList("hr.pay.p0005.yearday", searchMap);
		System.out.println(searchMap);
		return list;
	}
	
	@Override
	public List<ANNUAL_statusVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException {
		List<ANNUAL_statusVO> list = sqlSession.selectList("hr.pay.p0005.yeardayd", searchMap);
		return list;
	}
	

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.pay.p0005.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.pay.p0005.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.pay.p0005.deleteData", row);
	}

}
