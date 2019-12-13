package hr.human.p0007.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.human.p0002.vo.BalVO;
import hr.human.p0007.dao.education_manageDAO;
import hr.human.p0007.vo.education_manageVO;
import hr.pay.p0001.vo.TA_inputVO;






@Service("education_manageService")
@Transactional(propagation = Propagation.REQUIRED)
public class education_manageServiceImpl implements education_manageService {
   @Autowired
   private education_manageDAO education_manageDAO;

   @Override
   public List<education_manageVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
      List<education_manageVO> list =  education_manageDAO.searchList(searchMap); 
      return list;
   }
   
   @Override
   public List<education_manageVO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
      List<education_manageVO> list =  education_manageDAO.searchList2(searchMap); 
      return list;
   }
   
   @Override
   public List<education_manageVO> searchList3(Map<String, Object> searchMap) throws DataAccessException {
      List<education_manageVO> list =  education_manageDAO.searchList3(searchMap); 
      return list;
   }
   
	@Override
	public List<education_manageVO> sawon_search(Map<String, Object> searchMap) {
		List<education_manageVO> list =  education_manageDAO.sawon_search(searchMap);
		return list;
	}
   
   
	@Override
	public List<education_manageVO> DeptList(Map<String, Object> searchMap) throws DataAccessException {
		List<education_manageVO> list =  education_manageDAO.DeptList(searchMap); 
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
        	 education_manageDAO.insertData(row);
         }else if("U".equals(str)) { // ����
        	 education_manageDAO.updateData(row);
         }else if("D".equals(str)) { // ����
        	 education_manageDAO.deleteData(row);
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
        	 education_manageDAO.insertData2(row);
         }else if("U".equals(str)) { // ����
        	 education_manageDAO.updateData2(row);
         }else if("D".equals(str)) { // ����
        	 education_manageDAO.deleteData2(row);
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
        	 education_manageDAO.insertData3(row);
         }else if("U".equals(str)) { // ����
        	 education_manageDAO.updateData3(row);
         }else if("D".equals(str)) { // ����
        	 education_manageDAO.deleteData3(row);
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