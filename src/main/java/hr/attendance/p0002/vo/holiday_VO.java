package hr.attendance.p0002.vo;

import java.sql.Date;
import java.sql.Time;

import org.springframework.stereotype.Component;

import com.ibleaders.utility.ib_jxl.write.DateTime;

@Component("holiday_VO")
public class holiday_VO {
	private String holiday_DIVISION;
	private String holiday_PAY;
	private String holiday_REASON;
	private String holiday_TERM;
	private String holiday_INT_USER_ID;
	private String holiday_INT_DATE;
	private String holiday_MOD_USER_ID;
	private String holiday_MOD_DATE;
	private String holiday_SAWON_NM;
	private String holiday_ANNUAL_STR;
	private String holiday_ANNUAL_END;
	private String holiday_DAYS;
	private String fk_HOLIDAY_SAWON_CODE;
	private String holiday_REGIST;
	private String rank_NAME;
	private String sawon_NAME;
	private String fk_DEPT_NAME;
	
	public String getHoliday_DIVISION() {
		return holiday_DIVISION;
	}
	public void setHoliday_DIVISION(String holiday_DIVISION) {
		this.holiday_DIVISION = holiday_DIVISION;
	}
	public String getHoliday_PAY() {
		return holiday_PAY;
	}
	public void setHoliday_PAY(String holiday_PAY) {
		this.holiday_PAY = holiday_PAY;
	}
	public String getHoliday_REASON() {
		return holiday_REASON;
	}
	public void setHoliday_REASON(String holiday_REASON) {
		this.holiday_REASON = holiday_REASON;
	}
	public String getHoliday_TERM() {
		return holiday_TERM;
	}
	public void setHoliday_TERM(String holiday_TERM) {
		this.holiday_TERM = holiday_TERM;
	}
	public String getHoliday_INT_USER_ID() {
		return holiday_INT_USER_ID;
	}
	public void setHoliday_INT_USER_ID(String holiday_INT_USER_ID) {
		this.holiday_INT_USER_ID = holiday_INT_USER_ID;
	}
	public String getHoliday_INT_DATE() {
		return holiday_INT_DATE;
	}
	public void setHoliday_INT_DATE(String holiday_INT_DATE) {
		this.holiday_INT_DATE = holiday_INT_DATE;
	}
	public String getHoliday_MOD_USER_ID() {
		return holiday_MOD_USER_ID;
	}
	public void setHoliday_MOD_USER_ID(String holiday_MOD_USER_ID) {
		this.holiday_MOD_USER_ID = holiday_MOD_USER_ID;
	}
	public String getHoliday_MOD_DATE() {
		return holiday_MOD_DATE;
	}
	public void setHoliday_MOD_DATE(String holiday_MOD_DATE) {
		this.holiday_MOD_DATE = holiday_MOD_DATE;
	}
	public String getHoliday_SAWON_NM() {
		return holiday_SAWON_NM;
	}
	public void setHoliday_SAWON_NM(String holiday_SAWON_NM) {
		this.holiday_SAWON_NM = holiday_SAWON_NM;
	}
	public String getHoliday_ANNUAL_STR() {
		return holiday_ANNUAL_STR;
	}
	public void setHoliday_ANNUAL_STR(String holiday_ANNUAL_STR) {
		this.holiday_ANNUAL_STR = holiday_ANNUAL_STR;
	}
	public String getHoliday_ANNUAL_END() {
		return holiday_ANNUAL_END;
	}
	public void setHoliday_ANNUAL_END(String holiday_ANNUAL_END) {
		this.holiday_ANNUAL_END = holiday_ANNUAL_END;
	}
	public String getHoliday_DAYS() {
		return holiday_DAYS;
	}
	public void setHoliday_DAYS(String holiday_DAYS) {
		this.holiday_DAYS = holiday_DAYS;
	}
	public String getFk_HOLIDAY_SAWON_CODE() {
		return fk_HOLIDAY_SAWON_CODE;
	}
	public void setFk_HOLIDAY_SAWON_CODE(String fk_HOLIDAY_SAWON_CODE) {
		this.fk_HOLIDAY_SAWON_CODE = fk_HOLIDAY_SAWON_CODE;
	}
	public String getHoliday_REGIST() {
		return holiday_REGIST;
	}
	public void setHoliday_REGIST(String holiday_REGIST) {
		this.holiday_REGIST = holiday_REGIST;
	}
	public String getRank_NAME() {
		return rank_NAME;
	}
	public void setRank_NAME(String rank_NAME) {
		this.rank_NAME = rank_NAME;
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

}