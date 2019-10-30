package hr.elect.p0001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.common.SearchVO;




@Repository("signDAO")
public class SignDAOImpl implements SignDAO {
	@Autowired
	private SqlSession sqlSession;

	/**
     * 결제 받을 문서 리스트.
     */
	@Override
	public Integer selectSignDocTobeCount(SearchVO param) throws DataAccessException {
		return sqlSession.selectOne("selectSignDocTobeCount", param);
	}
	
	@Override
	public List<?> selectSignDocTobeList(SearchVO param) throws DataAccessException {
        return sqlSession.selectList("selectSignDocTobeList", param);
    }


}
