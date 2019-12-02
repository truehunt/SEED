package project.common;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import hr.system.p0003.vo.BoardSearchVO;

@Service
public class EtcSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    

    public List<?> selectClassCode(String param) {
        return sqlSession.selectList("selectClassCode", param);
    }
    
    public Integer selectList4UserCount(BoardSearchVO param) {
        return sqlSession.selectOne("selectList4UserCount", param);
    }
    
    public List<?> selectList4User(BoardSearchVO param) {
        return sqlSession.selectList("selectList4User", param);
    }
}
