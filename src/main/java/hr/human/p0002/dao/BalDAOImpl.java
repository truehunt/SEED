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
	public List<BalVO> Sawon(Map<String, Object> searchMap) {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.Sawon",searchMap);
		return list;
	}
	
	@Override
	public List<BalVO> DeptList(Map<String, Object> searchMap) {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.DeptList",searchMap);
		return list;
	}
	
	@Override
	public List<BalVO> Sawon_NC(Map<String, Object> searchMap) {
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.Sawon_NC_1",searchMap);
		return list;
	}
	

	@Override
	public List<BalVO> Sawon_Add_Search(Map<String, Object> searchMap) {
		System.out.println(searchMap);
		List<BalVO> list = sqlSession.selectList("hr.human.p0002.Sawon_Add_Search",searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		System.out.println(row);
		sqlSession.update("hr.human.p0002.insertDataBal", row);
	}
	@Override
	public void insertData2(Map<String, String> row) {
		System.out.println("2. "+row);
		sqlSession.update("hr.human.p0002.insertDataBal2", row);
	}
	
	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		System.out.println(row);
		sqlSession.update("hr.human.p0002.updateDataBal", row);
	}
	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		System.out.println(row);
		sqlSession.update("hr.human.p0002.deleteDataBal", row);
	}

}
