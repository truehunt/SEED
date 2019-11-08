package hr.human.s0002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.s0002.vo.WorkEnroll_VO;




@Repository("adworkEnroll_DAO")
public class workEnroll_DAOImpl implements workEnroll_DAO {
   @Autowired
   private SqlSession sqlSession;

   @Override
   public List<WorkEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<WorkEnroll_VO> list = sqlSession.selectList("hr.human.s0002.searchList", searchMap);
      return list;
   }
   
    @Override
   public void insertData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.s0002.insertData", row);
   }

   @Override
   public void updateData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.s0002.updateData", row);
   }

   @Override
   public void deleteData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.s0002.deleteData", row);
   }

}