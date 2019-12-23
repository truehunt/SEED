package hr.system.p0002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.elect.p0002.vo.SignImageVO;
import hr.system.p0001.vo.SawonVO;
import hr.system.p0002.vo.Insa_personEnroll_VO;//인적정보
import hr.system.p0002.vo.Insa_emEnroll_VO;//재직 정보
import hr.system.p0002.vo.Insa_salEnroll_VO;//급여 정보
import hr.system.p0002.vo.Insa_popup_VO;//공통 팝업

public interface Insa_infoEnroll_DAO {
	public List<SawonVO> searchList(Map<String, Object> searchMap) throws DataAccessException; // 인사정보등록
	public List<Insa_personEnroll_VO> searchList2(Map<String, Object> searchMap) throws DataAccessException; // 인사정보등록-인적 정보
	public List<Insa_emEnroll_VO> searchList3(Map<String, Object> searchMap) throws DataAccessException; // 인사정보등록-재직 정보
	public List<Insa_salEnroll_VO> searchList4(Map<String, Object> searchMap) throws DataAccessException; // 인사정보등록-급여 정보
	
	public List<Insa_popup_VO> common_pop(Map<String, Object> searchMap) throws DataAccessException; // 인사정보등록-공통 팝업
	public List<Insa_popup_VO> dept_pop(Map<String, Object> searchMap) throws DataAccessException; // 인사정보등록-부서 팝업
	public List<Insa_popup_VO> hobong_pop(Map<String, Object> searchMap) throws DataAccessException; // 인사정보등록-호봉 팝업
		 
	public void insertData(Map<String, String> row) throws DataAccessException; //위와 순서 동일
	public void insertData2(Map<String, String> row) throws DataAccessException;
	public void insertData3(Map<String, String> row) throws DataAccessException;
	public void insertData4(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException; //위와 순서 동일
	public void updateData2(Map<String, String> row) throws DataAccessException;
	public void updateData3(Map<String, String> row) throws DataAccessException;
	public void updateData4(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException; //위와 순서 동일
	public void deleteData2(Map<String, String> row) throws DataAccessException;
	public void deleteData3(Map<String, String> row) throws DataAccessException;
	public void deleteData4(Map<String, String> row) throws DataAccessException;
	 
    /**
     * 결재이미지 저장, 업데이트.
     */
    public void updateSignImage(SignImageVO param);
    /**
     * 등록된 결재 이미지 삭제
     */
    public void deleteSignImage(SignImageVO signImageInfo);
    
}
