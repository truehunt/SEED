package hr.system.p0001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import hr.system.p0001.vo.SET_paydayVO;






@Repository("SET_paydayDAO")
public class SET_paydayDAOImpl implements SET_paydayDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SET_paydayVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("3. "+searchMap);
		List<SET_paydayVO> list = sqlSession.selectList("hr.system.p0001.SPsearchList", searchMap);
		return list;
	}
	


	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		System.out.println("1."+row);
		sqlSession.update("hr.system.p0001.SPinsertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		System.out.println("save:"+row);
		sqlSession.update("hr.system.p0001.SPupdateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.system.p0001.SPdeleteData", row);
	}

}
