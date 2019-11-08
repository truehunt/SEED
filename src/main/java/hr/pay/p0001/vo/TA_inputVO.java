package hr.pay.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("TA_inputVO")
public class TA_inputVO {
	private String fk_TA_SAWON_CODE; 
	private String ta_SAWON_NAME;
	private String ta_ATTRIBUTION;
	private String ta_PAYMENTDAY;
	private String ta_INQUIRY_CONDITION;
	private String pk_TA_WORKPLACE_CODE;
	private String ta_DIVI;
	private String ta_DAY;
	private String ta_HOUR;
	
	private String pk_WORKPLACE_CODE;
	private String workplace_NAME;
	private String workplace_HEADOFF_WHE;
	private String pk_SAWON_CODE;
	private String sawon_NAME;
	private String pk_DEPT_CODE;
	private String dept_NAME;

	

	public TA_inputVO() {
		System.out.println("MemberVO 占쎄문占쎄쉐占쎌쁽 占쎌깈�빊占�");
	}



	public String getWorkplace_HEADOFF_WHE() {
		return workplace_HEADOFF_WHE;
	}



	public void setWorkplace_HEADOFF_WHE(String workplace_HEADOFF_WHE) {
		this.workplace_HEADOFF_WHE = workplace_HEADOFF_WHE;
	}



	public String getFk_TA_SAWON_CODE() {
		return fk_TA_SAWON_CODE;
	}



	public void setFk_TA_SAWON_CODE(String fk_TA_SAWON_CODE) {
		this.fk_TA_SAWON_CODE = fk_TA_SAWON_CODE;
	}



	public String getTa_SAWON_NAME() {
		return ta_SAWON_NAME;
	}



	public void setTa_SAWON_NAME(String ta_SAWON_NAME) {
		this.ta_SAWON_NAME = ta_SAWON_NAME;
	}



	public String getTa_ATTRIBUTION() {
		return ta_ATTRIBUTION;
	}



	public void setTa_ATTRIBUTION(String ta_ATTRIBUTION) {
		this.ta_ATTRIBUTION = ta_ATTRIBUTION;
	}



	public String getTa_PAYMENTDAY() {
		return ta_PAYMENTDAY;
	}



	public void setTa_PAYMENTDAY(String ta_PAYMENTDAY) {
		this.ta_PAYMENTDAY = ta_PAYMENTDAY;
	}



	public String getTa_INQUIRY_CONDITION() {
		return ta_INQUIRY_CONDITION;
	}



	public void setTa_INQUIRY_CONDITION(String ta_INQUIRY_CONDITION) {
		this.ta_INQUIRY_CONDITION = ta_INQUIRY_CONDITION;
	}



	public String getPk_TA_WORKPLACE_CODE() {
		return pk_TA_WORKPLACE_CODE;
	}



	public void setPk_TA_WORKPLACE_CODE(String pk_TA_WORKPLACE_CODE) {
		this.pk_TA_WORKPLACE_CODE = pk_TA_WORKPLACE_CODE;
	}



	public String getTa_DIVI() {
		return ta_DIVI;
	}



	public void setTa_DIVI(String ta_DIVI) {
		this.ta_DIVI = ta_DIVI;
	}



	public String getTa_DAY() {
		return ta_DAY;
	}



	public void setTa_DAY(String ta_DAY) {
		this.ta_DAY = ta_DAY;
	}



	public String getTa_HOUR() {
		return ta_HOUR;
	}



	public void setTa_HOUR(String ta_HOUR) {
		this.ta_HOUR = ta_HOUR;
	}



	public String getPk_WORKPLACE_CODE() {
		return pk_WORKPLACE_CODE;
	}



	public void setPk_WORKPLACE_CODE(String pk_WORKPLACE_CODE) {
		this.pk_WORKPLACE_CODE = pk_WORKPLACE_CODE;
	}



	public String getWorkplace_NAME() {
		return workplace_NAME;
	}



	public void setWorkplace_NAME(String workplace_NAME) {
		this.workplace_NAME = workplace_NAME;
	}



	public String getPk_SAWON_CODE() {
		return pk_SAWON_CODE;
	}



	public void setPk_SAWON_CODE(String pk_SAWON_CODE) {
		this.pk_SAWON_CODE = pk_SAWON_CODE;
	}



	public String getSawon_NAME() {
		return sawon_NAME;
	}



	public void setSawon_NAME(String sawon_NAME) {
		this.sawon_NAME = sawon_NAME;
	}



	public String getPk_DEPT_CODE() {
		return pk_DEPT_CODE;
	}



	public void setPk_DEPT_CODE(String pk_DEPT_CODE) {
		this.pk_DEPT_CODE = pk_DEPT_CODE;
	}



	public String getDept_NAME() {
		return dept_NAME;
	}



	public void setDept_NAME(String dept_NAME) {
		this.dept_NAME = dept_NAME;
	}




	




	

	
}
