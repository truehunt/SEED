package hr.human.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.elect.p0002.vo.SignImageVO;
import hr.human.p0001.vo.CardVO;
import hr.human.p0001.vo.Com_codeVO;

public interface CardDAO {
	 public List<CardVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public List<CardVO> ISA(Map<String, Object> searchMap) throws DataAccessException;
	 public List<CardVO> ISA_c(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Com_codeVO> COM_CODE(Map<String, Object> searchMap) throws DataAccessException;
	 public List<CardVO> ISA_cha(Map<String, Object> searchMap) throws DataAccessException;
	 
	public void ISA_cha_N(Map<String, Object> searchMap) throws DataAccessException;
	public void insertData(Map<String, String> row) throws DataAccessException;
	public void updateData(Map<String, String> row) throws DataAccessException;
	public void deleteData(Map<String, String> row) throws DataAccessException;
	
	
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
