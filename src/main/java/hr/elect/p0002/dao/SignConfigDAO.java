package hr.elect.p0002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.elect.p0001.vo.SignDocVO;
import hr.elect.p0001.vo.SignVO;
import hr.elect.p0002.vo.SignImageVO;
import hr.elect.p0002.vo.SignLinePathVO;
import project.common.SearchVO;




public interface SignConfigDAO {
	
	
	/**
     * 결재선 저장.
     */
    public void insertSignLinePath(SignLinePathVO param);
    
    /*
     * 결재선 불러오기 
     */
    public List<?> selectSignLinePathList(String param) throws DataAccessException;
    /**
     * 결재라인에서 저장된 결재라인 삭제
     */
    public void signLinePathDelete(String param);
    /**
     * 결재이미지 등록화면
     */
    public SignImageVO selectSignImageOne(String param);
    /**
     * 결재이미지 저장, 업데이트.
     */
    public void updateSignImage(SignImageVO param);
    /**
     * 등록된 결재 이미지 삭제
     */
    public void deleteSignImage(String param);
}
