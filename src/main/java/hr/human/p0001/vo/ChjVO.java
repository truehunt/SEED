package hr.human.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("h_ChjVO")
public class ChjVO {
	private String pk_CHJ_CODE;
	private String fk_CHJ_SAWON_CODE;
	private String chj_COUNTRY_CODE;
	private String chj_AREA;
	private String chj_STA_YMD;
	private String chj_END_YMD;
	private String chj_AIRFARE;
	private String chj_OWN;
	private String chj_COMPANY;
	private String chj_OTHER;
	private String chj_TOTAL;
	private String chj_PURPOSE;
	private String chj_INT_USER_ID;
	private String chj_INT_DATE;
	private String chj_MOD_USER_ID;
	private String chj_MOD_DATE;

	public ChjVO() {
		System.out.println("ChjVO 메서드 호출");
	}

	public String getPk_CHJ_CODE() {
		return pk_CHJ_CODE;
	}

	public void setPk_CHJ_CODE(String pk_CHJ_CODE) {
		this.pk_CHJ_CODE = pk_CHJ_CODE;
	}

	public String getFk_CHJ_SAWON_CODE() {
		return fk_CHJ_SAWON_CODE;
	}

	public void setFk_CHJ_SAWON_CODE(String fk_CHJ_SAWON_CODE) {
		this.fk_CHJ_SAWON_CODE = fk_CHJ_SAWON_CODE;
	}

	public String getChj_COUNTRY_CODE() {
		return chj_COUNTRY_CODE;
	}

	public void setChj_COUNTRY_CODE(String chj_COUNTRY_CODE) {
		this.chj_COUNTRY_CODE = chj_COUNTRY_CODE;
	}

	public String getChj_AREA() {
		return chj_AREA;
	}

	public void setChj_AREA(String chj_AREA) {
		this.chj_AREA = chj_AREA;
	}

	public String getChj_STA_YMD() {
		return chj_STA_YMD;
	}

	public void setChj_STA_YMD(String chj_STA_YMD) {
		this.chj_STA_YMD = chj_STA_YMD;
	}

	public String getChj_END_YMD() {
		return chj_END_YMD;
	}

	public void setChj_END_YMD(String chj_END_YMD) {
		this.chj_END_YMD = chj_END_YMD;
	}

	public String getChj_AIRFARE() {
		return chj_AIRFARE;
	}

	public void setChj_AIRFARE(String chj_AIRFARE) {
		this.chj_AIRFARE = chj_AIRFARE;
	}

	public String getChj_OWN() {
		return chj_OWN;
	}

	public void setChj_OWN(String chj_OWN) {
		this.chj_OWN = chj_OWN;
	}

	public String getChj_COMPANY() {
		return chj_COMPANY;
	}

	public void setChj_COMPANY(String chj_COMPANY) {
		this.chj_COMPANY = chj_COMPANY;
	}

	public String getChj_OTHER() {
		return chj_OTHER;
	}

	public void setChj_OTHER(String chj_OTHER) {
		this.chj_OTHER = chj_OTHER;
	}

	public String getChj_TOTAL() {
		return chj_TOTAL;
	}

	public void setChj_TOTAL(String chj_TOTAL) {
		this.chj_TOTAL = chj_TOTAL;
	}

	public String getChj_PURPOSE() {
		return chj_PURPOSE;
	}

	public void setChj_PURPOSE(String chj_PURPOSE) {
		this.chj_PURPOSE = chj_PURPOSE;
	}

	public String getChj_INT_USER_ID() {
		return chj_INT_USER_ID;
	}

	public void setChj_INT_USER_ID(String chj_INT_USER_ID) {
		this.chj_INT_USER_ID = chj_INT_USER_ID;
	}

	public String getChj_INT_DATE() {
		return chj_INT_DATE;
	}

	public void setChj_INT_DATE(String chj_INT_DATE) {
		this.chj_INT_DATE = chj_INT_DATE;
	}

	public String getChj_MOD_USER_ID() {
		return chj_MOD_USER_ID;
	}

	public void setChj_MOD_USER_ID(String chj_MOD_USER_ID) {
		this.chj_MOD_USER_ID = chj_MOD_USER_ID;
	}

	public String getChj_MOD_DATE() {
		return chj_MOD_DATE;
	}

	public void setChj_MOD_DATE(String chj_MOD_DATE) {
		this.chj_MOD_DATE = chj_MOD_DATE;
	}
	
	
}
