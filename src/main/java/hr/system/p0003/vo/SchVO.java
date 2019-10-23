package hr.system.p0003.vo;

public class SchVO {

    private String  SSNO,				//일정번호
				    SSTITLE,			//일정명
				    SSTYPE,				//구분
				    SSSTARTDATE, 	//시작일
				    SSSTARTHOUR,		//시작일-시간
				    SSSTARTMINUTE,	//시작일-분
				    SSENDDATE,			//종료일
				    SSENDHOUR,			//종료일-시간
				    SSENDMINUTE,		//종료일-분
				    SSREPEATTYPE,		//반복
				    SSREAEATTYPENM,
				    SSREPEATOPTION,		//반복 옵션- 주
				    SSREPEATEND,		//반복종료
				    SSCONTENTS,			//내용
				    SSISOPEN,			//공개여부
				    FK_SAWON_CODE,				//사용자번호
				    SAWON_NAME				
    ;

    
    
	public String getFK_SAWON_CODE() {
		return FK_SAWON_CODE;
	}

	public void setFK_SAWON_CODE(String fK_SAWON_CODE) {
		FK_SAWON_CODE = fK_SAWON_CODE;
	}

	public String getSSNO() {
		return SSNO;
	}

	public void setSSNO(String sSNO) {
		SSNO = sSNO;
	}

	public String getSSTITLE() {
		return SSTITLE;
	}

	public void setSSTITLE(String sSTITLE) {
		SSTITLE = sSTITLE;
	}

	public String getSSTYPE() {
		return SSTYPE;
	}

	public void setSSTYPE(String sSTYPE) {
		SSTYPE = sSTYPE;
	}

	public String getSSSTARTDATE() {
		return SSSTARTDATE;
	}

	public void setSSSTARTDATE(String sSSTARTDATE) {
		SSSTARTDATE = sSSTARTDATE;
	}

	public String getSSSTARTHOUR() {
		return SSSTARTHOUR;
	}

	public void setSSSTARTHOUR(String sSSTARTHOUR) {
		SSSTARTHOUR = sSSTARTHOUR;
	}

	public String getSSSTARTMINUTE() {
		return SSSTARTMINUTE;
	}

	public void setSSSTARTMINUTE(String sSSTARTMINUTE) {
		SSSTARTMINUTE = sSSTARTMINUTE;
	}

	public String getSSENDDATE() {
		return SSENDDATE;
	}

	public void setSSENDDATE(String sSENDDATE) {
		SSENDDATE = sSENDDATE;
	}

	public String getSSENDHOUR() {
		return SSENDHOUR;
	}

	public void setSSENDHOUR(String sSENDHOUR) {
		SSENDHOUR = sSENDHOUR;
	}

	public String getSSENDMINUTE() {
		return SSENDMINUTE;
	}

	public void setSSENDMINUTE(String sSENDMINUTE) {
		SSENDMINUTE = sSENDMINUTE;
	}

	public String getSSREPEATTYPE() {
		return SSREPEATTYPE;
	}

	public void setSSREPEATTYPE(String sSREPEATTYPE) {
		SSREPEATTYPE = sSREPEATTYPE;
	}

	public String getSSREAEATTYPENM() {
		return SSREAEATTYPENM;
	}

	public void setSSREAEATTYPENM(String sSREAEATTYPENM) {
		SSREAEATTYPENM = sSREAEATTYPENM;
	}

	public String getSSREPEATOPTION() {
		return SSREPEATOPTION;
	}

	public void setSSREPEATOPTION(String sSREPEATOPTION) {
		SSREPEATOPTION = sSREPEATOPTION;
	}

	public String getSSREPEATEND() {
		return SSREPEATEND;
	}

	public void setSSREPEATEND(String sSREPEATEND) {
		SSREPEATEND = sSREPEATEND;
	}

	public String getSSCONTENTS() {
		return SSCONTENTS;
	}

	public void setSSCONTENTS(String sSCONTENTS) {
		SSCONTENTS = sSCONTENTS;
	}

	public String getSSISOPEN() {
		return SSISOPEN;
	}

	public void setSSISOPEN(String sSISOPEN) {
		SSISOPEN = sSISOPEN;
	}

	public String getSAWON_NAME() {
		return SAWON_NAME;
	}

	public void setSAWON_NAME(String sAWON_NAME) {
		SAWON_NAME = sAWON_NAME;
	}
    
    

}
