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

	// 휴가
	@Override
	public List<holiday_VO> searchList_holi(Map<String, Object> searchMap) throws DataAccessException {
		List<holiday_VO> list = sqlSession.selectList("hr.attendance.p0002.searchList_holi", searchMap);
		return list;
	}

	@Override
	public List<holiday_VO> searchList_holi_da(Map<String, Object> searchMap) throws DataAccessException {
		String OX = (String) searchMap.get("pk_SAWON_CODE");
		System.out.println("ox= " + OX);
		if (OX != null) {
			List<holiday_VO> list = sqlSession.selectList("hr.attendance.p0002.searchList_holi_da", searchMap);
			return list;
		} else {
			List<holiday_VO> list = sqlSession.selectList("hr.attendance.p0002.searchList_holiM", searchMap);
			return list;
		}

	}

	// �߰�, ���
	@Override
	public void insertData_holi(Map<String, String> row) throws DataAccessException {
		sqlSession.insert("hr.attendance.p0002.insertData_holi", row);
	}

	// ����
	@Override
	public void updateData_holi(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0002.updateData_holi", row);
	}

	@Override
	public void updateData_holi_da(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0002.updateData_holi_da", row);
	}

	// ����
	@Override
	public void deleteData_holi(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0002.deleteData_holi", row);
	}

//-----------------------------------------------------------------------------------------

	// 출장
	// 조회
	@Override
	public List<business_VO> searchList_busin(Map<String, Object> searchMap) throws DataAccessException {
			List<business_VO> list = sqlSession.selectList("hr.attendance.p0002.searchList_busin", searchMap);
			return list;
	}

	@Override
	public List<business_VO> searchList_busin_da(Map<String, Object> searchMap) throws DataAccessException {
		String OX = (String) searchMap.get("pk_SAWON_CODE");
		System.out.println("ox= " + OX);
		if (OX != null) {
			List<business_VO> list = sqlSession.selectList("hr.attendance.p0002.searchList_busin_da", searchMap);
			return list;
		} else {
			List<business_VO> list = sqlSession.selectList("hr.attendance.p0002.searchList_businM", searchMap);
			return list;
		}
	}

	@Override
	public void insertData_busin(Map<String, String> row) throws DataAccessException {
		sqlSession.insert("hr.attendance.p0002.insertData_busin", row);
	}

	// ����
	@Override
	public void updateData_busin(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0002.updateData_busin", row);
	}

	@Override
	public void updateData_busin_da(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0002.updateData_busin_da", row);
		System.out.println("DAO");
	}

	// ����
	@Override
	public void deleteData_busin(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0002.deleteData_busin", row);
	}

	// ------------------------------------------------------------------------------------
	// 휴가 계산

	// 휴가
	@Override
	public List<holiday_VO> searchList_calc(Map<String, Object> searchMap) throws DataAccessException {
		List<holiday_VO> list = sqlSession.selectList("hr.attendance.p0002.searchList_calc", searchMap);
		return list;
	}

//	// 휴가
//		@Override
//		public List<holiday_VO> searchList_calc1(Map<String, Object> searchMap) throws DataAccessException {
//			List<holiday_VO> list1 = sqlSession.selectList("hr.attendance.p0002.searchList_calc1", searchMap);
//			System.out.println("DAO searchlist");
//			return list1;
//			
//		}

	// �߰�, ���
	@Override
	public void insertData_calc(Map<String, String> row) throws DataAccessException {
		sqlSession.insert("hr.attendance.p0002.insertData_calc", row);
	}

	// ����
	@Override
	public void updateData_calc(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0002.updateData_calc", row);
	}

	// ����
	@Override
	public void deleteData_calc(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0002.deleteData_holi", row);
	}

	// ----------------------------------------------------------------------------------------------------------------------------------
	// �� �߰��� ���ֱ�
	@Override
	public void GetData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0002.getData", row);
	}

	@Override
	public List<HashMap<String, String>> select() throws DataAccessException {

		List<HashMap<String, String>> list = sqlSession.selectList("hr.attendance.p0002.select");
		return list;
	}
}