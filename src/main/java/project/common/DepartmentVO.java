package project.common;

public class DepartmentVO {

    private String PK_DEPT_CODE; // 부서코드		deptno 
    private String DEPT_NAME; // 부서명			deptnm
    private String DEPT_PRIODOF; //	사용기간
    private String FK_SECTOR_CODE; // 부문코드
    private String DEPT_INT_USER_ID;  // 입력자
    private String DEPT_INT_DATE; //입력일시
    private String DEPT_MOD_USER_ID; // 수정자
    private String DEPT_MOD_DATE; // 수정일시
    private String FK_WORKPLACE_CODE; // 사업장 코드
    private String DEPT_PARENTNO; // 	parentno -> 부서메뉴 트리구조 만들기 위한 컬럼
    
	public String getPK_DEPT_CODE() {
		return PK_DEPT_CODE;
	}
	public void setPK_DEPT_CODE(String pK_DEPT_CODE) {
		PK_DEPT_CODE = pK_DEPT_CODE;
	}
	public String getDEPT_NAME() {
		return DEPT_NAME;
	}
	public void setDEPT_NAME(String dEPT_NAME) {
		DEPT_NAME = dEPT_NAME;
	}
	public String getDEPT_PRIODOF() {
		return DEPT_PRIODOF;
	}
	public void setDEPT_PRIODOF(String dEPT_PRIODOF) {
		DEPT_PRIODOF = dEPT_PRIODOF;
	}
	public String getFK_SECTOR_CODE() {
		return FK_SECTOR_CODE;
	}
	public void setFK_SECTOR_CODE(String fK_SECTOR_CODE) {
		FK_SECTOR_CODE = fK_SECTOR_CODE;
	}
	public String getDEPT_INT_USER_ID() {
		return DEPT_INT_USER_ID;
	}
	public void setDEPT_INT_USER_ID(String dEPT_INT_USER_ID) {
		DEPT_INT_USER_ID = dEPT_INT_USER_ID;
	}
	public String getDEPT_INT_DATE() {
		return DEPT_INT_DATE;
	}
	public void setDEPT_INT_DATE(String dEPT_INT_DATE) {
		DEPT_INT_DATE = dEPT_INT_DATE;
	}
	public String getDEPT_MOD_USER_ID() {
		return DEPT_MOD_USER_ID;
	}
	public void setDEPT_MOD_USER_ID(String dEPT_MOD_USER_ID) {
		DEPT_MOD_USER_ID = dEPT_MOD_USER_ID;
	}
	public String getDEPT_MOD_DATE() {
		return DEPT_MOD_DATE;
	}
	public void setDEPT_MOD_DATE(String dEPT_MOD_DATE) {
		DEPT_MOD_DATE = dEPT_MOD_DATE;
	}
	public String getFK_WORKPLACE_CODE() {
		return FK_WORKPLACE_CODE;
	}
	public void setFK_WORKPLACE_CODE(String fK_WORKPLACE_CODE) {
		FK_WORKPLACE_CODE = fK_WORKPLACE_CODE;
	}
	public String getDEPT_PARENTNO() {
		return DEPT_PARENTNO;
	}
	public void setDEPT_PARENTNO(String dEPT_PARENTNO) {
		DEPT_PARENTNO = dEPT_PARENTNO;
	}

}
