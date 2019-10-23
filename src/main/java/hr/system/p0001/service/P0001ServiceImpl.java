package hr.system.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.system.p0001.vo.SawonVO;
import hr.system.p0001.vo.LoginVO;




@Service("p0001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class P0001ServiceImpl implements P0001Service {
	@Autowired
	private SqlSession sqlSession;
	
	public SawonVO selectMember4Login(LoginVO param) {
        return sqlSession.selectOne("selectMember4Login", param);
    }
    
    public void insertLogIn(String param) {
        sqlSession.insert("insertLogIn", param);
    }

    public void insertLogOut(String param) {
        sqlSession.insert("insertLogOut", param);
    }

}
