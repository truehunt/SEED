package hr.attendance.p0002.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.attendance.p0002.vo.business_VO;
import hr.attendance.p0002.vo.holiday_VO;




@Repository("holiday_DAO")
public class holiday_DAOImpl implements holiday_DAO {
	@Autowired
	private SqlSession sqlSession;

	//조회
	@Override
	public List<business_VO> searchList_busin(Map<String, Object> searchMap) throws DataAccessException {
		
		List<business_VO> list = sqlSession.selectList("hr.attendance.p0002.searchList_busin", searchMap);
		System.out.println("DAO_searchList: "+list);
		return list;
	}

	@Override
	public List<holiday_VO> searchList_holi(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("holi_search: "+searchMap);
		List<holiday_VO> list = sqlSession.selectList("hr.attendance.p0002.searchList_holi", searchMap);
		return list;
		
	}
	
	
	@Override
	public List<HashMap<String,String>> select() throws DataAccessException {

		List<HashMap<String,String>> list = sqlSession.selectList("hr.attendance.p0002.select");
		return list;
	}

	//�߰�, ���
	@Override
	public void insertData_holi(Map<String, String> row) throws DataAccessException {
		System.out.println("holiday_DAO : " +row);
		sqlSession.insert("hr.attendance.p0002.insertData_holi", row);
	}

	//����
	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0002.updateData", row);
	}

	//����
	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0002.deleteData", row);
	}

	
	//�� �߰��� ���ֱ�
		@Override
		public void GetData(Map<String, String> row) throws DataAccessException {
			sqlSession.update("hr.attendance.p0002.getData", row);
		}
}