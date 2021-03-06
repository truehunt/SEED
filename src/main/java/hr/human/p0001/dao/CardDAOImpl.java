package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.elect.p0002.vo.SignImageVO;
import hr.human.p0001.dao.CardDAO;
import hr.human.p0001.vo.CardVO;
import hr.human.p0001.vo.Com_codeVO;

@Repository("h_insaCardDAO")
public class CardDAOImpl implements CardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CardVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list = sqlSession.selectList("hr.human.p0001.searchList",searchMap);
		
		return list;
	}
	
	@Override
	public List<CardVO> ISA(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list = sqlSession.selectList("hr.human.p0001.ISA",searchMap);
		return list;
	}

	@Override
	public List<CardVO> ISA_c(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list = sqlSession.selectList("hr.system.p0001.ISA_c",searchMap);
		return list;
	}
	
	@Override
	public List<Com_codeVO> COM_CODE(Map<String, Object> searchMap) throws DataAccessException {
		List<Com_codeVO> list = sqlSession.selectList("hr.human.p0001.COM_CODE",searchMap);
		return list;
	}
	
	@Override
	public List<CardVO> ISA_cha(Map<String, Object> searchMap) throws DataAccessException {
		List<CardVO> list = sqlSession.selectList("hr.human.p0001.ISA_cha",searchMap);
		return list;
	}
	
	@Override
	public void ISA_cha_N(Map<String, Object> searchMap) throws DataAccessException {
		sqlSession.selectList("hr.human.p0001.ISA_cha_N",searchMap);
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
	
	
    /**
     * 결재이미지 저장, 업데이트.
     */
    public void updateSignImage(SignImageVO param) {
    	sqlSession.insert("updateSawonImage", param);
    }
    
    /**
     * 등록된 결재 이미지 삭제
     */
    public void deleteSignImage(SignImageVO param) {
        sqlSession.update("updateSawonImage", param);
	}
	

}
