package hr.pay.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("TA_inputVO")
public class TA_inputVO {
	private String pk_TA_CODE;
	private String fk_TA_SAWON_CODE;
	private String ta_SAWON_NAME;
	private String ta_INQUIRY_CONDITION;

	private String ta_TOTAL_DIVI_CODE;
	private String ta_TOTAL_DAY;
	private String ta_TOTAL_HOUR;

	private String ta_INT_USER_ID;
	private String ta_INT_DATE;
	private String ta_USER_ID;
	private String ta_MOD_DATE;
	private String fk_TA_DEPT_CODE;
	
	private String pk_SAWON_CODE;
	private String sawon_NAME;
	private String pk_DEPT_CODE;
	private String dept_NAME;
	private String pk_WORKPLACE_CODE;
	private String workplace_HEADOFF_WHE;
	
	
	private String d_B_PAYMENT_DATE_ATTRIBUT;
	private String d_B_PAYMENT_DT;
	

	private String pk_D_B_PAYMENT_SEQ_CODE;
	private String ta_TOTAL_PAYMENTDAY;
	private String workplace_NAME;
	private String pk_SAWON_WORKPLACE_CODE;
	private String workplace_INQUIRY_CODE;
	private String dept_INQUIRY_CODE;
	private String PK_TA_TOTAL_CODE;

	public TA_inputVO() {
		System.out.println("TA_inputVO");
	}



	public String getPk_TA_CODE() {
		return pk_TA_CODE;
	}



	public void setPk_TA_CODE(String pk_TA_CODE) {
		this.pk_TA_CODE = pk_TA_CODE;
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



	


	public String getTa_INQUIRY_CONDITION() {
		return ta_INQUIRY_CONDITION;
	}



	public void setTa_INQUIRY_CONDITION(String ta_INQUIRY_CONDITION) {
		this.ta_INQUIRY_CONDITION = ta_INQUIRY_CONDITION;
	}



	public String getTa_TOTAL_DIVI_CODE() {
		return ta_TOTAL_DIVI_CODE;
	}



	public void setTa_TOTAL_DIVI_CODE(String ta_TOTAL_DIVI_CODE) {
		this.ta_TOTAL_DIVI_CODE = ta_TOTAL_DIVI_CODE;
	}



	public String getTa_TOTAL_DAY() {
		return ta_TOTAL_DAY;
	}



	public void setTa_TOTAL_DAY(String ta_TOTAL_DAY) {
		this.ta_TOTAL_DAY = ta_TOTAL_DAY;
	}



	public String getTa_TOTAL_HOUR() {
		return ta_TOTAL_HOUR;
	}



	public void setTa_TOTAL_HOUR(String ta_TOTAL_HOUR) {
		this.ta_TOTAL_HOUR = ta_TOTAL_HOUR;
	}



	public String getTa_INT_USER_ID() {
		return ta_INT_USER_ID;
	}



	public void setTa_INT_USER_ID(String ta_INT_USER_ID) {
		this.ta_INT_USER_ID = ta_INT_USER_ID;
	}



	public String getTa_INT_DATE() {
		return ta_INT_DATE;
	}



	public void setTa_INT_DATE(String ta_INT_DATE) {
		this.ta_INT_DATE = ta_INT_DATE;
	}



	public String getTa_USER_ID() {
		return ta_USER_ID;
	}



	public void setTa_USER_ID(String ta_USER_ID) {
		this.ta_USER_ID = ta_USER_ID;
	}



	public String getTa_MOD_DATE() {
		return ta_MOD_DATE;
	}



	public void setTa_MOD_DATE(String ta_MOD_DATE) {
		this.ta_MOD_DATE = ta_MOD_DATE;
	}



	public String getFk_TA_DEPT_CODE() {
		return fk_TA_DEPT_CODE;
	}



	public void setFk_TA_DEPT_CODE(String fk_TA_DEPT_CODE) {
		this.fk_TA_DEPT_CODE = fk_TA_DEPT_CODE;
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



	public String getPk_WORKPLACE_CODE() {
		return pk_WORKPLACE_CODE;
	}



	public void setPk_WORKPLACE_CODE(String pk_WORKPLACE_CODE) {
		this.pk_WORKPLACE_CODE = pk_WORKPLACE_CODE;
	}



	public String getWorkplace_HEADOFF_WHE() {
		return workplace_HEADOFF_WHE;
	}



	public void setWorkplace_HEADOFF_WHE(String workplace_HEADOFF_WHE) {
		this.workplace_HEADOFF_WHE = workplace_HEADOFF_WHE;
	}



	public String getD_B_PAYMENT_DATE_ATTRIBUT() {
		return d_B_PAYMENT_DATE_ATTRIBUT;
	}



	public void setD_B_PAYMENT_DATE_ATTRIBUT(String d_B_PAYMENT_DATE_ATTRIBUT) {
		this.d_B_PAYMENT_DATE_ATTRIBUT = d_B_PAYMENT_DATE_ATTRIBUT;
	}



	public String getD_B_PAYMENT_DT() {
		return d_B_PAYMENT_DT;
	}



	public void setD_B_PAYMENT_DT(String d_B_PAYMENT_DT) {
		this.d_B_PAYMENT_DT = d_B_PAYMENT_DT;
	}



	public String getPk_D_B_PAYMENT_SEQ_CODE() {
		return pk_D_B_PAYMENT_SEQ_CODE;
	}



	public void setPk_D_B_PAYMENT_SEQ_CODE(String pk_D_B_PAYMENT_SEQ_CODE) {
		this.pk_D_B_PAYMENT_SEQ_CODE = pk_D_B_PAYMENT_SEQ_CODE;
	}



	public String getTa_TOTAL_PAYMENTDAY() {
		return ta_TOTAL_PAYMENTDAY;
	}



	public void setTa_TOTAL_PAYMENTDAY(String ta_TOTAL_PAYMENTDAY) {
		this.ta_TOTAL_PAYMENTDAY = ta_TOTAL_PAYMENTDAY;
	}



	public String getWorkplace_NAME() {
		return workplace_NAME;
	}



	public void setWorkplace_NAME(String workplace_NAME) {
		this.workplace_NAME = workplace_NAME;
	}



	public String getPk_SAWON_WORKPLACE_CODE() {
		return pk_SAWON_WORKPLACE_CODE;
	}



	public void setPk_SAWON_WORKPLACE_CODE(String pk_SAWON_WORKPLACE_CODE) {
		this.pk_SAWON_WORKPLACE_CODE = pk_SAWON_WORKPLACE_CODE;
	}



	public String getWorkplace_INQUIRY_CODE() {
		return workplace_INQUIRY_CODE;
	}



	public void setWorkplace_INQUIRY_CODE(String workplace_INQUIRY_CODE) {
		this.workplace_INQUIRY_CODE = workplace_INQUIRY_CODE;
	}



	public String getDept_INQUIRY_CODE() {
		return dept_INQUIRY_CODE;
	}



	public void setDept_INQUIRY_CODE(String dept_INQUIRY_CODE) {
		this.dept_INQUIRY_CODE = dept_INQUIRY_CODE;
	}



	public String getPK_TA_TOTAL_CODE() {
		return PK_TA_TOTAL_CODE;
	}



	public void setPK_TA_TOTAL_CODE(String pK_TA_TOTAL_CODE) {
		PK_TA_TOTAL_CODE = pK_TA_TOTAL_CODE;
	}







	

	
}
