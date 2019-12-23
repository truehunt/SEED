package hr.system.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.system.p0001.vo.InsaCodeVO;
import hr.system.p0001.vo.HBTableVO;



@Repository("h_HBCodeDAO")
public class HBCodeDAOImpl implements HBCodeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<InsaCodeVO> hobongCode(Map<String, Object> searchMap) throws DataAccessException {
		List<InsaCodeVO> list = sqlSession.selectList("hr.system.p0001.hobongCode",searchMap);
		return list;
	}
	
	@Override
	public List<HBTableVO> hobongApp(Map<String, Object> searchMap) throws DataAccessException {
		List<HBTableVO> list = sqlSession.selectList("hr.system.p0001.hobongApp",searchMap);
		return list;
	}
	
	@Override
	public List<HBTableVO> hobongTable(Map<String, Object> searchMap) throws DataAccessException {
		List<HBTableVO> list = sqlSession.selectList("hr.system.p0001.hobongTable",searchMap);
		return list;
	}
	

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.system.p0001.insertHB", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.system.p0001.updateHB", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.system.p0001.deleteHB", row);
	}
	
	@Override
	public void updatePRICE(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.system.p0001.updatePrice", row);
	}

}
