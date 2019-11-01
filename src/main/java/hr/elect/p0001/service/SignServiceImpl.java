package hr.elect.p0001.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import hr.elect.p0001.dao.SignDAO;
import hr.elect.p0001.vo.SignDocVO;
import hr.elect.p0001.vo.SignVO;




@Service("signService")
@Transactional(propagation = Propagation.REQUIRED)
public class SignServiceImpl implements SignService {
	@Autowired
	private SignDAO signDAO;
    @Autowired
    private SqlSessionTemplate sqlSession;    
    @Autowired
    private DataSourceTransactionManager txManager;

    static final Logger LOGGER = LoggerFactory.getLogger(SignService.class);

	/**
     * 저장.
     */
    @Override
    public void insertSignDoc(SignDocVO param) throws DataAccessException {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        
        try {
            if (param.getPK_AD_NUM()==null || "".equals(param.getPK_AD_NUM())) {
                sqlSession.insert("insertSignDoc", param);
            } else {
                sqlSession.update("updateSignDoc", param);
            }
            
            sqlSession.delete("deleteSign", param.getPK_AD_NUM());
        	String docsignpath = param.getAD_DOCSIGNPATH();
        	String[] users = docsignpath.split("\\|\\|");
        	for (int i=0; i<users.length; i++) { 
        		if ("".equals(users[i])) continue;
        		String[] arr = users[i].split(","); // 사번, 이름, 기안/합의/결제, 직책
        		SignVO param2 = new SignVO();
        		param2.setAPPROVAL_SSSTEP(Integer.toString(i));
        		param2.setFK_AD_NUM(param.getPK_AD_NUM());
        		param2.setPK_SAWON_CODE(arr[0]);
        		param2.setAPPROVAL_SSTYPE(arr[2]);
        		param2.setAPPROVAL_USER_POS(arr[3]);
        		if ("0".equals(arr[2])) {
        			param2.setAPPROVAL_SSRESULT("1");
        		} else {
        			param2.setAPPROVAL_SSRESULT("0");
        		}
        		
                sqlSession.insert("insertSign", param2);
        	}
        	
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            LOGGER.error("insertSignDoc");
        }            
    }
}
