package hr.human.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("h_CardFamVO")
public class CardFamVO {
	private String pk_FAM_CODE;
	private String fk_FAM_SAWON_CODE;
	private String fam_NAME;
	private String fam_RELATIONS;
	private String fam_LIVE;
	private String fam_RES_NUM;
	private String fam_SUDANG;
	private String fam_DISABLED_CODE;
	private String fam_LOCAL_CODE;
	private String fam_BIRTH_DATE;
	private String fam_SOLAR_CODE;
	private String fam_HAGLYEOG_CODE;
	private String fam_GRADUATION_CODE;
	private String fam_JOB;
	private String fam_WORK_NAME;
	private String fam_POSITION;
	private String fam_INT_USER_ID;
	private String fam_INT_DATE;
	private String fam_MOD_USER_ID;
	private String fam_MOD_DATE;
	private String num;
	
	public CardFamVO() {
		System.out.println("FamVO 메서드호출");
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getPk_FAM_CODE() {
		return pk_FAM_CODE;
	}

	public void setPk_FAM_CODE(String pk_FAM_CODE) {
		this.pk_FAM_CODE = pk_FAM_CODE;
	}

	public String getFk_FAM_SAWON_CODE() {
		return fk_FAM_SAWON_CODE;
	}

	public void setFk_FAM_SAWON_CODE(String fk_FAM_SAWON_CODE) {
		this.fk_FAM_SAWON_CODE = fk_FAM_SAWON_CODE;
	}

	public String getFam_NAME() {
		return fam_NAME;
	}

	public void setFam_NAME(String fam_NAME) {
		this.fam_NAME = fam_NAME;
	}

	public String getFam_RELATIONS() {
		return fam_RELATIONS;
	}

	public void setFam_RELATIONS(String fam_RELATIONS) {
		this.fam_RELATIONS = fam_RELATIONS;
	}

	public String getFam_LIVE() {
		return fam_LIVE;
	}

	public void setFam_LIVE(String fam_LIVE) {
		this.fam_LIVE = fam_LIVE;
	}

	public String getFam_RES_NUM() {
		return fam_RES_NUM;
	}

	public void setFam_RES_NUM(String fam_RES_NUM) {
		this.fam_RES_NUM = fam_RES_NUM;
	}

	public String getFam_SUDANG() {
		return fam_SUDANG;
	}

	public void setFam_SUDANG(String fam_SUDANG) {
		this.fam_SUDANG = fam_SUDANG;
	}

	public String getFam_DISABLED_CODE() {
		return fam_DISABLED_CODE;
	}

	public void setFam_DISABLED_CODE(String fam_DISABLED_CODE) {
		this.fam_DISABLED_CODE = fam_DISABLED_CODE;
	}

	public String getFam_LOCAL_CODE() {
		return fam_LOCAL_CODE;
	}

	public void setFam_LOCAL_CODE(String fam_LOCAL_CODE) {
		this.fam_LOCAL_CODE = fam_LOCAL_CODE;
	}

	public String getFam_BIRTH_DATE() {
		return fam_BIRTH_DATE;
	}

	public void setFam_BIRTH_DATE(String fam_BIRTH_DATE) {
		this.fam_BIRTH_DATE = fam_BIRTH_DATE;
	}

	public String getFam_SOLAR_CODE() {
		return fam_SOLAR_CODE;
	}

	public void setFam_SOLAR_CODE(String fam_SOLAR_CODE) {
		this.fam_SOLAR_CODE = fam_SOLAR_CODE;
	}

	public String getFam_HAGLYEOG_CODE() {
		return fam_HAGLYEOG_CODE;
	}

	public void setFam_HAGLYEOG_CODE(String fam_HAGLYEOG_CODE) {
		this.fam_HAGLYEOG_CODE = fam_HAGLYEOG_CODE;
	}

	public String getFam_GRADUATION_CODE() {
		return fam_GRADUATION_CODE;
	}

	public void setFam_GRADUATION_CODE(String fam_GRADUATION_CODE) {
		this.fam_GRADUATION_CODE = fam_GRADUATION_CODE;
	}

	public String getFam_JOB() {
		return fam_JOB;
	}

	public void setFam_JOB(String fam_JOB) {
		this.fam_JOB = fam_JOB;
	}

	public String getFam_WORK_NAME() {
		return fam_WORK_NAME;
	}

	public void setFam_WORK_NAME(String fam_WORK_NAME) {
		this.fam_WORK_NAME = fam_WORK_NAME;
	}

	public String getFam_POSITION() {
		return fam_POSITION;
	}

	public void setFam_POSITION(String fam_POSITION) {
		this.fam_POSITION = fam_POSITION;
	}

	public String getFam_INT_USER_ID() {
		return fam_INT_USER_ID;
	}

	public void setFam_INT_USER_ID(String fam_INT_USER_ID) {
		this.fam_INT_USER_ID = fam_INT_USER_ID;
	}

	public String getFam_INT_DATE() {
		return fam_INT_DATE;
	}

	public void setFam_INT_DATE(String fam_INT_DATE) {
		this.fam_INT_DATE = fam_INT_DATE;
	}

	public String getFam_MOD_USER_ID() {
		return fam_MOD_USER_ID;
	}

	public void setFam_MOD_USER_ID(String fam_MOD_USER_ID) {
		this.fam_MOD_USER_ID = fam_MOD_USER_ID;
	}

	public String getFam_MOD_DATE() {
		return fam_MOD_DATE;
	}

	public void setFam_MOD_DATE(String fam_MOD_DATE) {
		this.fam_MOD_DATE = fam_MOD_DATE;
	}

	
}
