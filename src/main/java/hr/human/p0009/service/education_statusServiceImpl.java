package hr.human.p0009.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.human.p0009.vo.education_statusVO;
import hr.human.p0009.dao.education_statusDAO;







@Service("education_statusService")
@Transactional(propagation = Propagation.REQUIRED)
public class education_statusServiceImpl implements education_statusService {
   @Autowired
   private education_statusDAO education_statusDAO;

   @Override
   public List<education_statusVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<education_statusVO> list =  education_statusDAO.searchList(searchMap); 
      return list;
   }
   
   @Override
   public List<education_statusVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
      List<education_statusVO> list =  education_statusDAO.searchList2(searchMap); 
      return list;
   }
   
   
   @Override
   public List<education_statusVO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
      List<education_statusVO> list =  education_statusDAO.searchList3(searchMap); 
      return list;
   }
   
   @Override
   public List<education_statusVO> searchList4(Map<String, Object> searchMap) throws DataAccessException {
      List<education_statusVO> list =  education_statusDAO.searchList4(searchMap); 
      return list;
   }

   @Override
   public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
      String[] status = dataMap.get("STATUS");
      int length = status.length; // row��
      int i = 0;
      
      for(String str : status) {
         Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
         if("I".equals(str)) { // �߰�
        	 education_statusDAO.insertData(row);
         }else if("U".equals(str)) { // ����
        	 education_statusDAO.updateData(row);
         }else if("D".equals(str)) { // ����
        	 education_statusDAO.deleteData(row);
         }
         i++;
      }
   }
   
   
   @Override
   public void saveData2(Map<String, String[]> dataMap)  throws DataAccessException  {
      String[] status = dataMap.get("STATUS");
      int length = status.length; // row��
      int i = 0;
      
      for(String str : status) {
         Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
         if("I".equals(str)) { // �߰�
        	 education_statusDAO.insertData2(row);
         }else if("U".equals(str)) { // ����
        	 education_statusDAO.updateData2(row);
         }else if("D".equals(str)) { // ����
        	 education_statusDAO.deleteData2(row);
         }
         i++;
      }
   }
   
   
   @Override
   public void saveData3(Map<String, String[]> dataMap)  throws DataAccessException  {
      String[] status = dataMap.get("STATUS");
      int length = status.length; // row��
      int i = 0;
      
      for(String str : status) {
         Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
         if("I".equals(str)) { // �߰�
        	 education_statusDAO.insertData3(row);
         }else if("U".equals(str)) { // ����
        	 education_statusDAO.updateData3(row);
         }else if("D".equals(str)) { // ����
        	 education_statusDAO.deleteData3(row);
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