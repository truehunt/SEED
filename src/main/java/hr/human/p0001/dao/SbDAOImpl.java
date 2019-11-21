package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.vo.SbVO;

@Repository("h_SbDAO")
public class SbDAOImpl implements SbDAO{
	@Autowired
	private SqlSession sqlSession;
	private String num;
	private int sb_code;
	
	@Override
	public List<SbVO> ISA_sb(Map<String, Object> searchMap) throws DataAccessException {
		List<SbVO> list = sqlSession.selectList("hr.human.p0001.ISA_sb",searchMap);
		for(int i=0; i<list.size(); i++){
			num = list.get(i).getPk_SB_CODE();
		}
		if(num != null && num != "") {
			sb_code = Integer.parseInt(num);
		}else if(num == null ) {
			sb_code = 1;
		}
		return list;
	}
	
	//
	@Override
	public void insertDataSb(Map<String, String> row) throws DataAccessException {
		sb_code++;
		if(sb_code < 10 ) {
			row.put("pk_SB_CODE", "000"+sb_code);
		}else if(sb_code >= 10 && sb_code < 100 ) {
			row.put("pk_SB_CODE", "00"+sb_code);
		}else if(sb_code >= 100 && sb_code < 1000) {
			row.put("pk_SB_CODE", "0"+sb_code);
		}
		sqlSession.update("hr.human.p0001.insertDataSb", row);
	}
	@Override
	public void updateDataSb(Map<String, String> row) throws DataAccessException {
		System.out.println(" - 확인중 -  :  SB" + row);
		sqlSession.update("hr.human.p0001.updateDataSb", row);
	}
	@Override
	public void deleteDataSb(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.deleteDataSb", row);
	}


}
