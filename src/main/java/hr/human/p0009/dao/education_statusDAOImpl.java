package hr.human.p0009.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0009.vo.education_statusVO;







@Repository("education_statusDAO")
public class education_statusDAOImpl implements education_statusDAO {
   @Autowired
   private SqlSession sqlSession;

   @Override
   public List<education_statusVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<education_statusVO> list = sqlSession.selectList("hr.human.p0009.searchList", searchMap);
      return list;
   }
   
   @Override
   public List<education_statusVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
      List<education_statusVO> list = sqlSession.selectList("hr.human.p0009.searchList2", searchMap);
      return list;
   }
   
   @Override
   public List<education_statusVO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
      List<education_statusVO> list = sqlSession.selectList("hr.human.p0009.searchList3", searchMap);
      return list;
   }
   
   @Override
   public List<education_statusVO> searchList4(Map<String, Object> searchMap) throws DataAccessException {
      List<education_statusVO> list = sqlSession.selectList("hr.human.p0009.searchList4", searchMap);
      return list;
   }
 
   
   
    @Override
   public void insertData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0009.insertData", row);
   }

    
    @Override
   public void insertData2(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0009.insertData2", row);
      sqlSession.update("hr.human.p0009.insertData3", row);
   }
    
    @Override
    public void insertData3(Map<String, String> row) throws DataAccessException {
       sqlSession.update("hr.human.p0009.insertData3", row);
    }
   @Override
   public void updateData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0009.updateData", row);
   }
   
   @Override
   public void updateData2(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0009.updateData2", row);
   }
   
   @Override
   public void updateData3(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0009.updateData3", row);
   }

   @Override
   public void deleteData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0009.deleteData", row);
   }

 
   @Override
   public void deleteData2(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0009.deleteData2", row);
   }
   
   @Override
   public void deleteData3(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0009.deleteData3", row);
   }
   
}