package hr.human.p0001.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import hr.human.p0001.vo.CertVO;

@Repository("h_CertDAO")
public class CertDAOImpl implements CertDAO {
	@Autowired
	private SqlSession sqlSession;
	private String num;
	private int cert_code;

	
	@Override
	public List<CertVO> ISA_cert(Map<String, Object> searchMap) throws DataAccessException {
		
		List<CertVO> list = sqlSession.selectList("hr.human.p0001.ISA_cert",searchMap);
		
		for(int i=0; i<list.size(); i++){
			num = list.get(i).getPk_CERTIFICATE_CODE();
		}
		
		if(num != null && num != "") {
			cert_code = Integer.parseInt(num);
		}else if(num == null ) {
			cert_code = 1;
		}
		
		return list;
	}
	
	//면허/자격
		@Override
		public void insertDataCert(Map<String, String> row) throws DataAccessException {
			System.out.println(row);
			cert_code++;
			if(cert_code < 10 ) {
				row.put("pk_CERTIFICATE_CODE", "000"+cert_code);
			}else if(cert_code >= 10 && cert_code < 100 ) {
				row.put("pk_CERTIFICATE_CODE", "00"+cert_code);
			}else if(cert_code >= 100 && cert_code < 1000) {
				row.put("pk_CERTIFICATE_CODE", "0"+cert_code);
			}
			sqlSession.update("hr.human.p0001.insertDataCert", row);
		}
		@Override
		
		public void updateDataCert(Map<String, String> row) throws DataAccessException {
			sqlSession.update("hr.human.p0001.updateDataCert", row);
		}
		@Override
		public void deleteDataCert(Map<String, String> row) throws DataAccessException {
			sqlSession.update("hr.human.p0001.deleteDataCert", row);
		}
}
