package hr.attendance.p0001.vo;

import java.sql.Date;
import java.sql.Time;

import org.springframework.stereotype.Component;

import com.ibleaders.utility.ib_jxl.write.DateTime;

@Component("Day_regist_VO")
public class day_regist_VO {
	private String FK_DAILY_TA_SAWON_CODE;
	private String FK_DAILY_TA_DEPT_CODE;
	private String PK_DAILY_TA_WORKING_DATE;
	private String DAILY_TA_SAWON_NAME;
	private String DAILY_TA_RANK;
	private String DAILY_TA_DEPT_NAME;
	private String DAILY_TA_TA;
	private String DAILY_TA_GO_TIME;
	private String DAILY_TA_OFF_TIME;
	private String DAILY_TA_WORK_TIME;
	private String DAILY_TA_HOLI_WORK;
	private String DAILY_TA_EXTEN_WORK;
	private String DAILY_TA_NIGHT_WORK;
	private String DAILY_TA_LATE_TIME;
	private String DAILY_TA_LEAVE_TIME;
	private String DAILY_TA_INT_USER_ID;
	private DateTime DAILY_TA_INT_DATE;
	private String DAILY_TA_MOD_USER_ID;
	private DateTime DAILY_TA_MOD_DATE;
	public String getFK_DAILY_TA_SAWON_CODE() {
		return FK_DAILY_TA_SAWON_CODE;
	}
	public void setFK_DAILY_TA_SAWON_CODE(String fK_DAILY_TA_SAWON_CODE) {
		FK_DAILY_TA_SAWON_CODE = fK_DAILY_TA_SAWON_CODE;
	}
	public String getFK_DAILY_TA_DEPT_CODE() {
		return FK_DAILY_TA_DEPT_CODE;
	}
	public void setFK_DAILY_TA_DEPT_CODE(String fK_DAILY_TA_DEPT_CODE) {
		FK_DAILY_TA_DEPT_CODE = fK_DAILY_TA_DEPT_CODE;
	}
	public String getPK_DAILY_TA_WORKING_DATE() {
		return PK_DAILY_TA_WORKING_DATE;
	}
	public void setPK_DAILY_TA_WORKING_DATE(String pK_DAILY_TA_WORKING_DATE) {
		PK_DAILY_TA_WORKING_DATE = pK_DAILY_TA_WORKING_DATE;
	}
	public String getDAILY_TA_SAWON_NAME() {
		return DAILY_TA_SAWON_NAME;
	}
	public void setDAILY_TA_SAWON_NAME(String dAILY_TA_SAWON_NAME) {
		DAILY_TA_SAWON_NAME = dAILY_TA_SAWON_NAME;
	}
	public String getDAILY_TA_RANK() {
		return DAILY_TA_RANK;
	}
	public void setDAILY_TA_RANK(String dAILY_TA_RANK) {
		DAILY_TA_RANK = dAILY_TA_RANK;
	}
	public String getDAILY_TA_DEPT_NAME() {
		return DAILY_TA_DEPT_NAME;
	}
	public void setDAILY_TA_DEPT_NAME(String dAILY_TA_DEPT_NAME) {
		DAILY_TA_DEPT_NAME = dAILY_TA_DEPT_NAME;
	}
	public String getDAILY_TA_TA() {
		return DAILY_TA_TA;
	}
	public void setDAILY_TA_TA(String dAILY_TA_TA) {
		DAILY_TA_TA = dAILY_TA_TA;
	}
	public String getDAILY_TA_GO_TIME() {
		return DAILY_TA_GO_TIME;
	}
	public void setDAILY_TA_GO_TIME(String dAILY_TA_GO_TIME) {
		DAILY_TA_GO_TIME = dAILY_TA_GO_TIME;
	}
	public String getDAILY_TA_OFF_TIME() {
		return DAILY_TA_OFF_TIME;
	}
	public void setDAILY_TA_OFF_TIME(String dAILY_TA_OFF_TIME) {
		DAILY_TA_OFF_TIME = dAILY_TA_OFF_TIME;
	}
	public String getDAILY_TA_WORK_TIME() {
		return DAILY_TA_WORK_TIME;
	}
	public void setDAILY_TA_WORK_TIME(String dAILY_TA_WORK_TIME) {
		DAILY_TA_WORK_TIME = dAILY_TA_WORK_TIME;
	}
	public String getDAILY_TA_HOLI_WORK() {
		return DAILY_TA_HOLI_WORK;
	}
	public void setDAILY_TA_HOLI_WORK(String dAILY_TA_HOLI_WORK) {
		DAILY_TA_HOLI_WORK = dAILY_TA_HOLI_WORK;
	}
	public String getDAILY_TA_EXTEN_WORK() {
		return DAILY_TA_EXTEN_WORK;
	}
	public void setDAILY_TA_EXTEN_WORK(String dAILY_TA_EXTEN_WORK) {
		DAILY_TA_EXTEN_WORK = dAILY_TA_EXTEN_WORK;
	}
	public String getDAILY_TA_NIGHT_WORK() {
		return DAILY_TA_NIGHT_WORK;
	}
	public void setDAILY_TA_NIGHT_WORK(String dAILY_TA_NIGHT_WORK) {
		DAILY_TA_NIGHT_WORK = dAILY_TA_NIGHT_WORK;
	}
	public String getDAILY_TA_LATE_TIME() {
		return DAILY_TA_LATE_TIME;
	}
	public void setDAILY_TA_LATE_TIME(String dAILY_TA_LATE_TIME) {
		DAILY_TA_LATE_TIME = dAILY_TA_LATE_TIME;
	}
	public String getDAILY_TA_LEAVE_TIME() {
		return DAILY_TA_LEAVE_TIME;
	}
	public void setDAILY_TA_LEAVE_TIME(String dAILY_TA_LEAVE_TIME) {
		DAILY_TA_LEAVE_TIME = dAILY_TA_LEAVE_TIME;
	}
	public String getDAILY_TA_INT_USER_ID() {
		return DAILY_TA_INT_USER_ID;
	}
	public void setDAILY_TA_INT_USER_ID(String dAILY_TA_INT_USER_ID) {
		DAILY_TA_INT_USER_ID = dAILY_TA_INT_USER_ID;
	}
	public DateTime getDAILY_TA_INT_DATE() {
		return DAILY_TA_INT_DATE;
	}
	public void setDAILY_TA_INT_DATE(DateTime dAILY_TA_INT_DATE) {
		DAILY_TA_INT_DATE = dAILY_TA_INT_DATE;
	}
	public String getDAILY_TA_MOD_USER_ID() {
		return DAILY_TA_MOD_USER_ID;
	}
	public void setDAILY_TA_MOD_USER_ID(String dAILY_TA_MOD_USER_ID) {
		DAILY_TA_MOD_USER_ID = dAILY_TA_MOD_USER_ID;
	}
	public DateTime getDAILY_TA_MOD_DATE() {
		return DAILY_TA_MOD_DATE;
	}
	public void setDAILY_TA_MOD_DATE(DateTime dAILY_TA_MOD_DATE) {
		DAILY_TA_MOD_DATE = dAILY_TA_MOD_DATE;
	}
}