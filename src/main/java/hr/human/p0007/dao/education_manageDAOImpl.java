package hr.human.p0007.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0002.vo.BalVO;
import hr.human.p0007.vo.education_manageVO;
import hr.pay.p0001.vo.TA_inputVO;





@Repository("education_manageDAO")
public class education_manageDAOImpl implements education_manageDAO {
   @Autowired
   private SqlSession sqlSession;

   @Override
   public List<education_manageVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<education_manageVO> list = sqlSession.selectList("hr.human.p0007.searchList", searchMap);
      return list;
   }
   
   @Override
   public List<education_manageVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
      List<education_manageVO> list = sqlSession.selectList("hr.human.p0007.searchList2", searchMap);
      return list;
   }
   
   @Override
   public List<education_manageVO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
      List<education_manageVO> list = sqlSession.selectList("hr.human.p0007.searchList3", searchMap);
      return list;
   }
   
   @Override
	public List<education_manageVO> sawon_search(Map<String, Object> searchMap) {
		List<education_manageVO> list = sqlSession.selectList("hr.human.p0007.sawon_search",searchMap);
		return list;
	}
   
   
	@Override
	public List<education_manageVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<education_manageVO> list = sqlSession.selectList("hr.human.p0007.DeptList", searchMap);
		System.out.println(searchMap);
		return list;
	}
   
    @Override
   public void insertData(Map<String, String> row) throws DataAccessException {
    	System.out.println(row);
      sqlSession.update("hr.human.p0007.insertData", row);
   }

    
    @Override
   public void insertData2(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0007.insertData2", row);
      sqlSession.update("hr.human.p0007.insertData3", row);
   }
    
    @Override
    public void insertData3(Map<String, String> row) throws DataAccessException {
       sqlSession.update("hr.human.p0007.insertData3", row);
    }
   @Override
   public void updateData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0007.updateData", row);
   }
   
   @Override
   public void updateData2(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0007.updateData2", row);
   }
   
   @Override
   public void updateData3(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0007.updateData3", row);
   }

   @Override
   public void deleteData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0007.deleteData", row);
   }

 
   @Override
   public void deleteData2(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0007.deleteData2", row);
   }
   
   @Override
   public void deleteData3(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.human.p0007.deleteData3", row);
   }
   
}