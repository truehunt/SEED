package hr.human.p0002.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.vo.Com_codeVO;
import hr.human.p0002.vo.BalVO;
import hr.system.p0001.vo.InsaCodeVO;

@Repository("h_BalDAO")
public class BalDAOImpl implements BalDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BalVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<BalVO> list = sqlSession.selectList("hr.human.p0001.searchList",searchMap);
		
		return list;
	}
	
	@Override
	public List<InsaCodeVO> Code(Map<String, Object> searchMap) {
		List<InsaCodeVO> list = sqlSession.selectList("hr.system.p0001.deTai",searchMap);
		return list;
	}
	
	@Override
	public List<BalVO> Ballyeong(Map<String, Object> searchMap) {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.Ballyeong",searchMap);
		return list;
	}
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		System.out.println(row);
		sqlSession.update("hr.human.p0002.insertData", row);
	}
	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		System.out.println(row);
		sqlSession.update("hr.human.p0002.updateData", row);
	}
	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		System.out.println(row);
		sqlSession.update("hr.human.p0002.deleteData", row);
	}


}
