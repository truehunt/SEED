package hr.human.p0002.vo;

import org.springframework.stereotype.Component;

@Component("h_BalVO")
public class BalVO {
	private String pk_BAL_CODE;
	private String fk_BAL_CODE;
	private String fk_BAL_SAWON_CODE;
	private String bal_TITLE;
	private String bal_NUM;
	private String bal_DIV_CODE;
	private String bal_DATE;
	private String bal_DETAILS;
	private String bal_INFO;
	private String bal_BEF_INFO;
	private String bal_AFT_INFO;
	private String bal_APPL_DATE;
	private String bal_LONELY;
	private String bal_DEPT_NAME;
	private String bal_POSITION_NAME;
	private String bal_INT_USER_ID;
	private String bal_INT_DATE;
	private String bal_MOD_USER_ID;
	private String bal_MOD_DATE;
	
	private String pk_SAWON_CODE;
	private String sawon_NAME;
	private String dept_NAME;
	private String workplace_NAME;
	private String pk_DEPT_CODE;
	private String rank_NAME;
	
	public BalVO() {
		System.out.println("BalVO 메서드호출");
	}

	public String getPk_BAL_CODE() {
		return pk_BAL_CODE;
	}

	public void setPk_BAL_CODE(String pk_BAL_CODE) {
		this.pk_BAL_CODE = pk_BAL_CODE;
	}

	public String getFk_BAL_CODE() {
		return fk_BAL_CODE;
	}

	public void setFk_BAL_CODE(String fk_BAL_CODE) {
		this.fk_BAL_CODE = fk_BAL_CODE;
	}

	public String getFk_BAL_SAWON_CODE() {
		return fk_BAL_SAWON_CODE;
	}

	public void setFk_BAL_SAWON_CODE(String fk_BAL_SAWON_CODE) {
		this.fk_BAL_SAWON_CODE = fk_BAL_SAWON_CODE;
	}

	public String getBal_TITLE() {
		return bal_TITLE;
	}

	public void setBal_TITLE(String bal_TITLE) {
		this.bal_TITLE = bal_TITLE;
	}

	public String getBal_NUM() {
		return bal_NUM;
	}

	public void setBal_NUM(String bal_NUM) {
		this.bal_NUM = bal_NUM;
	}

	public String getBal_DIV_CODE() {
		return bal_DIV_CODE;
	}

	public void setBal_DIV_CODE(String bal_DIV_CODE) {
		this.bal_DIV_CODE = bal_DIV_CODE;
	}

	public String getBal_DATE() {
		return bal_DATE;
	}

	public void setBal_DATE(String bal_DATE) {
		this.bal_DATE = bal_DATE;
	}

	public String getBal_DETAILS() {
		return bal_DETAILS;
	}

	public void setBal_DETAILS(String bal_DETAILS) {
		this.bal_DETAILS = bal_DETAILS;
	}

	public String getBal_INFO() {
		return bal_INFO;
	}

	public void setBal_INFO(String bal_INFO) {
		this.bal_INFO = bal_INFO;
	}

	public String getBal_BEF_INFO() {
		return bal_BEF_INFO;
	}

	public void setBal_BEF_INFO(String bal_BEF_INFO) {
		this.bal_BEF_INFO = bal_BEF_INFO;
	}

	public String getBal_AFT_INFO() {
		return bal_AFT_INFO;
	}

	public void setBal_AFT_INFO(String bal_AFT_INFO) {
		this.bal_AFT_INFO = bal_AFT_INFO;
	}

	public String getBal_APPL_DATE() {
		return bal_APPL_DATE;
	}

	public void setBal_APPL_DATE(String bal_APPL_DATE) {
		this.bal_APPL_DATE = bal_APPL_DATE;
	}

	public String getBal_LONELY() {
		return bal_LONELY;
	}

	public void setBal_LONELY(String bal_LONELY) {
		this.bal_LONELY = bal_LONELY;
	}

	public String getBal_DEPT_NAME() {
		return bal_DEPT_NAME;
	}

	public void setBal_DEPT_NAME(String bal_DEPT_NAME) {
		this.bal_DEPT_NAME = bal_DEPT_NAME;
	}

	public String getBal_POSITION_NAME() {
		return bal_POSITION_NAME;
	}

	public void setBal_POSITION_NAME(String bal_POSITION_NAME) {
		this.bal_POSITION_NAME = bal_POSITION_NAME;
	}

	public String getBal_INT_USER_ID() {
		return bal_INT_USER_ID;
	}

	public void setBal_INT_USER_ID(String bal_INT_USER_ID) {
		this.bal_INT_USER_ID = bal_INT_USER_ID;
	}

	public String getBal_INT_DATE() {
		return bal_INT_DATE;
	}

	public void setBal_INT_DATE(String bal_INT_DATE) {
		this.bal_INT_DATE = bal_INT_DATE;
	}

	public String getBal_MOD_USER_ID() {
		return bal_MOD_USER_ID;
	}

	public void setBal_MOD_USER_ID(String bal_MOD_USER_ID) {
		this.bal_MOD_USER_ID = bal_MOD_USER_ID;
	}

	public String getBal_MOD_DATE() {
		return bal_MOD_DATE;
	}

	public void setBal_MOD_DATE(String bal_MOD_DATE) {
		this.bal_MOD_DATE = bal_MOD_DATE;
	}

	public String getPk_SAWON_CODE() {
		return pk_SAWON_CODE;
	}

	public void setPk_SAWON_CODE(String pk_SAWON_CODE) {
		this.pk_SAWON_CODE = pk_SAWON_CODE;
	}

	public String getSawon_NAME() {
		return sawon_NAME;
	}

	public void setSawon_NAME(String sawon_NAME) {
		this.sawon_NAME = sawon_NAME;
	}

	public String getDept_NAME() {
		return dept_NAME;
	}

	public void setDept_NAME(String dept_NAME) {
		this.dept_NAME = dept_NAME;
	}

	public String getWorkplace_NAME() {
		return workplace_NAME;
	}

	public void setWorkplace_NAME(String workplace_NAME) {
		this.workplace_NAME = workplace_NAME;
	}

	public String getPk_DEPT_CODE() {
		return pk_DEPT_CODE;
	}

	public void setPk_DEPT_CODE(String pk_DEPT_CODE) {
		this.pk_DEPT_CODE = pk_DEPT_CODE;
	}

	public String getRank_NAME() {
		return rank_NAME;
	}

	public void setRank_NAME(String rank_NAME) {
		this.rank_NAME = rank_NAME;
	}

}
