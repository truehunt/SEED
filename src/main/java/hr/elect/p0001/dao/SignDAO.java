package hr.elect.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.elect.p0001.vo.SignDocVO;
import hr.elect.p0001.vo.SignVO;
import project.common.SearchVO;




public interface SignDAO {
	
	/**
     * 결제 받을 문서 리스트. -> 개인문서함
     */
	 public Integer selectSignDocTobeCount(SearchVO param) throws DataAccessException;
	 public List<?> selectSignDocTobeList(SearchVO param) throws DataAccessException;
	 /**
     * 결제 할 문서 리스트. -> 결재문서함
     */
	 public Integer selectSignDocCount(SearchVO param) throws DataAccessException;
	 public List<?> selectSignDocList(SearchVO param) throws DataAccessException;
	 /**
     * 읽기.
     */
	 public SignDocVO selectSignDocOne(SignDocVO param) throws DataAccessException;
	 public String selectCurrentSigner(String param) throws DataAccessException;
	 public List<?> selectSignFileList(String param) throws DataAccessException;
	 public void signFileDelete(String param) throws DataAccessException;
	 /**
     * 결재 경로.
     */
	 public List<?> selectSign(String param) throws DataAccessException;
	 /**
     * 마지막 결재 경로.
     */
	 public List<?> selectSignLast(SignDocVO param) throws DataAccessException;
	 /**
     * 삭제.
     */
	 public void deleteSignDoc(SignDocVO param) throws DataAccessException;
	 /**
     * 회수.
     */
	 public void updateSignDocCancel(String param) throws DataAccessException;
	 
}
