package hr.elect.p0001.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import hr.elect.p0001.dao.SignDAO;
import hr.elect.p0001.vo.SignDocVO;
import hr.elect.p0001.vo.SignVO;
import project.common.FileVO;

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
    public void insertSignDoc(SignDocVO param, List<FileVO> filelist, String[] fileno) throws DataAccessException {
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
        	
        	if (fileno != null) {
                HashMap<String, String[]> fparam = new HashMap<String, String[]>();
                fparam.put("fileno", fileno);
                sqlSession.insert("deleteSignFile", fparam);
            }
            
            for (FileVO f : filelist) {
                f.setParentPK(param.getPK_AD_NUM());
                sqlSession.insert("insertSignFile", f);
            }
        	
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            LOGGER.error("insertSignDoc");
        }            
    }
    
    /**
     * 결재.
     */
    public void updateSign(SignVO param) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        
        try {
	        sqlSession.update("updateSign", param);
	        
	        // signdoc의 상태 변경: docstatus 변수를 사용해야 하나 그냥 ssresult로 사용
	        if ("2".equals(param.getAPPROVAL_SSRESULT())){	// 반려 - 결재 종료
        		param.setAPPROVAL_SSRESULT("3");
	        } else {
	        	String chk = sqlSession.selectOne("selectChkRemainSign", param);
	        	if (chk!=null) { // 다음 심사가 있으면 심사 단계 설정
	        		param.setAPPROVAL_SSSTEP("1");
	        		param.setAPPROVAL_SSRESULT("2");
	        	} else {
	        		param.setAPPROVAL_SSRESULT("4");
	        	}
	        }
        	sqlSession.update("updateSignDocStatus", param);
        	
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            LOGGER.error("updateSign");
        }            
    }
}
