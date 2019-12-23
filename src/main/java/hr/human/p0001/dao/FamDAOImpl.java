package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.vo.CardFamVO;

@Repository("h_FamDAO")
public class FamDAOImpl implements FamDAO {
	@Autowired
	private SqlSession sqlSession;
	private String num;
	private int fam_code;

	
	@Override
	public List<CardFamVO> ISA_fam(Map<String, Object> searchMap) throws DataAccessException {
		List<CardFamVO> list = sqlSession.selectList("hr.human.p0001.ISA_fam",searchMap);
		for(int i=0; i<list.size(); i++){
			num = list.get(i).getPk_FAM_CODE();
		}
		
		if(num != null && num != "") {
			fam_code = Integer.parseInt(num);
		}else if(num == null ) {
			fam_code = 1;
		}
		
		return list;
	}
	
	
	
	//가족
	@Override
	public void insertDataFam(Map<String, String> row) throws DataAccessException {
		fam_code++;
		if(fam_code < 10 ) {
			row.put("pk_FAM_CODE", "000"+fam_code);
		}else if(fam_code >= 10 && fam_code < 100 ) {
			row.put("pk_FAM_CODE", "00"+fam_code);
		}else if(fam_code >= 100 && fam_code < 1000) {
			row.put("pk_FAM_CODE", "0"+fam_code);
		}
		
		sqlSession.update("hr.human.p0001.insertDataFam", row);
	}
	@Override
	public void updateDataFam(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.updateDataFam", row);
	}
	@Override
	public void deleteDataFam(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.deleteDataFam", row);
	}


}
