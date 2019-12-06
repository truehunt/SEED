package hr.system.p0001.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.common.SearchVO;
import hr.human.p0001.vo.AssVO;
import hr.human.p0001.vo.CarVO;
import hr.human.p0001.vo.CardFamVO;
import hr.human.p0001.vo.CardVO;
import hr.human.p0001.vo.CertVO;
import hr.human.p0001.vo.ChjVO;
import hr.human.p0001.vo.HlVO;
import hr.human.p0001.vo.SbVO;
import hr.system.p0001.vo.SawonVO;

@Service
public class SawonSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    
        
    public List<?> selectUserList(String param) {
        return sqlSession.selectList("selectUserList", param);
    }
    
    public List<?> selectUserListWithDept(SearchVO param) {
        return sqlSession.selectList("selectUserListWithDept", param);
    }
    
    public Integer selectSearchMemberCount(SearchVO param) {
        return sqlSession.selectOne("selectSearchMemberCount", param);
    }
    
    public List<?> selectSearchMemberList(SearchVO param) {
        return sqlSession.selectList("selectSearchMemberList", param);
    }
    
    /**
     * 사용자 권한 변경.     
     */
    public void SawonPermissionsUpdate(SawonVO param) {
            sqlSession.update("SawonPermissionsUpdate", param);
    }
    
    /*
     * 비밀번호 변경 
     */
    public void updateUserPassword(HttpServletResponse response, SawonVO param) throws IOException {
    	response.setContentType("text/html;charset=utf-8");
  		PrintWriter out = response.getWriter();
			// 기본 비밀번호 일치여부 체크
			if(sqlSession.selectOne("check_pw", param) == null) {
				out.print("비밀번호가 일치 하지 않습니다.");
				out.close();
			}else {
			// param.setSAWON_PASSWORD(param);
  			// 비밀번호 변경
  			sqlSession.update("update_pw2", param);
  			
  			out.print("비밀번호가 변경되었습니다.");
  			out.close();
			}

    }
    
    /*내정보보기 */
    public List<?> myISA(String param) throws DataAccessException {
		return sqlSession.selectList("myISA",param);
	}
    
    public List<CardFamVO> myISA_fam(Map<String, Object> searchMap) throws DataAccessException {
    	return sqlSession.selectList("myISA_fam", searchMap);
	}
    
    public List<HlVO> myISA_hl(Map<String, Object> searchMap) throws DataAccessException {
    	return sqlSession.selectList("myISA_hl", searchMap);
	}
    
	public List<CarVO> myISA_car(Map<String, Object> searchMap) throws DataAccessException {
		return sqlSession.selectList("myISA_car", searchMap);
	}
	
	public List<CertVO> myISA_cert(Map<String, Object> searchMap) throws DataAccessException {
		return sqlSession.selectList("myISA_cert", searchMap);
	}
	
	public List<AssVO> myISA_ass(Map<String, Object> searchMap) throws DataAccessException {
		return sqlSession.selectList("myISA_ass", searchMap);
	}
	
	public List<ChjVO> myISA_chj(Map<String, Object> searchMap) throws DataAccessException {
		return sqlSession.selectList("myISA_chj", searchMap);
	}
	
	public List<SbVO> myISA_sb(Map<String, Object> searchMap) throws DataAccessException {
		return sqlSession.selectList("myISA_sb", searchMap);
	}

}
