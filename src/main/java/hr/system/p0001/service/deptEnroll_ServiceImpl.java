package hr.system.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.system.p0001.dao.deptEnroll_DAO;
import hr.system.p0001.vo.DeptEnroll_VO;




@Service("addeptEnroll_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class deptEnroll_ServiceImpl implements deptEnroll_Service {
   @Autowired
   private deptEnroll_DAO deptEnroll_DAO;
   
   //부서 메인
   @Override
   public List<DeptEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<DeptEnroll_VO> list =  deptEnroll_DAO.searchList(searchMap); 
      return list;
   }
   
   //부문등록 popup, 부문코드도움 popup
   @Override
   public List<DeptEnroll_VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
      List<DeptEnroll_VO> list =  deptEnroll_DAO.searchList2(searchMap); 
      return list;
   }
   
   //사업장코드도움 popup
   @Override
   public List<DeptEnroll_VO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
      List<DeptEnroll_VO> list =  deptEnroll_DAO.searchList3(searchMap); 
      return list;
   }
   
   @Override
   public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
	   System.out.println("s!");
	   String[] status = dataMap.get("STATUS");
      int length = status.length; // row��
      int i = 0;
     for(String str : status) {
         Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
         if("I".equals(str)) { // �߰�
        	 System.out.println("s!!");
        	 deptEnroll_DAO.insertData(row);
        	 
         }else if("U".equals(str)) { // ����
        	 deptEnroll_DAO.updateData(row);
         }else if("D".equals(str)) { // ����
        	 deptEnroll_DAO.deleteData(row);
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
        	 deptEnroll_DAO.insertData2(row);
         }else if("U".equals(str)) { // ����
        	 deptEnroll_DAO.updateData2(row);
         }else if("D".equals(str)) { // ����
        	 deptEnroll_DAO.deleteData2(row);
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