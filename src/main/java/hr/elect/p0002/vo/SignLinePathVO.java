package hr.elect.p0002.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("signLinePathVO")
public class SignLinePathVO {
	
	private String PK_LINEPATH_NUM, // 결재선번호
				   LINEPATH_NAME, // 결재선명
				   LINEPATH_SIGNPATH, // 결재경로문자열
				   LINEPATH_SIGNPATH_View, // 결재경로 불러올때 보여주는 용도의 컬럼 -> DB에 없음
				   LINEPATH_INT_USER_ID, //
				   LINEPATH_INT_DATE, // 
				   LINEPATH_MOD_USER_ID, // 
				   LINEPATH_MOD_DATE, // 
				   PK_SAWON_CODE; // FK 사원코드
	
	public SignLinePathVO() {
		System.out.println("SignLinePathVO 생성");
	}

	public String getPK_LINEPATH_NUM() {
		return PK_LINEPATH_NUM;
	}

	public void setPK_LINEPATH_NUM(String pK_LINEPATH_NUM) {
		PK_LINEPATH_NUM = pK_LINEPATH_NUM;
	}

	public String getLINEPATH_NAME() {
		return LINEPATH_NAME;
	}

	public void setLINEPATH_NAME(String lINEPATH_NAME) {
		LINEPATH_NAME = lINEPATH_NAME;
	}

	public String getLINEPATH_SIGNPATH() {
		return LINEPATH_SIGNPATH;
	}

	public void setLINEPATH_SIGNPATH(String lINEPATH_SIGNPATH) {
		LINEPATH_SIGNPATH = lINEPATH_SIGNPATH;
	}

	public String getLINEPATH_INT_USER_ID() {
		return LINEPATH_INT_USER_ID;
	}

	public void setLINEPATH_INT_USER_ID(String lINEPATH_INT_USER_ID) {
		LINEPATH_INT_USER_ID = lINEPATH_INT_USER_ID;
	}

	public String getLINEPATH_INT_DATE() {
		return LINEPATH_INT_DATE;
	}

	public void setLINEPATH_INT_DATE(String lINEPATH_INT_DATE) {
		LINEPATH_INT_DATE = lINEPATH_INT_DATE;
	}

	public String getLINEPATH_MOD_USER_ID() {
		return LINEPATH_MOD_USER_ID;
	}

	public void setLINEPATH_MOD_USER_ID(String lINEPATH_MOD_USER_ID) {
		LINEPATH_MOD_USER_ID = lINEPATH_MOD_USER_ID;
	}

	public String getLINEPATH_MOD_DATE() {
		return LINEPATH_MOD_DATE;
	}

	public void setLINEPATH_MOD_DATE(String lINEPATH_MOD_DATE) {
		LINEPATH_MOD_DATE = lINEPATH_MOD_DATE;
	}

	public String getPK_SAWON_CODE() {
		return PK_SAWON_CODE;
	}

	public void setPK_SAWON_CODE(String pK_SAWON_CODE) {
		PK_SAWON_CODE = pK_SAWON_CODE;
	}

	public String getLINEPATH_SIGNPATH_View() {
		return LINEPATH_SIGNPATH_View;
	}

	public void setLINEPATH_SIGNPATH_View(String lINEPATH_SIGNPATH_View) {
		LINEPATH_SIGNPATH_View = lINEPATH_SIGNPATH_View;
	}
	
	
}
