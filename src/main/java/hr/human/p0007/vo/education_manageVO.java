package hr.human.p0007.vo;

import java.security.Timestamp;
import java.sql.Date;

import javax.xml.crypto.Data;

import org.springframework.stereotype.Component;

import oracle.sql.DATE;

@Component("education_manageVO")
public class education_manageVO {

		private String pk_EDUCATION_MANA_CODE; //교육등록코드
		private String education_MANA_NAME; //교육명
		private String education_MANA_STA;//교육시작일
		private String education_MANA_END; //교육종료일
		private String education_MANA_DAYS; //교육일수
		private String education_MANA_PUR; //교육목적
		private String education_MANA_LOCA; //교육장소
		private String education_MANA_TEA; //담당강사
		private String education_MANA_AGENCY; //교육기관
		private String education_MANA_TIMES; //교육시간
		private String education_MANA_SAWON_CODE; //사원코드
		private String education_MANA_SAWON_NAME; //사원명
		private String education_MANA_DEPT; //부서
		private String education_MANA_POSITION; //직책
		
		
		private String fk_EDUCATION_ADD_CODE; //받아오는 교육코드
		private String pk_EDUCATION_ADD_SAWON_CODE; //사원코드
		private String education_ADD_SAWON_NAME; //사원명
		private String education_ADD_DEPT; //부서
		private String education_ADD_POSITION; //직책
		
		private String education_MANA_INT_USER_ID; //입력자	
		private String education_MANA_INT_DATE; //입력일시
		private String education_MANA_USER_ID; //수정자
		private String education_MANA_MOD_DATE; //수정일시
	//===========================p0008에 동시에 insert===========================
		
		private String education_EVAL_EDU_CODE;
		private String pk_EDUCATION_EVAL_SAWON_CODE;
		private String fk_EDUCATION_EVAL_SAWON_NAME;
		private String education_EVAL_DEPT;
		private String education_EVAL_POSITION;
	
	
	
	public education_manageVO() {
		System.out.println("education_manageVO 생성");
	}




	public String getPk_EDUCATION_MANA_CODE() {
		return pk_EDUCATION_MANA_CODE;
	}




	public void setPk_EDUCATION_MANA_CODE(String pk_EDUCATION_MANA_CODE) {
		this.pk_EDUCATION_MANA_CODE = pk_EDUCATION_MANA_CODE;
	}




	public String getEducation_MANA_NAME() {
		return education_MANA_NAME;
	}




	public void setEducation_MANA_NAME(String education_MANA_NAME) {
		this.education_MANA_NAME = education_MANA_NAME;
	}




	public String getEducation_MANA_STA() {
		return education_MANA_STA;
	}




	public void setEducation_MANA_STA(String education_MANA_STA) {
		this.education_MANA_STA = education_MANA_STA;
	}




	public String getEducation_MANA_END() {
		return education_MANA_END;
	}




	public void setEducation_MANA_END(String education_MANA_END) {
		this.education_MANA_END = education_MANA_END;
	}




	public String getEducation_MANA_DAYS() {
		return education_MANA_DAYS;
	}




	public void setEducation_MANA_DAYS(String education_MANA_DAYS) {
		this.education_MANA_DAYS = education_MANA_DAYS;
	}




	public String getEducation_MANA_PUR() {
		return education_MANA_PUR;
	}




	public void setEducation_MANA_PUR(String education_MANA_PUR) {
		this.education_MANA_PUR = education_MANA_PUR;
	}




	public String getEducation_MANA_LOCA() {
		return education_MANA_LOCA;
	}




	public void setEducation_MANA_LOCA(String education_MANA_LOCA) {
		this.education_MANA_LOCA = education_MANA_LOCA;
	}




	public String getEducation_MANA_TEA() {
		return education_MANA_TEA;
	}




	public void setEducation_MANA_TEA(String education_MANA_TEA) {
		this.education_MANA_TEA = education_MANA_TEA;
	}




	public String getEducation_MANA_AGENCY() {
		return education_MANA_AGENCY;
	}




	public void setEducation_MANA_AGENCY(String education_MANA_AGENCY) {
		this.education_MANA_AGENCY = education_MANA_AGENCY;
	}




	public String getEducation_MANA_TIMES() {
		return education_MANA_TIMES;
	}




	public void setEducation_MANA_TIMES(String education_MANA_TIMES) {
		this.education_MANA_TIMES = education_MANA_TIMES;
	}




	public String getEducation_MANA_SAWON_CODE() {
		return education_MANA_SAWON_CODE;
	}




	public void setEducation_MANA_SAWON_CODE(String education_MANA_SAWON_CODE) {
		this.education_MANA_SAWON_CODE = education_MANA_SAWON_CODE;
	}




	public String getEducation_MANA_SAWON_NAME() {
		return education_MANA_SAWON_NAME;
	}




	public void setEducation_MANA_SAWON_NAME(String education_MANA_SAWON_NAME) {
		this.education_MANA_SAWON_NAME = education_MANA_SAWON_NAME;
	}




