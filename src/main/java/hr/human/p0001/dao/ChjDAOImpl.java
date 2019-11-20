package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.vo.ChjVO;

@Repository("h_ChjDAO")
public class ChjDAOImpl implements ChjDAO{
	@Autowired
	private SqlSession sqlSession;
	private String num;
	private int chj_code;
	
	@Override
	public List<ChjVO> ISA_chj(Map<String, Object> searchMap) throws DataAccessException {
		List<ChjVO> list = sqlSession.selectList("hr.human.p0001.ISA_chj",searchMap);
		for(int i=0; i<list.size(); i++){
			num = list.get(i).getPk_CHJ_CODE();
		}
		if(num != null && num != "") {
			chj_code = Integer.parseInt(num);
		}else if(num == null ) {
			chj_code = 1;
		}
		return list;
	}
	
	//
	@Override
	public void insertDataChj(Map<String, String> row) throws DataAccessException {
		chj_code++;
		if(chj_code < 10 ) {
			row.put("pk_CHJ_CODE", "000"+chj_code);
		}else if(chj_code >= 10 && chj_code < 100 ) {
			row.put("pk_CHJ_CODE", "00"+chj_code);
		}else if(chj_code >= 100 && chj_code < 1000) {
			row.put("pk_CHJ_CODE", "0"+chj_code);
		}
		sqlSession.update("hr.human.p0001.insertDataChj", row);
	}
	@Override
	public void updateDataChj(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.updateDataChj", row);
	}
	@Override
	public void deleteDataChj(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.deleteDataChj", row);
	}


}
