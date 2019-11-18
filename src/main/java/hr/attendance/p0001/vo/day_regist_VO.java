package hr.attendance.p0001.vo;

import java.sql.Date;
import java.sql.Time;

import org.springframework.stereotype.Component;

import com.ibleaders.utility.ib_jxl.write.DateTime;

@Component("Day_regist_VO")
public class day_regist_VO {
	private String fk_dept_NAME;
	private String rank_NAME;
	private String sawon_NAME;
	private String fk_DAILY_TA_SAWON_CODE;
	private String fk_DAILY_TA_DEPT_CODE;
	private String pk_DAILY_TA_WORKING_DATE;
	private String daily_TA_SAWON_NAME;
	private String daily_TA_RANK;
	private String daily_TA_DEPT_NAME;
	private String daily_TA_TA;
	private String daily_TA_GO_TIME;
	private String daily_TA_OFF_TIME;
	private String daily_TA_WORK_TIME;
	private String daily_TA_HOLI_WORK;
	private String daily_TA_EXTEN_WORK;
	private String daily_TA_NIGHT_WORK;
	private String daily_TA_LATE_TIME;
	private String daily_TA_LEAVE_TIME;
	private String daily_TA_INT_USER_ID;
	private DateTime daily_TA_INT_DATE;
	private String daily_TA_MOD_USER_ID;
	private DateTime daily_TA_MOD_DATE;
	public String getFk_RANK_NAME() {
		return fk_dept_NAME;
	}
	public void setFk_RANK_NAME(String fk_RANK_NAME) {
		this.fk_dept_NAME = fk_RANK_NAME;
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
	public String getFk_DAILY_TA_SAWON_CODE() {
		return fk_DAILY_TA_SAWON_CODE;
	}
	public void setFk_DAILY_TA_SAWON_CODE(String fk_DAILY_TA_SAWON_CODE) {
		this.fk_DAILY_TA_SAWON_CODE = fk_DAILY_TA_SAWON_CODE;
	}
	public String getFk_DAILY_TA_DEPT_CODE() {
		return fk_DAILY_TA_DEPT_CODE;
	}
	public void setFk_DAILY_TA_DEPT_CODE(String fk_DAILY_TA_DEPT_CODE) {
		this.fk_DAILY_TA_DEPT_CODE = fk_DAILY_TA_DEPT_CODE;
	}
	public String getPk_DAILY_TA_WORKING_DATE() {
		return pk_DAILY_TA_WORKING_DATE;
	}
	public void setPk_DAILY_TA_WORKING_DATE(String pk_DAILY_TA_WORKING_DATE) {
		this.pk_DAILY_TA_WORKING_DATE = pk_DAILY_TA_WORKING_DATE;
	}
	public String getDaily_TA_SAWON_NAME() {
		return daily_TA_SAWON_NAME;
	}
	public void setDaily_TA_SAWON_NAME(String daily_TA_SAWON_NAME) {
		this.daily_TA_SAWON_NAME = daily_TA_SAWON_NAME;
	}
	public String getDaily_TA_RANK() {
		return daily_TA_RANK;
	}
	public void setDaily_TA_RANK(String daily_TA_RANK) {
		this.daily_TA_RANK = daily_TA_RANK;
	}
	public String getDaily_TA_DEPT_NAME() {
		return daily_TA_DEPT_NAME;
	}
	public void setDaily_TA_DEPT_NAME(String daily_TA_DEPT_NAME) {
		this.daily_TA_DEPT_NAME = daily_TA_DEPT_NAME;
	}
	public String getDaily_TA_TA() {
		return daily_TA_TA;
	}
	public void setDaily_TA_TA(String daily_TA_TA) {
		this.daily_TA_TA = daily_TA_TA;
	}
	public String getDaily_TA_GO_TIME() {
		return daily_TA_GO_TIME;
	}
	public void setDaily_TA_GO_TIME(String daily_TA_GO_TIME) {
		this.daily_TA_GO_TIME = daily_TA_GO_TIME;
	}
	public String getDaily_TA_OFF_TIME() {
		return daily_TA_OFF_TIME;
	}
	public void setDaily_TA_OFF_TIME(String daily_TA_OFF_TIME) {
		this.daily_TA_OFF_TIME = daily_TA_OFF_TIME;
	}
	public String getDaily_TA_WORK_TIME() {
		return daily_TA_WORK_TIME;
	}
	public void setDaily_TA_WORK_TIME(String daily_TA_WORK_TIME) {
		this.daily_TA_WORK_TIME = daily_TA_WORK_TIME;
	}
	public String getDaily_TA_HOLI_WORK() {
		return daily_TA_HOLI_WORK;
	}
	public void setDaily_TA_HOLI_WORK(String daily_TA_HOLI_WORK) {
		this.daily_TA_HOLI_WORK = daily_TA_HOLI_WORK;
	}
	public String getDaily_TA_EXTEN_WORK() {
		return daily_TA_EXTEN_WORK;
	}
	public void setDaily_TA_EXTEN_WORK(String daily_TA_EXTEN_WORK) {
		this.daily_TA_EXTEN_WORK = daily_TA_EXTEN_WORK;
	}
	public String getDaily_TA_NIGHT_WORK() {
		return daily_TA_NIGHT_WORK;
	}
	public void setDaily_TA_NIGHT_WORK(String daily_TA_NIGHT_WORK) {
		this.daily_TA_NIGHT_WORK = daily_TA_NIGHT_WORK;
	}
	public String getDaily_TA_LATE_TIME() {
		return daily_TA_LATE_TIME;
	}
	public void setDaily_TA_LATE_TIME(String daily_TA_LATE_TIME) {
		this.daily_TA_LATE_TIME = daily_TA_LATE_TIME;
	}
	public String getDaily_TA_LEAVE_TIME() {
		return daily_TA_LEAVE_TIME;
	}
	public void setDaily_TA_LEAVE_TIME(String daily_TA_LEAVE_TIME) {
		this.daily_TA_LEAVE_TIME = daily_TA_LEAVE_TIME;
	}
	public String getDaily_TA_INT_USER_ID() {
		return daily_TA_INT_USER_ID;
	}
	public void setDaily_TA_INT_USER_ID(String daily_TA_INT_USER_ID) {
		this.daily_TA_INT_USER_ID = daily_TA_INT_USER_ID;
	}
	public DateTime getDaily_TA_INT_DATE() {
		return daily_TA_INT_DATE;
	}
	public void setDaily_TA_INT_DATE(DateTime daily_TA_INT_DATE) {
		this.daily_TA_INT_DATE = daily_TA_INT_DATE;
	}
	public String getDaily_TA_MOD_USER_ID() {
		return daily_TA_MOD_USER_ID;
	}
	public void setDaily_TA_MOD_USER_ID(String daily_TA_MOD_USER_ID) {
		this.daily_TA_MOD_USER_ID = daily_TA_MOD_USER_ID;
	}
	public DateTime getDaily_TA_MOD_DATE() {
		return daily_TA_MOD_DATE;
	}
	public void setDaily_TA_MOD_DATE(DateTime daily_TA_MOD_DATE) {
		this.daily_TA_MOD_DATE = daily_TA_MOD_DATE;
	}
}
