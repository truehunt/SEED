package hr.human.s0003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.s0003.vo.DeptEnroll_VO;




@Repository("addeptEnroll_DAO")
public class deptEnroll_DAOImpl implements deptEnroll_DAO {
   @Autowired
   private SqlSession sqlSession;

   @Override
   public List<DeptEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<DeptEnroll_VO> list = sqlSession.selectList("hr.human.s0003.searchList", searchMap);
      return list;
   }
   
    @Override
   public void insertData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.s0003.insertData", row);
   }

   @Override
   public void updateData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.s0003.updateData", row);
   }

   @Override
   public void deleteData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.s0003.deleteData", row);
   }

}