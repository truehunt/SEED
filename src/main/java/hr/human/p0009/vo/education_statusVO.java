package hr.human.p0009.vo;

import java.security.Timestamp;
import java.sql.Date;

import javax.xml.crypto.Data;

import org.springframework.stereotype.Component;

import oracle.sql.DATE;

@Component("education_statusVO")
public class education_statusVO {

	
        private String fk_EDUCATION_STATUS_SAWON_CODE;     // 사원코드
     	private String education_STATUS_SAWON_NAME;      //사원명
    	private String education_STATUS_DEPT;        // 부서
    	private String education_STATUS_POSITION;    // 직책
     	private String fk_EDUCATION_STATUS_EDU_CODE;    //교육코드
     	private String education_STATUS_NAME;        //교육명
     	private String education_STATUS_STA;         //교육시작일
     	private String education_STATUS_END;         //교육종료일
     	private String education_STATUS_DAYS;        //교육일수
     	private String education_STATUS_COMP;        //이수여부
     	private String education_STATUS_ATTI;        //태도점수
     	private String education_STATUS_ATTE;        //출석점수
     	private String education_STATUS_SCORE;       //평가점수
     	private String education_STATUS_SUM;         //합계
     	private String education_STATUS_PUR;         //교육목적
    	private String education_STATUS_LOCA;        //교육장소
     	private String education_STATUS_TEA;         //담당강사
     	private String education_STATUS_AGENCY;      //교육기관
     	private String education_STATUS_TIMES;       //교육시간
     	private String education_STATUS_INT_USER_ID; //입력자
     	private String education_STATUS_INT_DATE;    //입력일시
     	private String education_STATUS_USER_ID;     //수정자
     	private String education_STATUS_MOD_DATE;    //수정일시
	
	
	
	
	
	
	// 위의 선언 변수들의 GET, SET 정의 
	
	
	public education_statusVO() {
		System.out.println("education_statusVO 생성");
	}






	public String getFk_EDUCATION_STATUS_SAWON_CODE() {
		return fk_EDUCATION_STATUS_SAWON_CODE;
	}






	public void setFk_EDUCATION_STATUS_SAWON_CODE(String fk_EDUCATION_STATUS_SAWON_CODE) {
		this.fk_EDUCATION_STATUS_SAWON_CODE = fk_EDUCATION_STATUS_SAWON_CODE;
	}






	public String getEducation_STATUS_SAWON_NAME() {
		return education_STATUS_SAWON_NAME;
	}






	public void setEducation_STATUS_SAWON_NAME(String education_STATUS_SAWON_NAME) {
		this.education_STATUS_SAWON_NAME = education_STATUS_SAWON_NAME;
	}






	public String getEducation_STATUS_DEPT() {
		return education_STATUS_DEPT;
	}






	public void setEducation_STATUS_DEPT(String education_STATUS_DEPT) {
		this.education_STATUS_DEPT = education_STATUS_DEPT;
	}






	public String getEducation_STATUS_POSITION() {
		return education_STATUS_POSITION;
	}






	public void setEducation_STATUS_POSITION(String education_STATUS_POSITION) {
		this.education_STATUS_POSITION = education_STATUS_POSITION;
	}






	public String getFk_EDUCATION_STATUS_EDU_CODE() {
		return fk_EDUCATION_STATUS_EDU_CODE;
	}






	public void setFk_EDUCATION_STATUS_EDU_CODE(String fk_EDUCATION_STATUS_EDU_CODE) {
		this.fk_EDUCATION_STATUS_EDU_CODE = fk_EDUCATION_STATUS_EDU_CODE;
	}






	public String getEducation_STATUS_NAME() {
		return education_STATUS_NAME;
	}






	public void setEducation_STATUS_NAME(String education_STATUS_NAME) {
		this.education_STATUS_NAME = education_STATUS_NAME;
	}






	public String getEducation_STATUS_STA() {
		return education_STATUS_STA;
	}






	public void setEducation_STATUS_STA(String education_STATUS_STA) {
		this.education_STATUS_STA = education_STATUS_STA;
	}






	public String getEducation_STATUS_END() {
		return education_STATUS_END;
	}






