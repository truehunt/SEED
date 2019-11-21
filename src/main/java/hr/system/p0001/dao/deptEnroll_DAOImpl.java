package hr.system.p0001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.system.p0001.vo.DeptEnroll_VO;

@Repository("addeptEnroll_DAO")
public class deptEnroll_DAOImpl implements deptEnroll_DAO {
   @Autowired
   private SqlSession sqlSession;

   @Override
   public List<DeptEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<DeptEnroll_VO> list = sqlSession.selectList("hr.system.p0001.DEsearchList", searchMap);
      return list;
   }
   
   @Override
   public List<DeptEnroll_VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
      List<DeptEnroll_VO> list2 = sqlSession.selectList("hr.system.p0001.DEsearchList2", searchMap);
      return list2;
   }
   
    @Override
   public void insertData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0001.DEinsertData", row);
   }

   @Override
   public void updateData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0001.DEupdateData", row);
   }

   @Override
   public void deleteData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0001.DEdeleteData", row);
   }

}