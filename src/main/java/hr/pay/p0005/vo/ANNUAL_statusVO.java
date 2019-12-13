package hr.pay.p0005.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("ANNUAL_statusVO")
public class ANNUAL_statusVO {
	private String pk_SALARY_BO_STA_SAWON_CODE; 
	private String salary_BO_STA_SAWON_NAME;
	private String salary_BO_STA_ATTRIBUTION;
	private String salary_BO_STA_PAYMENTDAY;
	private String salary_BO_STA_BANK_CODE;
	private String salary_BO_STA_ACC_NUMBER;
	private String salary_BO_STA_ACT_PAY;
	
	private String pk_TA_WORKPLACE_CODE;
	private String fk_TA_SAWON_CODE;
	private String ta_SAWON_NAME;
	private String ta_ATTRIBUTION;
	private String ta_PAYMENTDAY;
	
	private String pk_WORKPLACE_CODE;
	private String workplace_NAME;
	private String workplace_HEADOFF_WHE;
	private String pk_SAWON_CODE;
	private String sawon_NAME;
	private String fk_DEPT_NAME; 
	private String rank_NAME;
	private String salary_CAL_SALARY_ITEM;
	private String salary_CAL_MONEY;
	
	
	private String pk_DEPT_CODE;
	private String dept_NAME;
	
	private String sal_INFO_TRANS_AMOUNT_O;
	private String fk_SALARY_CAL_SAWON_CODE;

	private String sal_INFO_ACC_HOLD_ONE;
	private String sal_INFO_ACC_NUM_ONE;
	private String salary_CAL_PAYMENTDAY;
	
	private String fk_WORKPLACE_CODE;
	private String fk_SAWON_WORKPLACE_CODE;
	private String fk_DEPT_CODE;
	
	
	private String pk_D_B_PAYMENT_SEQ_CODE;
	private String ta_TOTAL_PAYMENTDAY;
	private String pk_SAWON_WORKPLACE_CODE;
	private String workplace_INQUIRY_CODE;
	private String dept_INQUIRY_CODE;
	
	private String d_B_PAYMENT_DATE_ATTRIBUT;
	private String d_B_PAYMENT_DT;
	private String fk_SAWON_CODE;
	
	public ANNUAL_statusVO() {
		System.out.println("ANNUAL_statusVO");
	}


	public String getPk_SALARY_BO_STA_SAWON_CODE() {
		return pk_SALARY_BO_STA_SAWON_CODE;
	}


	public void setPk_SALARY_BO_STA_SAWON_CODE(String pk_SALARY_BO_STA_SAWON_CODE) {
		this.pk_SALARY_BO_STA_SAWON_CODE = pk_SALARY_BO_STA_SAWON_CODE;
	}


	public String getSalary_BO_STA_SAWON_NAME() {
		return salary_BO_STA_SAWON_NAME;
	}


	public void setSalary_BO_STA_SAWON_NAME(String salary_BO_STA_SAWON_NAME) {
		this.salary_BO_STA_SAWON_NAME = salary_BO_STA_SAWON_NAME;
	}


	public String getSalary_BO_STA_ATTRIBUTION() {
		return salary_BO_STA_ATTRIBUTION;
	}


	public void setSalary_BO_STA_ATTRIBUTION(String salary_BO_STA_ATTRIBUTION) {
		this.salary_BO_STA_ATTRIBUTION = salary_BO_STA_ATTRIBUTION;
	}


	public String getSalary_BO_STA_PAYMENTDAY() {
		return salary_BO_STA_PAYMENTDAY;
	}


	public void setSalary_BO_STA_PAYMENTDAY(String salary_BO_STA_PAYMENTDAY) {
		this.salary_BO_STA_PAYMENTDAY = salary_BO_STA_PAYMENTDAY;
	}


	public String getSalary_BO_STA_BANK_CODE() {
		return salary_BO_STA_BANK_CODE;
	}


	public void setSalary_BO_STA_BANK_CODE(String salary_BO_STA_BANK_CODE) {
		this.salary_BO_STA_BANK_CODE = salary_BO_STA_BANK_CODE;
	}


	public String getSalary_BO_STA_ACC_NUMBER() {
		return salary_BO_STA_ACC_NUMBER;
	}


	public void setSalary_BO_STA_ACC_NUMBER(String salary_BO_STA_ACC_NUMBER) {
		this.salary_BO_STA_ACC_NUMBER = salary_BO_STA_ACC_NUMBER;
	}


	public String getSalary_BO_STA_ACT_PAY() {
		return salary_BO_STA_ACT_PAY;
	}


	public void setSalary_BO_STA_ACT_PAY(String salary_BO_STA_ACT_PAY) {
		this.salary_BO_STA_ACT_PAY = salary_BO_STA_ACT_PAY;
	}


