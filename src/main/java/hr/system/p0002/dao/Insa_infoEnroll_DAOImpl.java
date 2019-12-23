package hr.system.p0002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.elect.p0002.vo.SignImageVO;
import hr.system.p0001.vo.SawonVO;
import hr.system.p0002.vo.Insa_personEnroll_VO;//인적정보
import hr.system.p0002.vo.Insa_emEnroll_VO;//재직 정보
import hr.system.p0002.vo.Insa_salEnroll_VO;//급여 정보
import hr.system.p0002.vo.Insa_popup_VO;//공통 팝업

@Repository("adInsa_infoEnroll_DAO")
public class Insa_infoEnroll_DAOImpl implements Insa_infoEnroll_DAO {
   @Autowired
   private SqlSession sqlSession;

   @Override // 인사정보등록
   public List<SawonVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
   	  List<SawonVO> list = sqlSession.selectList("hr.system.p0002.searchList", searchMap);
      
      return list;
   }
   
   @Override // 인사정보등록-인적 정보
   public List<Insa_personEnroll_VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
   	  List<Insa_personEnroll_VO> list = sqlSession.selectList("hr.system.p0002.PSsearchList", searchMap);
      
      return list;
   }
   
   @Override // 인사정보등록-재직 정보
   public List<Insa_emEnroll_VO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
   	  List<Insa_emEnroll_VO> list = sqlSession.selectList("hr.system.p0002.EMsearchList", searchMap);
      
      return list;
   }
   
   @Override // 인사정보등록-급여 정보
   public List<Insa_salEnroll_VO> searchList4(Map<String, Object> searchMap) throws DataAccessException {
   	  List<Insa_salEnroll_VO> list = sqlSession.selectList("hr.system.p0002.SALsearchList", searchMap);
      
      return list;
   }
   
   @Override // 인사정보등록-공통 팝업
   public List<Insa_popup_VO> common_pop(Map<String, Object> searchMap) throws DataAccessException {
   	  List<Insa_popup_VO> list = sqlSession.selectList("hr.system.p0002.PopsearchList", searchMap);
      
      return list;
   }
   
   @Override // 인사정보등록-부서 팝업
   public List<Insa_popup_VO> dept_pop(Map<String, Object> searchMap) throws DataAccessException {
   	  List<Insa_popup_VO> list = sqlSession.selectList("hr.system.p0002.Dept_PopsearchList", searchMap);
      
      return list;
   }
   
   @Override // 인사정보등록-호봉 팝업
   public List<Insa_popup_VO> hobong_pop(Map<String, Object> searchMap) throws DataAccessException {
   	  List<Insa_popup_VO> list = sqlSession.selectList("hr.system.p0002.Hobong_PopsearchList", searchMap);
      
      return list;
   }
   
    @Override // 인사정보등록
   public void insertData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0002.insertData", row);
   }
    
    @Override // 인사정보등록-인적 정보
   public void insertData2(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0002.PSinsertData", row);
   }
    
    @Override // 인사정보등록-재직 정보
   public void insertData3(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0002.EMinsertData", row);
   }
    
    @Override // 인사정보등록-급여 정보
   public void insertData4(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0002.SALinsertData", row);
   }
    

   @Override // 인사정보등록
   public void updateData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0002.updateData", row);
   }
   
   @Override // 인사정보등록-인적 정보
   public void updateData2(Map<String, String> row) throws DataAccessException {
	  System.out.println("아아");
      sqlSession.update("hr.system.p0002.PSupdateData", row);
   }
   
   @Override // 인사정보등록-재직 정보
   public void updateData3(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0002.EMupdateData", row);
   }
   
   @Override // 인사정보등록-급여 정보
   public void updateData4(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0002.SALupdateData", row);
   }

   @Override // 인사정보등록
   public void deleteData(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0002.deleteData", row);
   }
   
   @Override // 인사정보등록-인적 정보
   public void deleteData2(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0002.PSdeleteData", row);
   }
   
   @Override // 인사정보등록-재직 정보
   public void deleteData3(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0002.EMdeleteData", row);
   }
   
   @Override // 인사정보등록-급여 정보
   public void deleteData4(Map<String, String> row) throws DataAccessException {
      sqlSession.update("hr.system.p0002.SALdeleteData", row);
   }
   
   /**
    * 결재이미지 저장, 업데이트.
    */
   public void updateSignImage(SignImageVO param) {
   	  sqlSession.insert("upSawonImage", param);
   }
   
   /**
    * 등록된 결재 이미지 삭제
    */
   public void deleteSignImage(SignImageVO param) {
//   	System.out.println(param);
      sqlSession.update("upSawonImage", param);
   }
	
}