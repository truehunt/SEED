package hr.system.p0003.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.common.SearchVO;
import project.common.Field3VO;

@Service
public class IndexSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    
        
    // 인덱스 달력
    public List<?> selectSchList4Calen(Field3VO param) {
        return sqlSession.selectList("selectSchList4Calen", param);
    }
    
    // 인덱스 차트
    public List<?> selectBoardGroupCount4Statistic() {
        return sqlSession.selectList("selectBoardGroupCount4Statistic");
    }
    
    // 인덱스 전자결재 현황
    public Integer selectSignCount(SearchVO param) {
        return sqlSession.selectOne("selectSignCount", param);
    }
    
    public List<?> selectSignList(SearchVO param) {
        return sqlSession.selectList("selectSignList", param);
    }
    
}
