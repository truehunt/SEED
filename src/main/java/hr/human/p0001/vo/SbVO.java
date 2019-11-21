package hr.human.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("h_SbVO")
public class SbVO {
	private String pk_SB_CODE;
	private String fk_SB_SAWON_CODE;
	private String sb_DIVISION;
	private String sb_NAME;
	private String sb_DATE;
	private String sb_DETAILS;
	private String sb_SIHAENGCHEO;
	private String sb_AMOUNT;
	private String sb_STA_DATE;
	private String sb_END_DATE;
	private String sb_NOTE;
	private String sb_INT_USER_ID;
	private String sb_INT_DATE;
	private String sb_MOD_USER_ID;
	private String sb_MOD_DATE;
	
	
	public SbVO() {
		System.out.println("SbVO 메서드 호출");
	}


	public String getPk_SB_CODE() {
		return pk_SB_CODE;
	}


	public void setPk_SB_CODE(String pk_SB_CODE) {
		this.pk_SB_CODE = pk_SB_CODE;
	}


	public String getFk_SB_SAWON_CODE() {
		return fk_SB_SAWON_CODE;
	}


	public void setFk_SB_SAWON_CODE(String fk_SB_SAWON_CODE) {
		this.fk_SB_SAWON_CODE = fk_SB_SAWON_CODE;
	}


	public String getSb_DIVISION() {
		return sb_DIVISION;
	}


	public void setSb_DIVISION(String sb_DIVISION) {
		this.sb_DIVISION = sb_DIVISION;
	}


	public String getSb_NAME() {
		return sb_NAME;
	}


	public void setSb_NAME(String sb_NAME) {
		this.sb_NAME = sb_NAME;
	}


	public String getSb_DATE() {
		return sb_DATE;
	}


	public void setSb_DATE(String sb_DATE) {
		this.sb_DATE = sb_DATE;
	}


	public String getSb_DETAILS() {
		return sb_DETAILS;
	}


	public void setSb_DETAILS(String sb_DETAILS) {
		this.sb_DETAILS = sb_DETAILS;
	}


	public String getSb_SIHAENGCHEO() {
		return sb_SIHAENGCHEO;
	}


	public void setSb_SIHAENGCHEO(String sb_SIHAENGCHEO) {
		this.sb_SIHAENGCHEO = sb_SIHAENGCHEO;
	}


	public String getSb_AMOUNT() {
		return sb_AMOUNT;
	}


	public void setSb_AMOUNT(String sb_AMOUNT) {
		this.sb_AMOUNT = sb_AMOUNT;
	}


	public String getSb_STA_DATE() {
		return sb_STA_DATE;
	}


	public void setSb_STA_DATE(String sb_STA_DATE) {
		this.sb_STA_DATE = sb_STA_DATE;
	}


	public String getSb_END_DATE() {
		return sb_END_DATE;
	}


	public void setSb_END_DATE(String sb_END_DATE) {
		this.sb_END_DATE = sb_END_DATE;
	}


	public String getSb_NOTE() {
		return sb_NOTE;
	}


	public void setSb_NOTE(String sb_NOTE) {
		this.sb_NOTE = sb_NOTE;
	}


	public String getSb_INT_USER_ID() {
		return sb_INT_USER_ID;
	}


	public void setSb_INT_USER_ID(String sb_INT_USER_ID) {
		this.sb_INT_USER_ID = sb_INT_USER_ID;
	}


	public String getSb_INT_DATE() {
		return sb_INT_DATE;
	}


	public void setSb_INT_DATE(String sb_INT_DATE) {
		this.sb_INT_DATE = sb_INT_DATE;
	}


	public String getSb_MOD_USER_ID() {
		return sb_MOD_USER_ID;
	}


	public void setSb_MOD_USER_ID(String sb_MOD_USER_ID) {
		this.sb_MOD_USER_ID = sb_MOD_USER_ID;
	}


	public String getSb_MOD_DATE() {
		return sb_MOD_DATE;
	}


	public void setSb_MOD_DATE(String sb_MOD_DATE) {
		this.sb_MOD_DATE = sb_MOD_DATE;
	}
	
}