	public void setEducation_STATUS_END(String education_STATUS_END) {
		this.education_STATUS_END = education_STATUS_END;
	}






	public String getEducation_STATUS_DAYS() {
		return education_STATUS_DAYS;
	}






	public void setEducation_STATUS_DAYS(String education_STATUS_DAYS) {
		this.education_STATUS_DAYS = education_STATUS_DAYS;
	}






	public String getEducation_STATUS_COMP() {
		return education_STATUS_COMP;
	}






	public void setEducation_STATUS_COMP(String education_STATUS_COMP) {
		this.education_STATUS_COMP = education_STATUS_COMP;
	}






	public String getEducation_STATUS_ATTI() {
		return education_STATUS_ATTI;
	}






	public void setEducation_STATUS_ATTI(String education_STATUS_ATTI) {
		this.education_STATUS_ATTI = education_STATUS_ATTI;
	}






	public String getEducation_STATUS_ATTE() {
		return education_STATUS_ATTE;
	}






	public void setEducation_STATUS_ATTE(String education_STATUS_ATTE) {
		this.education_STATUS_ATTE = education_STATUS_ATTE;
	}






	public String getEducation_STATUS_SCORE() {
		return education_STATUS_SCORE;
	}






	public void setEducation_STATUS_SCORE(String education_STATUS_SCORE) {
		this.education_STATUS_SCORE = education_STATUS_SCORE;
	}






	public String getEducation_STATUS_SUM() {
		return education_STATUS_SUM;
	}






	public void setEducation_STATUS_SUM(String education_STATUS_SUM) {
		this.education_STATUS_SUM = education_STATUS_SUM;
	}






	public String getEducation_STATUS_PUR() {
		return education_STATUS_PUR;
	}






	public void setEducation_STATUS_PUR(String education_STATUS_PUR) {
		this.education_STATUS_PUR = education_STATUS_PUR;
	}






	public String getEducation_STATUS_LOCA() {
		return education_STATUS_LOCA;
	}






	public void setEducation_STATUS_LOCA(String education_STATUS_LOCA) {
		this.education_STATUS_LOCA = education_STATUS_LOCA;
	}






	public String getEducation_STATUS_TEA() {
		return education_STATUS_TEA;
	}






	public void setEducation_STATUS_TEA(String education_STATUS_TEA) {
		this.education_STATUS_TEA = education_STATUS_TEA;
	}






	public String getEducation_STATUS_AGENCY() {
		return education_STATUS_AGENCY;
	}






	public void setEducation_STATUS_AGENCY(String education_STATUS_AGENCY) {
		this.education_STATUS_AGENCY = education_STATUS_AGENCY;
	}






	public String getEducation_STATUS_TIMES() {
		return education_STATUS_TIMES;
	}






	public void setEducation_STATUS_TIMES(String education_STATUS_TIMES) {
		this.education_STATUS_TIMES = education_STATUS_TIMES;
	}






	public String getEducation_STATUS_INT_USER_ID() {
		return education_STATUS_INT_USER_ID;
	}






	public void setEducation_STATUS_INT_USER_ID(String education_STATUS_INT_USER_ID) {
		this.education_STATUS_INT_USER_ID = education_STATUS_INT_USER_ID;
	}






	public String getEducation_STATUS_INT_DATE() {
		return education_STATUS_INT_DATE;
	}






	public void setEducation_STATUS_INT_DATE(String education_STATUS_INT_DATE) {
		this.education_STATUS_INT_DATE = education_STATUS_INT_DATE;
	}






	public String getEducation_STATUS_USER_ID() {
		return education_STATUS_USER_ID;
	}






	public void setEducation_STATUS_USER_ID(String education_STATUS_USER_ID) {
		this.education_STATUS_USER_ID = education_STATUS_USER_ID;
	}






	public String getEducation_STATUS_MOD_DATE() {
		return education_STATUS_MOD_DATE;
	}






	public void setEducation_STATUS_MOD_DATE(String education_STATUS_MOD_DATE) {
		this.education_STATUS_MOD_DATE = education_STATUS_MOD_DATE;
	}








    

}