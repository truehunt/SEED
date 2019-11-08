package project.common;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeptSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    
        
    public List<?> selectDepartment() {
        return sqlSession.selectList("selectDepartment");
    }
    
    /**
     * 부서저장.     
     */
    public void insertDepartment(DepartmentVO param) {
        if ("".equals(param.getDEPT_PARENTNO())) {
            param.setDEPT_PARENTNO(null); 
        }
            
        if (param.getDEPT_PARENTNO() == null || "".equals(param.getDEPT_PARENTNO())) {
             sqlSession.insert("insertDepartment", param);
        } else {
             sqlSession.insert("updateDepartment", param);
        }
    }
 
    public DepartmentVO selectDepartmentOne(String param) {
        return sqlSession.selectOne("selectDepartmentOne", param);
    }

    public void deleteDepartment(String param) {
        sqlSession.delete("deleteDepartment", param);
    }
    
}
