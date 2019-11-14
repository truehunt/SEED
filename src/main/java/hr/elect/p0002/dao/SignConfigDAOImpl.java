package hr.elect.p0002.dao;

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
import hr.elect.p0002.vo.SignLinePathVO;
import project.common.SearchVO;




@Repository("SignConfigDAO")
public class SignConfigDAOImpl implements SignConfigDAO {
	@Autowired
	private SqlSession sqlSession;
	
	/**
     * 결재선 저장.
     */
    public void insertSignLinePath(SignLinePathVO param) {
        sqlSession.insert("insertSignLinePath", param);
	}
    
    /*
     * 결재선 불러오기 
     */
    @Override
	public List<?> selectSignLinePathList(String param) throws DataAccessException {
        return sqlSession.selectList("selectSignLinePathList", param);
    }
    
    /**
     * 결재라인에서 저장된 결재라인 삭제
     */
    public void signLinePathDelete(String param) {
        sqlSession.insert("signLinePathDelete", param);
	}
    

}
