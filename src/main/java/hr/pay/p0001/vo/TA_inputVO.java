package hr.pay.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("TA_inputVO")
public class TA_inputVO {

	private String ta_TOTAL_DIVI_CODE;             //구분코드
	private String ta_TOTAL_DAY;                   //일수
	private String ta_TOTAL_HOUR;                  //시간

	private String ta_INT_USER_ID;                 //입력자
	private String ta_INT_DATE;                    //입력일시
	
	private String pk_SAWON_CODE;                  //사원코드
	private String sawon_NAME;                     //사원이름
	private String pk_DEPT_CODE;                   //부서코드
	private String dept_NAME;                      //부서이름
	private String pk_WORKPLACE_CODE;              //사업장코드
	private String workplace_HEADOFF_WHE;          //사업장구분코드
	
	
	private String d_B_PAYMENT_DATE_ATTRIBUT;      //귀속연월일
	private String d_B_PAYMENT_DT;                 //지급일자
	

	private String pk_D_B_PAYMENT_SEQ_CODE;        //순번코드
	private String ta_TOTAL_PAYMENTDAY;            //지급일자
	private String workplace_NAME;                 //사업장이름
	private String pk_SAWON_WORKPLACE_CODE;        //사업장코드
	private String workplace_INQUIRY_CODE;         //사업장구분코드
	private String dept_INQUIRY_CODE;              //부서구분코드
	private String PK_TA_TOTAL_CODE;               //근태종합코드
	
	private String fk_HOBONG_CODE;                 //호봉코드
	private String fk_RANK_CODE;                   //직급코드
	private String hobong_TABLE_START_DATE_APPLI;  //호봉테이블 시작일

	public TA_inputVO() {
		System.out.println("TA_inputVO");
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



	public String getFk_HOBONG_CODE() {
		return fk_HOBONG_CODE;
	}



	public void setFk_HOBONG_CODE(String fk_HOBONG_CODE) {
		this.fk_HOBONG_CODE = fk_HOBONG_CODE;
	}



	public String getFk_RANK_CODE() {
		return fk_RANK_CODE;
	}



	public void setFk_RANK_CODE(String fk_RANK_CODE) {
		this.fk_RANK_CODE = fk_RANK_CODE;
	}



	public String getHobong_TABLE_START_DATE_APPLI() {
		return hobong_TABLE_START_DATE_APPLI;
	}



	public void setHobong_TABLE_START_DATE_APPLI(String hobong_TABLE_START_DATE_APPLI) {
		this.hobong_TABLE_START_DATE_APPLI = hobong_TABLE_START_DATE_APPLI;
	}







	

	
}
