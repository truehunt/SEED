package hr.system.p0002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.system.p0002.dao.Insa_infoEnroll_DAO;
import hr.system.p0001.vo.SawonVO;
import hr.system.p0002.vo.Insa_personEnroll_VO;
import hr.system.p0002.vo.Insa_emEnroll_VO;
import hr.system.p0002.vo.Insa_salEnroll_VO;




@Service("adInsa_infoEnroll_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class Insa_infoEnroll_ServiceImpl implements Insa_infoEnroll_Service {
   @Autowired
   private Insa_infoEnroll_DAO Insa_infoEnroll_DAO;

   @Override // 인사정보등록
   public List<SawonVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<SawonVO> list =  Insa_infoEnroll_DAO.searchList(searchMap); 
      return list;
   }
   
   @Override // 인사정보등록-인적 정보
   public List<Insa_personEnroll_VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
      List<Insa_personEnroll_VO> list =  Insa_infoEnroll_DAO.searchList2(searchMap); 
      return list;
   }
   
   @Override // 인사정보등록-재직 정보
   public List<Insa_emEnroll_VO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
      List<Insa_emEnroll_VO> list =  Insa_infoEnroll_DAO.searchList3(searchMap); 
      return list;
   }
   
   @Override // 인사정보등록-급여 정보
   public List<Insa_salEnroll_VO> searchList4(Map<String, Object> searchMap) throws DataAccessException {
      List<Insa_salEnroll_VO> list =  Insa_infoEnroll_DAO.searchList4(searchMap); 
      return list;
   }
   
   @Override // 인사정보등록
   public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
      String[] status = dataMap.get("STATUS");
      int length = status.length; // row��
      int i = 0;
      
      for(String str : status) {
         Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
         if("I".equals(str)) { // �߰�
        	 Insa_infoEnroll_DAO.insertData(row);
         }else if("U".equals(str)) { // ����
        	 Insa_infoEnroll_DAO.updateData(row);
         }else if("D".equals(str)) { // ����
        	 Insa_infoEnroll_DAO.deleteData(row);
         }
         i++;
      }
   }
   
   @Override // 인사정보등록-인적 정보
   public void saveData2(Map<String, String[]> dataMap)  throws DataAccessException  {
      String[] status = dataMap.get("STATUS");
      int length = status.length; // row��
      int i = 0;
      
      for(String str : status) {
         Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
         if("I".equals(str)) { // �߰�
        	 Insa_infoEnroll_DAO.insertData2(row);
         }else if("U".equals(str)) { // ����
        	 Insa_infoEnroll_DAO.updateData2(row);
         }else if("D".equals(str)) { // ����
        	 Insa_infoEnroll_DAO.deleteData2(row);
         }
         i++;
      }
   }
   
   @Override // 인사정보등록-재직 정보
   public void saveData3(Map<String, String[]> dataMap)  throws DataAccessException  {
      String[] status = dataMap.get("STATUS");
      int length = status.length; // row��
      int i = 0;
      
      for(String str : status) {
         Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
         if("I".equals(str)) { // �߰�
        	 Insa_infoEnroll_DAO.insertData3(row);
         }else if("U".equals(str)) { // ����
        	 Insa_infoEnroll_DAO.updateData3(row);
         }else if("D".equals(str)) { // ����
        	 Insa_infoEnroll_DAO.deleteData3(row);
         }
         i++;
      }
   }
   
   @Override // 인사정보등록-급여 정보
   public void saveData4(Map<String, String[]> dataMap)  throws DataAccessException  {
      String[] status = dataMap.get("STATUS");
      int length = status.length; // row��
      int i = 0;
      
      for(String str : status) {
         Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
         if("I".equals(str)) { // �߰�
        	 Insa_infoEnroll_DAO.insertData4(row);
         }else if("U".equals(str)) { // ����
        	 Insa_infoEnroll_DAO.updateData4(row);
         }else if("D".equals(str)) { // ����
        	 Insa_infoEnroll_DAO.deleteData4(row);
         }
         i++;
      }
   }
   
   private Map getRow(Map<String, String[]> dataMap, int length, int index) {
      Map<String, String> row = new HashMap<String, String>();
      for(String name : dataMap.keySet()) {
         String[] data = dataMap.get(name);
         if(length == data.length) {
            row.put(name, data[index]);
         }
      }      
      return row;
   }

   @Override
   public void updateMember(Map<String, Object> dataMap) {
      // TODO Auto-generated method stub
      
   }

   @Override
   public void insertMember(Map<String, Object> dataMap) {
      // TODO Auto-generated method stub
      
   }   
}