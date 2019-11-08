package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.dao.CardDAO;
import hr.human.p0001.vo.CardFamVO;
import hr.human.p0001.vo.CardVO;
import hr.human.p0001.vo.Com_codeVO;
import hr.human.p0001.vo.HlVO;

@Repository("h_insaCardDAO")
public class CardDAOImpl implements CardDAO {
	@Autowired
	private SqlSession sqlSession;
	private String num;
	private int fam_code;
	private int hl_code;

	@Override
	public List<CardVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list = sqlSession.selectList("hr.human.p0001.searchList",searchMap);
		
		return list;
	}
	
	@Override
	public List<CardVO> ISA(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list = sqlSession.selectList("hr.system.p0001.ISA",searchMap);
		return list;
	}

	@Override
	public List<CardVO> ISA_c(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list = sqlSession.selectList("hr.system.p0001.ISA_c",searchMap);
		return list;
	}
	
	@Override
	public List<Com_codeVO> COM_CODE(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println(searchMap);
		List<Com_codeVO> list = sqlSession.selectList("hr.human.p0001.COM_CODE",searchMap);
		return list;
	}
	
	@Override
	public List<CardFamVO> ISA_fam(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("3. "+searchMap);
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
	
	
	//
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.insertData", row);
	}
	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.updateData", row);
	}
	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.deleteData", row);
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
	
	
	
	
	//학력
	@Override
	public void insertDataHL(Map<String, String> row) throws DataAccessException {
		hl_code++;
		if(hl_code < 10 ) {
			row.put("pk_HL_CODE", "000"+hl_code);
		}else if(hl_code >= 10 && fam_code < 100 ) {
			row.put("pk_HL_CODE", "00"+hl_code);
		}else if(hl_code >= 100 && fam_code < 1000) {
			row.put("pk_HL_CODE", "0"+hl_code);
		}
		sqlSession.update("hr.human.p0001.insertDataHL", row);
	}
	@Override
	public void updateDataHL(Map<String, String> row) throws DataAccessException {
		System.out.println("HL: "+row);
		sqlSession.update("hr.human.p0001.updateDataHL", row);
	}
	@Override
	public void deleteDataHL(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.human.p0001.deleteDataHL", row);
	}

}
