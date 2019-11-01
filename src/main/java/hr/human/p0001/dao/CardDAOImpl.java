package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.dao.CardDAO;
import hr.human.p0001.vo.CardVO;




@Repository("h_p0001DAO")
public class CardDAOImpl implements CardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CardVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list = sqlSession.selectList("hr.human.p0001.searchList",searchMap);
		return list;
	}
	
	@Override
	public List<CardVO> ISA(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("3. " + searchMap);
		List<CardVO> list = sqlSession.selectList("hr.system.p0001.ISA",searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.deleteData", row);
	}

}
