package hr.pay.p0004.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("SALARY_specVO")
public class SALARY_specVO {
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
	
	private String fk_SALARY_SPEC_SAWON_CODE;   //사원코드
	private String salary_SPEC_SAWON_NAME;   //사원명
	private String salary_SPEC_ATTRIBUTION;    //귀속연월
	private String salary_SPEC_PAYMENTDAY;   //지급일
	private String salary_SPEC_INQUIRY_CONDITION;   //조회조건
	private String salary_SPEC_NORMAL;   //기본급
	private String salary_SPEC_BONUS;   //상여금
	private String salary_SPEC_POSITION;   //직책수당
	private String salary_SPEC_INT_USER_ID; //입력자
	private String salary_SPEC_INT_DATE;   //입력일시
	private String salary_SPEC_USER_ID;   //수정자
	private String salary_SPEC_MOD_DATE;  //수정일시
	private String fk_DEPT_NAME;  //부서명
	private String salary_CAL_SALARY_ITEM; //지급항목
	private String salary_CAL_MONEY; //지급액
	private String salary_CAL_PAYMENTDAY;//지급일
	
	
	
	public SALARY_specVO() {
		System.out.println("SALARY_specVO");
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



	public String getFk_SALARY_SPEC_SAWON_CODE() {
		return fk_SALARY_SPEC_SAWON_CODE;
	}



	public void setFk_SALARY_SPEC_SAWON_CODE(String fk_SALARY_SPEC_SAWON_CODE) {
		this.fk_SALARY_SPEC_SAWON_CODE = fk_SALARY_SPEC_SAWON_CODE;
	}



	public String getSalary_SPEC_SAWON_NAME() {
		return salary_SPEC_SAWON_NAME;
	}



	public void setSalary_SPEC_SAWON_NAME(String salary_SPEC_SAWON_NAME) {
		this.salary_SPEC_SAWON_NAME = salary_SPEC_SAWON_NAME;
	}



	public String getSalary_SPEC_ATTRIBUTION() {
		return salary_SPEC_ATTRIBUTION;
	}



	public void setSalary_SPEC_ATTRIBUTION(String salary_SPEC_ATTRIBUTION) {
		this.salary_SPEC_ATTRIBUTION = salary_SPEC_ATTRIBUTION;
	}



	public String getSalary_SPEC_PAYMENTDAY() {
		return salary_SPEC_PAYMENTDAY;
	}



	public void setSalary_SPEC_PAYMENTDAY(String salary_SPEC_PAYMENTDAY) {
		this.salary_SPEC_PAYMENTDAY = salary_SPEC_PAYMENTDAY;
	}



	public String getSalary_SPEC_INQUIRY_CONDITION() {
		return salary_SPEC_INQUIRY_CONDITION;
	}



	public void setSalary_SPEC_INQUIRY_CONDITION(String salary_SPEC_INQUIRY_CONDITION) {
		this.salary_SPEC_INQUIRY_CONDITION = salary_SPEC_INQUIRY_CONDITION;
	}



	public String getSalary_SPEC_NORMAL() {
		return salary_SPEC_NORMAL;
	}



	public void setSalary_SPEC_NORMAL(String salary_SPEC_NORMAL) {
		this.salary_SPEC_NORMAL = salary_SPEC_NORMAL;
	}



	public String getSalary_SPEC_BONUS() {
		return salary_SPEC_BONUS;
	}



	public void setSalary_SPEC_BONUS(String salary_SPEC_BONUS) {
		this.salary_SPEC_BONUS = salary_SPEC_BONUS;
	}



	public String getSalary_SPEC_POSITION() {
		return salary_SPEC_POSITION;
	}



	public void setSalary_SPEC_POSITION(String salary_SPEC_POSITION) {
		this.salary_SPEC_POSITION = salary_SPEC_POSITION;
	}



	public String getSalary_SPEC_INT_USER_ID() {
		return salary_SPEC_INT_USER_ID;
	}



	public void setSalary_SPEC_INT_USER_ID(String salary_SPEC_INT_USER_ID) {
		this.salary_SPEC_INT_USER_ID = salary_SPEC_INT_USER_ID;
	}



	public String getSalary_SPEC_INT_DATE() {
		return salary_SPEC_INT_DATE;
	}



	public void setSalary_SPEC_INT_DATE(String salary_SPEC_INT_DATE) {
		this.salary_SPEC_INT_DATE = salary_SPEC_INT_DATE;
	}



	public String getSalary_SPEC_USER_ID() {
		return salary_SPEC_USER_ID;
	}



	public void setSalary_SPEC_USER_ID(String salary_SPEC_USER_ID) {
		this.salary_SPEC_USER_ID = salary_SPEC_USER_ID;
	}



	public String getSalary_SPEC_MOD_DATE() {
		return salary_SPEC_MOD_DATE;
	}



	public void setSalary_SPEC_MOD_DATE(String salary_SPEC_MOD_DATE) {
		this.salary_SPEC_MOD_DATE = salary_SPEC_MOD_DATE;
	}



	public String getFk_DEPT_NAME() {
		return fk_DEPT_NAME;
	}



	public void setFk_DEPT_NAME(String fk_DEPT_NAME) {
		this.fk_DEPT_NAME = fk_DEPT_NAME;
	}



	public String getSalary_CAL_SALARY_ITEM() {
		return salary_CAL_SALARY_ITEM;
	}



	public void setSalary_CAL_SALARY_ITEM(String salary_CAL_SALARY_ITEM) {
		this.salary_CAL_SALARY_ITEM = salary_CAL_SALARY_ITEM;
	}



	public String getSalary_CAL_MONEY() {
		return salary_CAL_MONEY;
	}



	public void setSalary_CAL_MONEY(String salary_CAL_MONEY) {
		this.salary_CAL_MONEY = salary_CAL_MONEY;
	}



	public String getSalary_CAL_PAYMENTDAY() {
		return salary_CAL_PAYMENTDAY;
	}



	public void setSalary_CAL_PAYMENTDAY(String salary_CAL_PAYMENTDAY) {
		this.salary_CAL_PAYMENTDAY = salary_CAL_PAYMENTDAY;
	}







	

	
}
