package hr.system.p0001.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.common.SearchVO;
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
    
    /**
     * 사용자 저장.     
     */
    public void SawonPermissionsUpdate(SawonVO param) {
            sqlSession.update("SawonPermissionsUpdate", param);
    }
    
    public String selectUserID(String param) {
        return sqlSession.selectOne("selectUserID", param);
    }

    public SawonVO selectUserOne(String param) {
        return sqlSession.selectOne("selectUserOne", param);
    }
    
    public void deleteUser(String param) {
        sqlSession.delete("deleteUser", param);
    }

    /*
     * 사용자 
     */
    public void updateUserByMe(SawonVO param) {
        sqlSession.delete("updateUserByMe", param);
    }
    
    public void updateUserPassword(SawonVO param) {
        sqlSession.delete("updateUserPassword", param);
    }

}