	public String getPk_TA_WORKPLACE_CODE() {
		return pk_TA_WORKPLACE_CODE;
	}


	public void setPk_TA_WORKPLACE_CODE(String pk_TA_WORKPLACE_CODE) {
		this.pk_TA_WORKPLACE_CODE = pk_TA_WORKPLACE_CODE;
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


	public String getWorkplace_HEADOFF_WHE() {
		return workplace_HEADOFF_WHE;
	}


	public void setWorkplace_HEADOFF_WHE(String workplace_HEADOFF_WHE) {
		this.workplace_HEADOFF_WHE = workplace_HEADOFF_WHE;
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


	public String getSal_INFO_TRANS_AMOUNT_O() {
		return sal_INFO_TRANS_AMOUNT_O;
	}


	public void setSal_INFO_TRANS_AMOUNT_O(String sal_INFO_TRANS_AMOUNT_O) {
		this.sal_INFO_TRANS_AMOUNT_O = sal_INFO_TRANS_AMOUNT_O;
	}


	public String getFk_SALARY_CAL_SAWON_CODE() {
		return fk_SALARY_CAL_SAWON_CODE;
	}


	public void setFk_SALARY_CAL_SAWON_CODE(String fk_SALARY_CAL_SAWON_CODE) {
		this.fk_SALARY_CAL_SAWON_CODE = fk_SALARY_CAL_SAWON_CODE;
	}


	public String getSalary_CAL_MONEY() {
		return salary_CAL_MONEY;
	}


	public void setSalary_CAL_MONEY(String salary_CAL_MONEY) {
		this.salary_CAL_MONEY = salary_CAL_MONEY;
	}


	public String getSal_INFO_ACC_HOLD_ONE() {
		return sal_INFO_ACC_HOLD_ONE;
	}


	public void setSal_INFO_ACC_HOLD_ONE(String sal_INFO_ACC_HOLD_ONE) {
		this.sal_INFO_ACC_HOLD_ONE = sal_INFO_ACC_HOLD_ONE;
	}



	public String getSal_INFO_ACC_NUM_ONE() {
		return sal_INFO_ACC_NUM_ONE;
	}


	public void setSal_INFO_ACC_NUM_ONE(String sal_INFO_ACC_NUM_ONE) {
		this.sal_INFO_ACC_NUM_ONE = sal_INFO_ACC_NUM_ONE;
	}


	public String getSalary_CAL_PAYMENTDAY() {
		return salary_CAL_PAYMENTDAY;
	}


	public void setSalary_CAL_PAYMENTDAY(String salary_CAL_PAYMENTDAY) {
		this.salary_CAL_PAYMENTDAY = salary_CAL_PAYMENTDAY;
	}


	public String getFk_WORKPLACE_CODE() {
		return fk_WORKPLACE_CODE;
	}


	public void setFk_WORKPLACE_CODE(String fk_WORKPLACE_CODE) {
		this.fk_WORKPLACE_CODE = fk_WORKPLACE_CODE;
	}


	public String getFk_SAWON_WORKPLACE_CODE() {
		return fk_SAWON_WORKPLACE_CODE;
	}


	public void setFk_SAWON_WORKPLACE_CODE(String fk_SAWON_WORKPLACE_CODE) {
		this.fk_SAWON_WORKPLACE_CODE = fk_SAWON_WORKPLACE_CODE;
	}


	public String getFk_DEPT_CODE() {
		return fk_DEPT_CODE;
	}


	public void setFk_DEPT_CODE(String fk_DEPT_CODE) {
		this.fk_DEPT_CODE = fk_DEPT_CODE;
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


	public String getFk_SAWON_CODE() {
		return fk_SAWON_CODE;
	}


	public void setFk_SAWON_CODE(String fk_SAWON_CODE) {
		this.fk_SAWON_CODE = fk_SAWON_CODE;
	}


	public String getSalary_CAL_SALARY_ITEM() {
		return salary_CAL_SALARY_ITEM;
	}


	public void setSalary_CAL_SALARY_ITEM(String salary_CAL_SALARY_ITEM) {
		this.salary_CAL_SALARY_ITEM = salary_CAL_SALARY_ITEM;
	}


	public String getFk_DEPT_NAME() {
		return fk_DEPT_NAME;
	}


	public void setFk_DEPT_NAME(String fk_DEPT_NAME) {
		this.fk_DEPT_NAME = fk_DEPT_NAME;
	}


	public String getRank_NAME() {
		return rank_NAME;
	}


	public void setRank_NAME(String rank_NAME) {
		this.rank_NAME = rank_NAME;
	}


	


	
	

	
}
