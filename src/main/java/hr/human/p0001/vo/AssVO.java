package hr.human.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("h_AssVO")
public class AssVO {
	private String pk_ASS_CODE;
	private String fk_ASS_SAWON_CODE;
	private String fk_ASS_PER_CODE;
	private String ass_NAME;
	private String ass_STA_DATE;
	private String ass_END_DATE;
	private String ass_DATE;
	private String ass_REFLECTANCE;
	private String ass_SCORE;
	private String ass_CLASS;
	private String ass_NOTE;
	private String ass_INT_USER_ID;
	private String ass_INT_DATE;
	private String ass_MOD_USER_ID;
	private String ass_MOD_DATE;


	public AssVO() {
		System.out.println("AssVO 메서드 호출");
	}


	public String getPk_ASS_CODE() {
		return pk_ASS_CODE;
	}


	public void setPk_ASS_CODE(String pk_ASS_CODE) {
		this.pk_ASS_CODE = pk_ASS_CODE;
	}


	public String getFk_ASS_SAWON_CODE() {
		return fk_ASS_SAWON_CODE;
	}


	public void setFk_ASS_SAWON_CODE(String fk_ASS_SAWON_CODE) {
		this.fk_ASS_SAWON_CODE = fk_ASS_SAWON_CODE;
	}


	public String getFk_ASS_PER_CODE() {
		return fk_ASS_PER_CODE;
	}


	public void setFk_ASS_PER_CODE(String fk_ASS_PER_CODE) {
		this.fk_ASS_PER_CODE = fk_ASS_PER_CODE;
	}


	public String getAss_NAME() {
		return ass_NAME;
	}


	public void setAss_NAME(String ass_NAME) {
		this.ass_NAME = ass_NAME;
	}


	public String getAss_STA_DATE() {
		return ass_STA_DATE;
	}


	public void setAss_STA_DATE(String ass_STA_DATE) {
		this.ass_STA_DATE = ass_STA_DATE;
	}


	public String getAss_END_DATE() {
		return ass_END_DATE;
	}


	public void setAss_END_DATE(String ass_END_DATE) {
		this.ass_END_DATE = ass_END_DATE;
	}


	public String getAss_DATE() {
		return ass_DATE;
	}


	public void setAss_DATE(String ass_DATE) {
		this.ass_DATE = ass_DATE;
	}


	public String getAss_REFLECTANCE() {
		return ass_REFLECTANCE;
	}


	public void setAss_REFLECTANCE(String ass_REFLECTANCE) {
		this.ass_REFLECTANCE = ass_REFLECTANCE;
	}


	public String getAss_SCORE() {
		return ass_SCORE;
	}


	public void setAss_SCORE(String ass_SCORE) {
		this.ass_SCORE = ass_SCORE;
	}


	public String getAss_CLASS() {
		return ass_CLASS;
	}


	public void setAss_CLASS(String ass_CLASS) {
		this.ass_CLASS = ass_CLASS;
	}


	public String getAss_NOTE() {
		return ass_NOTE;
	}


	public void setAss_NOTE(String ass_NOTE) {
		this.ass_NOTE = ass_NOTE;
	}


	public String getAss_INT_USER_ID() {
		return ass_INT_USER_ID;
	}


	public void setAss_INT_USER_ID(String ass_INT_USER_ID) {
		this.ass_INT_USER_ID = ass_INT_USER_ID;
	}


	public String getAss_INT_DATE() {
		return ass_INT_DATE;
	}


	public void setAss_INT_DATE(String ass_INT_DATE) {
		this.ass_INT_DATE = ass_INT_DATE;
	}


	public String getAss_MOD_USER_ID() {
		return ass_MOD_USER_ID;
	}


	public void setAss_MOD_USER_ID(String ass_MOD_USER_ID) {
		this.ass_MOD_USER_ID = ass_MOD_USER_ID;
	}


	public String getAss_MOD_DATE() {
		return ass_MOD_DATE;
	}


	public void setAss_MOD_DATE(String ass_MOD_DATE) {
		this.ass_MOD_DATE = ass_MOD_DATE;
	}

}
