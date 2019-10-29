package hr.system.p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import hr.system.p0001.vo.SignDocTypeVO;
import project.common.SearchVO;

@Service
public class SignDocSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    
    @Autowired
    private DataSourceTransactionManager txManager;

    static final Logger LOGGER = LoggerFactory.getLogger(SignDocSvc.class);
    
    /**
     * 리스트.
     */
    public Integer selectSignDocTypeCount(SearchVO param) {
        return sqlSession.selectOne("selectSignDocTypeCount", param);
    }
    
    public List<?> selectSignDocTypeList(SearchVO param) {
        return sqlSession.selectList("selectSignDocTypeList", param);
    }
    
    /**
     * 저장.
     */
    public void insertSignDocType(SignDocTypeVO param, String userno) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("PK_DOCTYPE_NUM", param.getPK_DOCTYPE_NUM());
        parameters.put("DOCTYPE_DTTITLE", param.getDOCTYPE_DTTITLE());
        parameters.put("DOCTYPE_DTCONTENTS", param.getDOCTYPE_DTCONTENTS());
        parameters.put("DOCTYPE_DELETEFLAG", param.getDOCTYPE_DELETEFLAG());
        parameters.put("DOCTYPE_INT_USER_ID", param.getDOCTYPE_INT_USER_ID());
        parameters.put("DOCTYPE_INT_DATE", param.getDOCTYPE_INT_DATE());
        parameters.put("DOCTYPE_MOD_USER_ID", param.getDOCTYPE_MOD_USER_ID());
        parameters.put("DOCTYPE_MOD_DATE", param.getDOCTYPE_MOD_DATE());
        parameters.put("PK_SAWON_CODE", userno);

        try {
            if (param.getPK_DOCTYPE_NUM()==null || "".equals(param.getPK_DOCTYPE_NUM())) {
                sqlSession.insert("insertSignDocType", parameters);
            } else {
                sqlSession.update("updateSignDocType", parameters);
            }
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            LOGGER.error("insertSignDocType");
        }            
    }

    /**
     * 읽기.
     */
    public SignDocTypeVO selectSignDocTypeOne(String param) {
        return sqlSession.selectOne("selectSignDocTypeOne", param);
    }

    /**
     * 삭제.
     */
    public void deleteSignDocType(SignDocTypeVO param) {
        sqlSession.update("deleteSignDocType", param);
    }

}
