package hr.system.p0001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.system.p0001.vo.ComEnroll_VO;




@Repository("adcomEnroll_DAO")
public class comEnroll_DAOImpl implements comEnroll_DAO {
   @Autowired
   private SqlSession sqlSession;

   @Override
   public List<ComEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<ComEnroll_VO> list = sqlSession.selectList("hr.system.p0001.CEsearchList", searchMap);
      return list;
   }
   
   @Override
   public void insertData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0001.CEinsertData", row);
   }

   @Override
   public void updateData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0001.CEupdateData", row);
   }

   @Override
   public void deleteData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0001.CEdeleteData", row);
   }

}