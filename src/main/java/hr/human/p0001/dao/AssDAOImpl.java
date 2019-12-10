package hr.human.p0001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.vo.AssVO;

@Repository("h_AssDAO")
public class AssDAOImpl implements AssDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AssVO> ISA_ass(Map<String, Object> searchMap) throws DataAccessException {
		List<AssVO> list = sqlSession.selectList("hr.human.p0001.ISA_ass",searchMap);
		return list;
	}
	
	//
	@Override
	public void insertDataAss(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.insertDataAss", row);
	}
	@Override
	public void updateDataAss(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.updateDataAss", row);
	}
	@Override
	public void deleteDataAss(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.deleteDataAss", row);
	}


}
