package hr.system.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("sawonVO")
public class SawonVO {
	private String PK_SAWON_CODE;
	private String SAWON_NAME;
	private String SAWON_ENG_NAME;
	private String SAWON_JOIN_DATE;
	private String SAWON_RESIGNATION_DATE;
	private String SAWON_USER_STATUS;
	private String SAWON_PASSWORD;
	private String SAWON_VIEW_PERMISSION;
	private String SAWON_EMERGENCY_CON_NET;
	private String FK_DEPT_CODE;
	private String SAWON_INT_USER_ID;
	private String SAWON_INT_DATE;
	private String SAWON_MOD_USER_ID;
	private String SAWON_MOD_DATE;
	
	public SawonVO() {
		System.out.println("SAWON VO 생성");
	}

	public String getPK_SAWON_CODE() {
		return PK_SAWON_CODE;
	}

	public void setPK_SAWON_CODE(String pK_SAWON_CODE) {
		PK_SAWON_CODE = pK_SAWON_CODE;
	}

	public String getSAWON_NAME() {
		return SAWON_NAME;
	}

	public void setSAWON_NAME(String sAWON_NAME) {
		SAWON_NAME = sAWON_NAME;
	}

	public String getSAWON_ENG_NAME() {
		return SAWON_ENG_NAME;
	}

	public void setSAWON_ENG_NAME(String sAWON_ENG_NAME) {
		SAWON_ENG_NAME = sAWON_ENG_NAME;
	}

	public String getSAWON_JOIN_DATE() {
		return SAWON_JOIN_DATE;
	}

	public void setSAWON_JOIN_DATE(String sAWON_JOIN_DATE) {
		SAWON_JOIN_DATE = sAWON_JOIN_DATE;
	}

	public String getSAWON_RESIGNATION_DATE() {
		return SAWON_RESIGNATION_DATE;
	}

	public void setSAWON_RESIGNATION_DATE(String sAWON_RESIGNATION_DATE) {
		SAWON_RESIGNATION_DATE = sAWON_RESIGNATION_DATE;
	}

	public String getSAWON_USER_STATUS() {
		return SAWON_USER_STATUS;
	}

	public void setSAWON_USER_STATUS(String sAWON_USER_STATUS) {
		SAWON_USER_STATUS = sAWON_USER_STATUS;
	}

	public String getSAWON_PASSWORD() {
		return SAWON_PASSWORD;
	}

	public void setSAWON_PASSWORD(String sAWON_PASSWORD) {
		SAWON_PASSWORD = sAWON_PASSWORD;
	}

	public String getSAWON_VIEW_PERMISSION() {
		return SAWON_VIEW_PERMISSION;
	}

	public void setSAWON_VIEW_PERMISSION(String sAWON_VIEW_PERMISSION) {
		SAWON_VIEW_PERMISSION = sAWON_VIEW_PERMISSION;
	}

	public String getSAWON_EMERGENCY_CON_NET() {
		return SAWON_EMERGENCY_CON_NET;
	}

	public void setSAWON_EMERGENCY_CON_NET(String sAWON_EMERGENCY_CON_NET) {
		SAWON_EMERGENCY_CON_NET = sAWON_EMERGENCY_CON_NET;
	}

	public String getFK_DEPT_CODE() {
		return FK_DEPT_CODE;
	}

	public void setFK_DEPT_CODE(String fK_DEPT_CODE) {
		FK_DEPT_CODE = fK_DEPT_CODE;
	}

	public String getSAWON_INT_USER_ID() {
		return SAWON_INT_USER_ID;
	}

	public void setSAWON_INT_USER_ID(String sAWON_INT_USER_ID) {
		SAWON_INT_USER_ID = sAWON_INT_USER_ID;
	}

	public String getSAWON_INT_DATE() {
		return SAWON_INT_DATE;
	}

	public void setSAWON_INT_DATE(String sAWON_INT_DATE) {
		SAWON_INT_DATE = sAWON_INT_DATE;
	}

	public String getSAWON_MOD_USER_ID() {
		return SAWON_MOD_USER_ID;
	}

	public void setSAWON_MOD_USER_ID(String sAWON_MOD_USER_ID) {
		SAWON_MOD_USER_ID = sAWON_MOD_USER_ID;
	}

	public String getSAWON_MOD_DATE() {
		return SAWON_MOD_DATE;
	}

	public void setSAWON_MOD_DATE(String sAWON_MOD_DATE) {
		SAWON_MOD_DATE = sAWON_MOD_DATE;
	}

	
	
}
