package hr.system.p0003.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.common.Field3VO;

@Service
public class IndexSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    
        

    public List<?> selectSchList4Calen(Field3VO param) {
        return sqlSession.selectList("selectSchList4Calen", param);
    }
    
}
