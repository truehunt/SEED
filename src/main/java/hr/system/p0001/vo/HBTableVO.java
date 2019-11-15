package hr.system.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("HBTalbeVO")
public class HBTableVO {
	private String pk_HOBONG_TABLE_UNIQUE_NUM;
	private String fk_RANK_CODE;
	private String fk_HOBONG_CODE;
	private String fk_HOBONG_CODE_CLA_CODE;
	private String hobong_TABLE_START_DATE_APPLI;
	private String hobong_TABLE_APPLI_END_DATE;
	private String hobong_TABLE_PRICE;
	private String hobong_TABLE_INT_USER_ID;
	private String hobong_TABLE_INT_DATE;
	private String hobong_TABLE_MOD_USER_ID;
	private String hobong_TABLE_MOD_DATE;
	
	public HBTableVO() {
		System.out.println("HBTableVO 메서드호출");
	}

	public String getPk_HOBONG_TABLE_UNIQUE_NUM() {
		return pk_HOBONG_TABLE_UNIQUE_NUM;
	}

	public void setPk_HOBONG_TABLE_UNIQUE_NUM(String pk_HOBONG_TABLE_UNIQUE_NUM) {
		this.pk_HOBONG_TABLE_UNIQUE_NUM = pk_HOBONG_TABLE_UNIQUE_NUM;
	}

	public String getFk_RANK_CODE() {
		return fk_RANK_CODE;
	}

	public void setFk_RANK_CODE(String fk_RANK_CODE) {
		this.fk_RANK_CODE = fk_RANK_CODE;
	}

	public String getFk_HOBONG_CODE() {
		return fk_HOBONG_CODE;
	}

	public void setFk_HOBONG_CODE(String fk_HOBONG_CODE) {
		this.fk_HOBONG_CODE = fk_HOBONG_CODE;
	}

	public String getFk_HOBONG_CODE_CLA_CODE() {
		return fk_HOBONG_CODE_CLA_CODE;
	}

	public void setFk_HOBONG_CODE_CLA_CODE(String fk_HOBONG_CODE_CLA_CODE) {
		this.fk_HOBONG_CODE_CLA_CODE = fk_HOBONG_CODE_CLA_CODE;
	}

	public String getHobong_TABLE_START_DATE_APPLI() {
		return hobong_TABLE_START_DATE_APPLI;
	}

	public void setHobong_TABLE_START_DATE_APPLI(String hobong_TABLE_START_DATE_APPLI) {
		this.hobong_TABLE_START_DATE_APPLI = hobong_TABLE_START_DATE_APPLI;
	}

	public String getHobong_TABLE_APPLI_END_DATE() {
		return hobong_TABLE_APPLI_END_DATE;
	}

	public void setHobong_TABLE_APPLI_END_DATE(String hobong_TABLE_APPLI_END_DATE) {
		this.hobong_TABLE_APPLI_END_DATE = hobong_TABLE_APPLI_END_DATE;
	}

	public String getHobong_TABLE_PRICE() {
		return hobong_TABLE_PRICE;
	}

	public void setHobong_TABLE_PRICE(String hobong_TABLE_PRICE) {
		this.hobong_TABLE_PRICE = hobong_TABLE_PRICE;
	}

	public String getHobong_TABLE_INT_USER_ID() {
		return hobong_TABLE_INT_USER_ID;
	}

	public void setHobong_TABLE_INT_USER_ID(String hobong_TABLE_INT_USER_ID) {
		this.hobong_TABLE_INT_USER_ID = hobong_TABLE_INT_USER_ID;
	}

	public String getHobong_TABLE_INT_DATE() {
		return hobong_TABLE_INT_DATE;
	}

	public void setHobong_TABLE_INT_DATE(String hobong_TABLE_INT_DATE) {
		this.hobong_TABLE_INT_DATE = hobong_TABLE_INT_DATE;
	}

	public String getHobong_TABLE_MOD_USER_ID() {
		return hobong_TABLE_MOD_USER_ID;
	}

	public void setHobong_TABLE_MOD_USER_ID(String hobong_TABLE_MOD_USER_ID) {
		this.hobong_TABLE_MOD_USER_ID = hobong_TABLE_MOD_USER_ID;
	}

	public String getHobong_TABLE_MOD_DATE() {
		return hobong_TABLE_MOD_DATE;
	}

	public void setHobong_TABLE_MOD_DATE(String hobong_TABLE_MOD_DATE) {
		this.hobong_TABLE_MOD_DATE = hobong_TABLE_MOD_DATE;
	}
	
	
}
