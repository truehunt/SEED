package hr.human.s0001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.s0001.vo.ComEnroll_VO;




@Repository("adcomEnroll_DAO")
public class comEnroll_DAOImpl implements comEnroll_DAO {
   @Autowired
   private SqlSession sqlSession;

   @Override
   public List<ComEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<ComEnroll_VO> list = sqlSession.selectList("hr.human.s0001.searchList", searchMap);
      return list;
   }
   
   @Override
   public void insertData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.s0001.insertData", row);
   }

   @Override
   public void updateData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.s0001.updateData", row);
   }

   @Override
   public void deleteData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.s0001.deleteData", row);
   }

}