package hr.attendance.p0001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.attendance.p0001.vo.day_regist_VO;
import hr.system.p0001.vo.SawonVO;




@Repository("day_regist_DAO")
public class day_regist_DAOImpl implements day_regist_DAO {
	@Autowired
	private SqlSession sqlSession;

	//출퇴근 화면 조회
	@Override
	public List<day_regist_VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<day_regist_VO> list = sqlSession.selectList("hr.attendance.p0001.searchList", searchMap);
		return list;
	}

	
	//출퇴근 화면 조회(관리자)
	@Override
	public List<day_regist_VO> da_searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<day_regist_VO> list = sqlSession.selectList("hr.attendance.p0001.searchList", searchMap);
		return list;
	}

	

	//추가, 출근
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0001.insertData", row);
	}
	


	//수정
	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0001.updateData", row);
	}

	//삭제
	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.attendance.p0001.deleteData", row);
	}

	
	//행 추가시 값넣기
		@Override
		public void GetData(Map<String, String> row) throws DataAccessException {
			sqlSession.update("hr.attendance.p0001.getData", row);
		}
}