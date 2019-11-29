package hr.human.p0008.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0008.vo.education_evaluationVO;






@Repository("education_evaluationDAO")
public class education_evaluationDAOImpl implements education_evaluationDAO {
   @Autowired
   private SqlSession sqlSession;

   @Override
   public List<education_evaluationVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<education_evaluationVO> list = sqlSession.selectList("hr.human.p0008.searchList", searchMap);
      return list;
   }
   
   @Override
   public List<education_evaluationVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
      List<education_evaluationVO> list = sqlSession.selectList("hr.human.p0008.searchList2", searchMap);
      return list;
   }
   
   @Override
   public List<education_evaluationVO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
      List<education_evaluationVO> list = sqlSession.selectList("hr.human.p0008.searchList3", searchMap);
      return list;
   }
   
   
    @Override
   public void insertData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0008.insertData", row);
   }

    
    @Override
   public void insertData2(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0008.insertData2", row);
   }
   @Override
   public void updateData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0008.updateData", row);
   }

   @Override
   public void deleteData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0008.deleteData", row);
   }

   @Override
   public void updateData2(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0008.updateData2", row);
   }

   @Override
   public void deleteData2(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0008.deleteData2", row);
   }
   
}