	public String getEducation_MANA_DEPT() {
		return education_MANA_DEPT;
	}




	public void setEducation_MANA_DEPT(String education_MANA_DEPT) {
		this.education_MANA_DEPT = education_MANA_DEPT;
	}




	public String getEducation_MANA_POSITION() {
		return education_MANA_POSITION;
	}




	public void setEducation_MANA_POSITION(String education_MANA_POSITION) {
		this.education_MANA_POSITION = education_MANA_POSITION;
	}




	public String getFk_EDUCATION_ADD_CODE() {
		return fk_EDUCATION_ADD_CODE;
	}




	public void setFk_EDUCATION_ADD_CODE(String fk_EDUCATION_ADD_CODE) {
		this.fk_EDUCATION_ADD_CODE = fk_EDUCATION_ADD_CODE;
	}




	public String getPk_EDUCATION_ADD_SAWON_CODE() {
		return pk_EDUCATION_ADD_SAWON_CODE;
	}




	public void setPk_EDUCATION_ADD_SAWON_CODE(String pk_EDUCATION_ADD_SAWON_CODE) {
		this.pk_EDUCATION_ADD_SAWON_CODE = pk_EDUCATION_ADD_SAWON_CODE;
	}




	public String getEducation_ADD_SAWON_NAME() {
		return education_ADD_SAWON_NAME;
	}




	public void setEducation_ADD_SAWON_NAME(String education_ADD_SAWON_NAME) {
		this.education_ADD_SAWON_NAME = education_ADD_SAWON_NAME;
	}




	public String getEducation_ADD_DEPT() {
		return education_ADD_DEPT;
	}




	public void setEducation_ADD_DEPT(String education_ADD_DEPT) {
		this.education_ADD_DEPT = education_ADD_DEPT;
	}




	public String getEducation_ADD_POSITION() {
		return education_ADD_POSITION;
	}




	public void setEducation_ADD_POSITION(String education_ADD_POSITION) {
		this.education_ADD_POSITION = education_ADD_POSITION;
	}




	public String getEducation_MANA_INT_USER_ID() {
		return education_MANA_INT_USER_ID;
	}




	public void setEducation_MANA_INT_USER_ID(String education_MANA_INT_USER_ID) {
		this.education_MANA_INT_USER_ID = education_MANA_INT_USER_ID;
	}




	public String getEducation_MANA_INT_DATE() {
		return education_MANA_INT_DATE;
	}




	public void setEducation_MANA_INT_DATE(String education_MANA_INT_DATE) {
		this.education_MANA_INT_DATE = education_MANA_INT_DATE;
	}




	public String getEducation_MANA_USER_ID() {
		return education_MANA_USER_ID;
	}




	public void setEducation_MANA_USER_ID(String education_MANA_USER_ID) {
		this.education_MANA_USER_ID = education_MANA_USER_ID;
	}




	public String getEducation_MANA_MOD_DATE() {
		return education_MANA_MOD_DATE;
	}




	public void setEducation_MANA_MOD_DATE(String education_MANA_MOD_DATE) {
		this.education_MANA_MOD_DATE = education_MANA_MOD_DATE;
	}




	public String getEducation_EVAL_EDU_CODE() {
		return education_EVAL_EDU_CODE;
	}




	public void setEducation_EVAL_EDU_CODE(String education_EVAL_EDU_CODE) {
		this.education_EVAL_EDU_CODE = education_EVAL_EDU_CODE;
	}




	public String getPk_EDUCATION_EVAL_SAWON_CODE() {
		return pk_EDUCATION_EVAL_SAWON_CODE;
	}




	public void setPk_EDUCATION_EVAL_SAWON_CODE(String pk_EDUCATION_EVAL_SAWON_CODE) {
		this.pk_EDUCATION_EVAL_SAWON_CODE = pk_EDUCATION_EVAL_SAWON_CODE;
	}




	public String getFk_EDUCATION_EVAL_SAWON_NAME() {
		return fk_EDUCATION_EVAL_SAWON_NAME;
	}




	public void setFk_EDUCATION_EVAL_SAWON_NAME(String fk_EDUCATION_EVAL_SAWON_NAME) {
		this.fk_EDUCATION_EVAL_SAWON_NAME = fk_EDUCATION_EVAL_SAWON_NAME;
	}




	public String getEducation_EVAL_DEPT() {
		return education_EVAL_DEPT;
	}




	public void setEducation_EVAL_DEPT(String education_EVAL_DEPT) {
		this.education_EVAL_DEPT = education_EVAL_DEPT;
	}




	public String getEducation_EVAL_POSITION() {
		return education_EVAL_POSITION;
	}




	public void setEducation_EVAL_POSITION(String education_EVAL_POSITION) {
		this.education_EVAL_POSITION = education_EVAL_POSITION;
	}


	// 위의 선언 변수들의 GET, SET 정의 






	
    

}