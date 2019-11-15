package hr.elect.p0001.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import hr.elect.p0001.vo.SignDocVO;
import project.common.SearchVO;




@Repository("signDAO")
public class SignDAOImpl implements SignDAO {
	@Autowired
	private SqlSession sqlSession;

	/**
     * 결제 받을 문서 리스트. -> 개인문서함
     */
	@Override
	public Integer selectSignDocTobeCount(SearchVO param) throws DataAccessException {
		return sqlSession.selectOne("selectSignDocTobeCount", param);
	}
	
	@Override
	public List<?> selectSignDocTobeList(SearchVO param) throws DataAccessException {
        return sqlSession.selectList("selectSignDocTobeList", param);
    }
	
	/**
     * 결제 할 문서 리스트. -> 결재문서함
     */
    public Integer selectSignDocCount(SearchVO param) throws DataAccessException {
        return sqlSession.selectOne("selectSignDocCount", param);
    }
    
    public List<?> selectSignDocList(SearchVO param) throws DataAccessException {
        return sqlSession.selectList("selectSignDocList", param);
    }
    
    /**
     * 읽기.
     */
    public SignDocVO selectSignDocOne(SignDocVO param) throws DataAccessException {
        return sqlSession.selectOne("selectSignDocOne", param);
    }
    
    public String selectCurrentSigner(String param) throws DataAccessException {
        return sqlSession.selectOne("selectCurrentSigner", param);
    }
    // 결재문서 첨부파일 읽기
    public List<?> selectSignFileList(String param) {
        return sqlSession.selectList("selectSignFileList", param);
    }
    /**
     * 수정화면에서 첨부파일 삭제
     */
    public void signFileDelete(String param) {
        sqlSession.insert("deleteSignFile2", param);
	}
    
    /**
     * 결재 경로.
     */
    public List<?> selectSign(String param) throws DataAccessException {
        return sqlSession.selectList("selectSign", param);
    }
    /**
     * 마지막 결재 경로.
     */
    public List<?> selectSignLast(SignDocVO param) throws DataAccessException {
        return sqlSession.selectList("selectSignLast", param);
    }
    
    /**
     * 삭제.
     */
    public void deleteSignDoc(SignDocVO param) {
        sqlSession.delete("deleteSignDoc", param);
    }
    /**
     * 회수.
     */
    public void updateSignDocCancel(String param) {
        sqlSession.update("updateSignDocCancel", param);
    }
    

}
