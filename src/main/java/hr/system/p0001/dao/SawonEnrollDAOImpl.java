package hr.system.p0001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.system.p0001.vo.SawonVO;


@Repository("sawonEnrollDAO")
public class SawonEnrollDAOImpl implements SawonEnrollDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SawonVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<SawonVO> list = sqlSession.selectList("hr.system.p0001.SEsearchList", searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.system.p0001.SEinsertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.system.p0001.SEupdateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.system.p0001.SEdeleteData", row);
	}

}
