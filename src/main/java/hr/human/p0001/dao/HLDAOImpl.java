package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.vo.HlVO;

@Repository("h_HlDAO")
public class HLDAOImpl implements HLDAO {
	@Autowired
	private SqlSession sqlSession;
	private String num;
	private int hl_code;

	
	@Override
	public List<HlVO> ISA_hl(Map<String, Object> searchMap) throws DataAccessException {
		List<HlVO> list = sqlSession.selectList("hr.human.p0001.ISA_hl",searchMap);
		for(int i=0; i<list.size(); i++){
			num = list.get(i).getPk_HL_CODE();
		}
		
		if(num != null && num != "") {
			hl_code = Integer.parseInt(num);
		}else if(num == null ) {
			hl_code = 1;
		}
		
		return list;
	}
	
	
	
	//가족
	@Override
	public void insertDataHL(Map<String, String> row) throws DataAccessException {
		hl_code++;
		if(hl_code < 10 ) {
			row.put("pk_HL_CODE", "000"+hl_code);
		}else if(hl_code >= 10 && hl_code < 100 ) {
			row.put("pk_HL_CODE", "00"+hl_code);
		}else if(hl_code >= 100 && hl_code < 1000) {
			row.put("pk_HL_CODE", "0"+hl_code);
		}
		
		sqlSession.update("hr.human.p0001.insertDataHL", row);
	}
	@Override
	public void updateDataHL(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.updateDataHL", row);
	}
	@Override
	public void deleteDataHL(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.deleteDataHL", row);
	}


}
