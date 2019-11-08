package hr.pay.p0002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("SALARY_calculVO")
public class SALARY_calculVO {
	private String fk_TA_SAWON_CODE; 
	private String ta_SAWON_NAME;
	private String ta_ATTRIBUTION;
	private String ta_PAYMENTDAY;
	private String ta_INQUIRY_CONDITION;
	private String pk_TA_WORKPLACE_CODE;
	private String salary_CALCUL_ITEM;
	private String salary_CALCUL_MONEY;
	private String pk_SALARY_CALCUL_TOTAL_CODE;
	
	private String pk_WORKPLACE_CODE;
	private String workplace_NAME;
	private String workplace_HEADOFF_WHE;
	private String pk_SAWON_CODE;
	private String sawon_NAME;
	private String pk_DEPT_CODE;
	private String dept_NAME;


	

	public SALARY_calculVO() {
		System.out.println("MemberVO �뜝�럡臾멨뜝�럡�뎽�뜝�럩�겱 �뜝�럩源덌옙鍮듿뜝占�");
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




	public String getSalary_CALCUL_ITEM() {
		return salary_CALCUL_ITEM;
	}




	public void setSalary_CALCUL_ITEM(String salary_CALCUL_ITEM) {
		this.salary_CALCUL_ITEM = salary_CALCUL_ITEM;
	}




	public String getSalary_CALCUL_MONEY() {
		return salary_CALCUL_MONEY;
	}




	public void setSalary_CALCUL_MONEY(String salary_CALCUL_MONEY) {
		this.salary_CALCUL_MONEY = salary_CALCUL_MONEY;
	}




	public String getPk_SALARY_CALCUL_TOTAL_CODE() {
		return pk_SALARY_CALCUL_TOTAL_CODE;
	}




	public void setPk_SALARY_CALCUL_TOTAL_CODE(String pk_SALARY_CALCUL_TOTAL_CODE) {
		this.pk_SALARY_CALCUL_TOTAL_CODE = pk_SALARY_CALCUL_TOTAL_CODE;
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






	

	

	
}
