package hr.human.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("h_HlVO")
public class HlVO {
	private String pk_HL_CODE;
	private String fk_HL_SAWON_CODE;
	private String hl_SCHOOL_CODE;
	private String hl_STA_DATE;
	private String hl_END_DATE;
	private String hl_SORT_CODE;
	private String hl_LOCATION;
	private String hl_MAJOR_CODE;
	private String hl_MINOR_CODE;
	private String hl_DEGREE;
	private String hl_JUYA_CODE;
	private String hl_MAIN_CODE;
	private String hl_MOD_USER_ID;
	private String hl_INT_USER_ID;
	private String hl_MOD_DATE;
	private String hl_INT_DATE;

	public HlVO() {
		System.out.println("MemberVO ?깮?꽦?옄 ?샇異?");
	}

	public String getPk_HL_CODE() {
		return pk_HL_CODE;
	}

	public void setPk_HL_CODE(String pk_HL_CODE) {
		this.pk_HL_CODE = pk_HL_CODE;
	}

	public String getFk_HL_SAWON_CODE() {
		return fk_HL_SAWON_CODE;
	}

	public void setFk_HL_SAWON_CODE(String fk_HL_SAWON_CODE) {
		this.fk_HL_SAWON_CODE = fk_HL_SAWON_CODE;
	}

	public String getHl_SCHOOL_CODE() {
		return hl_SCHOOL_CODE;
	}

	public void setHl_SCHOOL_CODE(String hl_SCHOOL_CODE) {
		this.hl_SCHOOL_CODE = hl_SCHOOL_CODE;
	}

	public String getHl_STA_DATE() {
		return hl_STA_DATE;
	}

	public void setHl_STA_DATE(String hl_STA_DATE) {
		this.hl_STA_DATE = hl_STA_DATE;
	}

	public String getHl_END_DATE() {
		return hl_END_DATE;
	}

	public void setHl_END_DATE(String hl_END_DATE) {
		this.hl_END_DATE = hl_END_DATE;
	}

	public String getHl_SORT_CODE() {
		return hl_SORT_CODE;
	}

	public void setHl_SORT_CODE(String hl_SORT_CODE) {
		this.hl_SORT_CODE = hl_SORT_CODE;
	}

	public String getHl_LOCATION() {
		return hl_LOCATION;
	}

	public void setHl_LOCATION(String hl_LOCATION) {
		this.hl_LOCATION = hl_LOCATION;
	}

	public String getHl_MAJOR_CODE() {
		return hl_MAJOR_CODE;
	}

	public void setHl_MAJOR_CODE(String hl_MAJOR_CODE) {
		this.hl_MAJOR_CODE = hl_MAJOR_CODE;
	}

	public String getHl_MINOR_CODE() {
		return hl_MINOR_CODE;
	}

	public void setHl_MINOR_CODE(String hl_MINOR_CODE) {
		this.hl_MINOR_CODE = hl_MINOR_CODE;
	}

	public String getHl_DEGREE() {
		return hl_DEGREE;
	}

	public void setHl_DEGREE(String hl_DEGREE) {
		this.hl_DEGREE = hl_DEGREE;
	}

	public String getHl_JUYA_CODE() {
		return hl_JUYA_CODE;
	}

	public void setHl_JUYA_CODE(String hl_JUYA_CODE) {
		this.hl_JUYA_CODE = hl_JUYA_CODE;
	}

	public String getHl_MAIN_CODE() {
		return hl_MAIN_CODE;
	}

	public void setHl_MAIN_CODE(String hl_MAIN_CODE) {
		this.hl_MAIN_CODE = hl_MAIN_CODE;
	}

	public String getHl_MOD_USER_ID() {
		return hl_MOD_USER_ID;
	}

	public void setHl_MOD_USER_ID(String hl_MOD_USER_ID) {
		this.hl_MOD_USER_ID = hl_MOD_USER_ID;
	}

	public String getHl_INT_USER_ID() {
		return hl_INT_USER_ID;
	}

	public void setHl_INT_USER_ID(String hl_INT_USER_ID) {
		this.hl_INT_USER_ID = hl_INT_USER_ID;
	}

	public String getHl_MOD_DATE() {
		return hl_MOD_DATE;
	}

	public void setHl_MOD_DATE(String hl_MOD_DATE) {
		this.hl_MOD_DATE = hl_MOD_DATE;
	}

	public String getHl_INT_DATE() {
		return hl_INT_DATE;
	}

	public void setHl_INT_DATE(String hl_INT_DATE) {
		this.hl_INT_DATE = hl_INT_DATE;
	}

}
