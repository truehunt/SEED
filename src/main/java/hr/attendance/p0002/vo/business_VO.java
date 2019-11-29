package hr.attendance.p0002.vo;

import java.sql.Date;
import java.sql.Time;

import org.springframework.stereotype.Component;

import com.ibleaders.utility.ib_jxl.write.DateTime;

@Component("business_VO")
public class business_VO {
	private String business_TRIP_DATE;
	private String sawon_NAME;
	private String fk_DEPT_NAME;
	private String rank_NAME;
	private String business_TRIP_STR;
	private String business_TRIP_END;
	private String business_TRIP_PAY;
	private String business_TRIP_PURPOSE;
	private String business_TRIP_PAYREGIST;
	private String business_TRIP_APP_DATE;
	private String fk_BUSINESS_TRIP_SAWON_CODE;
	public String getBusiness_TRIP_DATE() {
		return business_TRIP_DATE;
	}
	public void setBusiness_TRIP_DATE(String business_TRIP_DATE) {
		this.business_TRIP_DATE = business_TRIP_DATE;
	}
	public String getSawon_NAME() {
		return sawon_NAME;
	}
	public void setSawon_NAME(String sawon_NAME) {
		this.sawon_NAME = sawon_NAME;
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
	public String getBusiness_TRIP_STR() {
		return business_TRIP_STR;
	}
	public void setBusiness_TRIP_STR(String business_TRIP_STR) {
		this.business_TRIP_STR = business_TRIP_STR;
	}
	public String getBusiness_TRIP_END() {
		return business_TRIP_END;
	}
	public void setBusiness_TRIP_END(String business_TRIP_END) {
		this.business_TRIP_END = business_TRIP_END;
	}
	public String getBusiness_TRIP_PAY() {
		return business_TRIP_PAY;
	}
	public void setBusiness_TRIP_PAY(String business_TRIP_PAY) {
		this.business_TRIP_PAY = business_TRIP_PAY;
	}
	public String getBusiness_TRIP_PURPOSE() {
		return business_TRIP_PURPOSE;
	}
	public void setBusiness_TRIP_PURPOSE(String business_TRIP_PURPOSE) {
		this.business_TRIP_PURPOSE = business_TRIP_PURPOSE;
	}
	public String getBusiness_TRIP_PAYREGIST() {
		return business_TRIP_PAYREGIST;
	}
	public void setBusiness_TRIP_PAYREGIST(String business_TRIP_PAYREGIST) {
		this.business_TRIP_PAYREGIST = business_TRIP_PAYREGIST;
	}
	public String getBusiness_TRIP_APP_DATE() {
		return business_TRIP_APP_DATE;
	}
	public void setBusiness_TRIP_APP_DATE(String business_TRIP_APP_DATE) {
		this.business_TRIP_APP_DATE = business_TRIP_APP_DATE;
	}
	public String getFk_BUSINESS_TRIP_SAWON_CODE() {
		return fk_BUSINESS_TRIP_SAWON_CODE;
	}
	public void setFk_BUSINESS_TRIP_SAWON_CODE(String fk_BUSINESS_TRIP_SAWON_CODE) {
		this.fk_BUSINESS_TRIP_SAWON_CODE = fk_BUSINESS_TRIP_SAWON_CODE;
	}
	
	


}