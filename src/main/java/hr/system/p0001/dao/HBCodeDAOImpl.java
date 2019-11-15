package hr.system.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.system.p0001.vo.InsaCodeVO;




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
	public List<InsaCodeVO> hobongApp(Map<String, Object> searchMap) throws DataAccessException {
		List<InsaCodeVO> list = sqlSession.selectList("hr.system.p0001.hobongApp",searchMap);
		return list;
	}
	

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.system.p0001.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		System.out.println(row);
		sqlSession.update("hr.system.p0001.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.system.p0001.deleteData", row);
	}

}
