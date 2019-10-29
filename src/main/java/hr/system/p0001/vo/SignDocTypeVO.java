package hr.system.p0001.vo;

public class SignDocTypeVO {

    private String  PK_DOCTYPE_NUM,    	// 번호
    				DOCTYPE_DTTITLE,    // 제목
    				DOCTYPE_DTCONTENTS,	// 양식 내용
    				DOCTYPE_DELETEFLAG, // 삭제여부
    				DOCTYPE_INT_USER_ID, // 입력자
    				DOCTYPE_INT_DATE, // 입력일시
    				DOCTYPE_MOD_USER_ID, // 수정자
    				DOCTYPE_MOD_DATE // 수정일시
    ;

	public String getPK_DOCTYPE_NUM() {
		return PK_DOCTYPE_NUM;
	}

	public void setPK_DOCTYPE_NUM(String pK_DOCTYPE_NUM) {
		PK_DOCTYPE_NUM = pK_DOCTYPE_NUM;
	}

	public String getDOCTYPE_DTTITLE() {
		return DOCTYPE_DTTITLE;
	}

	public void setDOCTYPE_DTTITLE(String dOCTYPE_DTTITLE) {
		DOCTYPE_DTTITLE = dOCTYPE_DTTITLE;
	}

	public String getDOCTYPE_DTCONTENTS() {
		return DOCTYPE_DTCONTENTS;
	}

	public void setDOCTYPE_DTCONTENTS(String dOCTYPE_DTCONTENTS) {
		DOCTYPE_DTCONTENTS = dOCTYPE_DTCONTENTS;
	}

	public String getDOCTYPE_DELETEFLAG() {
		return DOCTYPE_DELETEFLAG;
	}

	public void setDOCTYPE_DELETEFLAG(String dOCTYPE_DELETEFLAG) {
		DOCTYPE_DELETEFLAG = dOCTYPE_DELETEFLAG;
	}

	public String getDOCTYPE_INT_USER_ID() {
		return DOCTYPE_INT_USER_ID;
	}

	public void setDOCTYPE_INT_USER_ID(String dOCTYPE_INT_USER_ID) {
		DOCTYPE_INT_USER_ID = dOCTYPE_INT_USER_ID;
	}

	public String getDOCTYPE_INT_DATE() {
		return DOCTYPE_INT_DATE;
	}

	public void setDOCTYPE_INT_DATE(String dOCTYPE_INT_DATE) {
		DOCTYPE_INT_DATE = dOCTYPE_INT_DATE;
	}

	public String getDOCTYPE_MOD_USER_ID() {
		return DOCTYPE_MOD_USER_ID;
	}

	public void setDOCTYPE_MOD_USER_ID(String dOCTYPE_MOD_USER_ID) {
		DOCTYPE_MOD_USER_ID = dOCTYPE_MOD_USER_ID;
	}

	public String getDOCTYPE_MOD_DATE() {
		return DOCTYPE_MOD_DATE;
	}

	public void setDOCTYPE_MOD_DATE(String dOCTYPE_MOD_DATE) {
		DOCTYPE_MOD_DATE = dOCTYPE_MOD_DATE;
	}

}
