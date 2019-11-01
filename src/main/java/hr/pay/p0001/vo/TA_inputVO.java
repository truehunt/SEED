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

	

	public TA_inputVO() {
		System.out.println("MemberVO 占쎄문占쎄쉐占쎌쁽 占쎌깈�빊占�");
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



	
	



	

	
}
