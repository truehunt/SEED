package project.common;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

@Service
public class EtcSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    

    public List<?> selectClassCode(String param) {
        return sqlSession.selectList("selectClassCode", param);
    }
    
}
