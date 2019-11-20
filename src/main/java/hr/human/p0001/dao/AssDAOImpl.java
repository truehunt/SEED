package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.vo.AssVO;

@Repository("h_AssDAO")
public class AssDAOImpl implements AssDAO{
	@Autowired
	private SqlSession sqlSession;
	private String num;
	private int ass_code;
	
	@Override
	public List<AssVO> ISA_ass(Map<String, Object> searchMap) throws DataAccessException {
		List<AssVO> list = sqlSession.selectList("hr.human.p0001.ISA_ass",searchMap);
		for(int i=0; i<list.size(); i++){
			num = list.get(i).getPk_ASS_CODE();
			System.out.println(num);
		}
		if(num != null && num != "") {
			ass_code = Integer.parseInt(num);
		}else if(num == null ) {
			ass_code = 1;
		}
		return list;
	}
	
	//
	@Override
	public void insertDataAss(Map<String, String> row) throws DataAccessException {
		ass_code++;
		if(ass_code < 10 ) {
			row.put("pk_ASS_CODE", "000"+ass_code);
		}else if(ass_code >= 10 && ass_code < 100 ) {
			row.put("pk_ASS_CODE", "00"+ass_code);
		}else if(ass_code >= 100 && ass_code < 1000) {
			row.put("pk_ASS_CODE", "0"+ass_code);
		}
		System.out.println("row: " + row);
		sqlSession.update("hr.human.p0001.insertDataAss", row);
	}
	@Override
	public void updateDataAss(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.updateDataAss", row);
	}
	@Override
	public void deleteDataAss(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.deleteDataAss", row);
	}


}
