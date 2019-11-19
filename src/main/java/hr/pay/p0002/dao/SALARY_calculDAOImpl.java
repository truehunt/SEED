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
		System.out.println(searchMap);
		return list;
	}
	
	@Override
	public List<SALARY_calculVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.searchList2", searchMap);
		System.out.println(searchMap);
		return list;
	}
	
	@Override
	public List<SALARY_calculVO> SiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.siteList", searchMap);
		System.out.println(searchMap);
		return list;
	}
	
	@Override
	public List<SALARY_calculVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.deptList", searchMap);
		System.out.println(searchMap);
		return list;
	}

	
	@Override
	public List<SALARY_calculVO> yearday(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.yearday", searchMap);
		System.out.println(searchMap);
		return list;
	}
	
	@Override
	public List<SALARY_calculVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException {
		List<SALARY_calculVO> list = sqlSession.selectList("hr.pay.p0002.salary_CAL_PAYMENTDAY", searchMap);
		System.out.println(searchMap);
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
