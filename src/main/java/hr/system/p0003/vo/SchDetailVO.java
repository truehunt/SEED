package hr.system.p0003.vo;

public class SchDetailVO {

    private String  FK_SSNO,	 	//일정번호
				    SDDATE,		 //날짜
				    SDHOUR,		 //시간
				    SDMINUTE,	 //분
				    PK_SAWON_CODE,
				    SSTITLE,				// 일정명
				    FONTCOLOR
    ;
    private Integer SDSEQ;		 //순번
	public String getFK_SSNO() {
		return FK_SSNO;
	}
	public void setFK_SSNO(String fK_SSNO) {
		FK_SSNO = fK_SSNO;
	}
	public String getSDDATE() {
		return SDDATE;
	}
	public void setSDDATE(String sDDATE) {
		SDDATE = sDDATE;
	}
	public String getSDHOUR() {
		return SDHOUR;
	}
	public void setSDHOUR(String sDHOUR) {
		SDHOUR = sDHOUR;
	}
	public String getSDMINUTE() {
		return SDMINUTE;
	}
	public void setSDMINUTE(String sDMINUTE) {
		SDMINUTE = sDMINUTE;
	}
	public String getPK_SAWON_CODE() {
		return PK_SAWON_CODE;
	}
	public void setPK_SAWON_CODE(String pK_SAWON_CODE) {
		PK_SAWON_CODE = pK_SAWON_CODE;
	}
	public String getSSTITLE() {
		return SSTITLE;
	}
	public void setSSTITLE(String sSTITLE) {
		SSTITLE = sSTITLE;
	}
	public String getFONTCOLOR() {
		return FONTCOLOR;
	}
	public void setFONTCOLOR(String fONTCOLOR) {
		FONTCOLOR = fONTCOLOR;
	}
	public Integer getSDSEQ() {
		return SDSEQ;
	}
	public void setSDSEQ(Integer sDSEQ) {
		SDSEQ = sDSEQ;
	}
    
    


}
