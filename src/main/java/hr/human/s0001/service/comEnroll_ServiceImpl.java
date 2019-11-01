package hr.human.s0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.human.s0001.dao.comEnroll_DAO;
import hr.human.s0001.vo.ComEnroll_VO;




@Service("adcomEnroll_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class comEnroll_ServiceImpl implements comEnroll_Service {
   @Autowired
   private comEnroll_DAO comEnroll_DAO;

   @Override
   public List<ComEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<ComEnroll_VO> list =  comEnroll_DAO.searchList(searchMap); 
      return list;
   }
   
   @Override
   public List<ComEnroll_VO> comEnrollView(Map<String, Object> searchMap) throws DataAccessException {
      List<ComEnroll_VO> list =  comEnroll_DAO.comEnrollView(searchMap); 
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
            comEnroll_DAO.insertData(row);
         }else if("U".equals(str)) { // ����
            comEnroll_DAO.updateData(row);
         }else if("D".equals(str)) { // ����
            comEnroll_DAO.deleteData(row);
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