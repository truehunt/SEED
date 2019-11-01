package hr.elect.p0001.vo;

import org.springframework.stereotype.Component;

@Component("signDocVO")
public class SignDocVO {
	
	private String AD_TITLE, // 제목
				   AD_CONTENT, // 내용
				   AD_CHAMJO, // 수신참조
				   AD_DEPT_NAME, // 부서명
				   PK_AD_NUM, // 전자결재문서번호
				   AD_DELETEFLAG, // 삭제여부
				   AD_DOCSTATUS, // 문서상태
				   AD_DOCSTEP, // 결재단계
				   AD_DOCSIGNPATH, // 결재경로문자열
				   AD_INT_DATE, // 입력일시
				   AD_MOD_DATE, // 수정일시
				   PK_DOCTYPE_NUM, // 양식번호
				   PK_SAWON_CODE, // 사원코드
				   SAWON_NAME; // 사원이름
	
	public SignDocVO() {
		System.out.println("SignDocVO 생성");
	}

	public String getAD_TITLE() {
		return AD_TITLE;
	}

	public void setAD_TITLE(String aD_TITLE) {
		AD_TITLE = aD_TITLE;
	}

	public String getAD_CONTENT() {
		return AD_CONTENT;
	}

	public void setAD_CONTENT(String aD_CONTENT) {
		AD_CONTENT = aD_CONTENT;
	}

	public String getAD_CHAMJO() {
		return AD_CHAMJO;
	}

	public void setAD_CHAMJO(String aD_CHAMJO) {
		AD_CHAMJO = aD_CHAMJO;
	}

	public String getAD_DEPT_NAME() {
		return AD_DEPT_NAME;
	}

	public void setAD_DEPT_NAME(String aD_DEPT_NAME) {
		AD_DEPT_NAME = aD_DEPT_NAME;
	}

	public String getPK_AD_NUM() {
		return PK_AD_NUM;
	}

	public void setPK_AD_NUM(String pK_AD_NUM) {
		PK_AD_NUM = pK_AD_NUM;
	}

	public String getAD_DELETEFLAG() {
		return AD_DELETEFLAG;
	}

	public void setAD_DELETEFLAG(String aD_DELETEFLAG) {
		AD_DELETEFLAG = aD_DELETEFLAG;
	}

	public String getAD_DOCSTATUS() {
		return AD_DOCSTATUS;
	}

	public void setAD_DOCSTATUS(String aD_DOCSTATUS) {
		AD_DOCSTATUS = aD_DOCSTATUS;
	}

	public String getAD_DOCSTEP() {
		return AD_DOCSTEP;
	}

	public void setAD_DOCSTEP(String aD_DOCSTEP) {
		AD_DOCSTEP = aD_DOCSTEP;
	}

	public String getAD_DOCSIGNPATH() {
		return AD_DOCSIGNPATH;
	}

	public void setAD_DOCSIGNPATH(String aD_DOCSIGNPATH) {
		AD_DOCSIGNPATH = aD_DOCSIGNPATH;
	}

	public String getAD_INT_DATE() {
		return AD_INT_DATE;
	}

	public void setAD_INT_DATE(String aD_INT_DATE) {
		AD_INT_DATE = aD_INT_DATE;
	}

	public String getAD_MOD_DATE() {
		return AD_MOD_DATE;
	}

	public void setAD_MOD_DATE(String aD_MOD_DATE) {
		AD_MOD_DATE = aD_MOD_DATE;
	}

	public String getPK_DOCTYPE_NUM() {
		return PK_DOCTYPE_NUM;
	}

	public void setPK_DOCTYPE_NUM(String pK_DOCTYPE_NUM) {
		PK_DOCTYPE_NUM = pK_DOCTYPE_NUM;
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

}
