package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.vo.SbVO;

@Repository("h_SbDAO")
public class SbDAOImpl implements SbDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SbVO> ISA_sb(Map<String, Object> searchMap) throws DataAccessException {
		List<SbVO> list = sqlSession.selectList("hr.human.p0001.ISA_sb",searchMap);
		return list;
	}
	
	//
	@Override
	public void insertDataSb(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.insertDataSb", row);
	}
	@Override
	public void updateDataSb(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.updateDataSb", row);
	}
	@Override
	public void deleteDataSb(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.deleteDataSb", row);
	}


}
