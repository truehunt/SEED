package hr.pay.p0001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import hr.pay.p0001.vo.TA_inputVO;






@Repository("TA_inputDAO")
public class TA_inputDAOImpl implements TA_inputDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TA_inputVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<TA_inputVO> list = sqlSession.selectList("hr.pay.p0001.searchList", searchMap);
		 
		return list;
	}
	
	@Override
	public List<TA_inputVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<TA_inputVO> list = sqlSession.selectList("hr.pay.p0001.searchList2", searchMap);
		 
		return list;
	}
	
	@Override
	public List<TA_inputVO> SiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<TA_inputVO> list = sqlSession.selectList("hr.pay.p0001.siteList", searchMap);
		 
		return list;
	}
	
	@Override
	public List<TA_inputVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<TA_inputVO> list = sqlSession.selectList("hr.pay.p0001.deptList", searchMap);
		 
		return list;
	}
	
	
	@Override
	public List<TA_inputVO> DeptList2(Map<String, Object> searchMap) throws DataAccessException {
		List<TA_inputVO> list = sqlSession.selectList("hr.pay.p0001.deptList2", searchMap);
		 
		return list;
	}

	
	@Override
	public List<TA_inputVO> yearday(Map<String, Object> searchMap) throws DataAccessException {
		List<TA_inputVO> list = sqlSession.selectList("hr.pay.p0001.yearday", searchMap);
		 
		return list;
	}
	
	@Override
	public List<TA_inputVO> yeardayd(Map<String, Object> searchMap) throws DataAccessException {
		List<TA_inputVO> list = sqlSession.selectList("hr.pay.p0001.yeardayd", searchMap);
		 
		return list;
	}
	
	
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.pay.p0001.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.pay.p0001.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.pay.p0001.deleteData", row);
	}

}
