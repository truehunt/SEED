package hr.human.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("h_insaCardVO")
public class CardVO {
	private String pk_SAWON_CODE;
	private String sawon_NAME;
	private String photo;
	
	private String pk_ISA_CODE;
	private String fk_ISA_SAWON_CODE;
	private String isa_MOD_USER_ID;
	private String isa_INT_USER_ID;
	private String isa_MOD_DATE;
	private String isa_INT_DATE;
	private String isa_HANJA_NAME;
	private String isa_HIRE_CODE;
	private String isa_NUM;
	
	private String isa_ADDR_ZIP;
	private String isa_ADDRESS;
	private String isa_ADDR_DETAIL;
	
	private String isa_PER_ADDR_ZIP;
	private String isa_PERMANENT_ADDR;
	private String isa_PER_ADDR_DETAIL;
	
	private String isa_MARRIAGE_CODE;
	private String isa_HOUSE_CODE;
	private String isa_LIVING_CODE;

	private String isa_RELIGION_CODE;
	private String isa_HOBBY_CODE;
	private String isa_SPECIALTY_CODE;
	
	private String religion_DETAI;
	private String hobby_DETAI;
	private String specialty_DETAI;
	
	private String isa_MILITARY_CODE; // 병역구분
	private String isa_MYEONJE; // 면제사유
	private String isa_MIL_NUM; // 군번
	private String isa_MILI_STA_DATE; // 복무시작일
	private String isa_MILI_END_DATE; // 복무종료일
	private String isa_POS_CODE; // 복무기간포함여부
	private String isa_GUNBYEOL_CODE; // 군별
	private String isa_BOTS_CODE; // 병과
	private String isa_YEBIGUN_CODE; // 예비군
	private String isa_DISCHARGE_CODE; // 제대구분
	private String isa_MILITARY_CLASS_CODE; // 계급
	
	public CardVO() {
		System.out.println("CardVO 메서드 호출");
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPk_ISA_CODE() {
		return pk_ISA_CODE;
	}

	public void setPk_ISA_CODE(String pk_ISA_CODE) {
		this.pk_ISA_CODE = pk_ISA_CODE;
	}

	public String getFk_ISA_SAWON_CODE() {
		return fk_ISA_SAWON_CODE;
	}

	public void setFk_ISA_SAWON_CODE(String fk_ISA_SAWON_CODE) {
		this.fk_ISA_SAWON_CODE = fk_ISA_SAWON_CODE;
	}

	public String getIsa_MOD_USER_ID() {
		return isa_MOD_USER_ID;
	}

	public void setIsa_MOD_USER_ID(String isa_MOD_USER_ID) {
		this.isa_MOD_USER_ID = isa_MOD_USER_ID;
	}

	public String getIsa_INT_USER_ID() {
		return isa_INT_USER_ID;
	}

	public void setIsa_INT_USER_ID(String isa_INT_USER_ID) {
		this.isa_INT_USER_ID = isa_INT_USER_ID;
	}

	public String getIsa_MOD_DATE() {
		return isa_MOD_DATE;
	}

	public void setIsa_MOD_DATE(String isa_MOD_DATE) {
		this.isa_MOD_DATE = isa_MOD_DATE;
	}

	public String getIsa_INT_DATE() {
		return isa_INT_DATE;
	}

	public void setIsa_INT_DATE(String isa_INT_DATE) {
		this.isa_INT_DATE = isa_INT_DATE;
	}

	public String getIsa_HANJA_NAME() {
		return isa_HANJA_NAME;
	}

	public void setIsa_HANJA_NAME(String isa_HANJA_NAME) {
		this.isa_HANJA_NAME = isa_HANJA_NAME;
	}

	public String getIsa_HIRE_CODE() {
		return isa_HIRE_CODE;
	}

	public void setIsa_HIRE_CODE(String isa_HIRE_CODE) {
		this.isa_HIRE_CODE = isa_HIRE_CODE;
	}

	public String getIsa_NUM() {
		return isa_NUM;
	}

	public void setIsa_NUM(String isa_NUM) {
		this.isa_NUM = isa_NUM;
	}

	public String getIsa_ADDR_ZIP() {
		return isa_ADDR_ZIP;
	}

	public void setIsa_ADDR_ZIP(String isa_ADDR_ZIP) {
		this.isa_ADDR_ZIP = isa_ADDR_ZIP;
	}

	public String getIsa_ADDRESS() {
		return isa_ADDRESS;
	}

	public void setIsa_ADDRESS(String isa_ADDRESS) {
		this.isa_ADDRESS = isa_ADDRESS;
	}

	public String getIsa_ADDR_DETAIL() {
		return isa_ADDR_DETAIL;
	}

	public void setIsa_ADDR_DETAIL(String isa_ADDR_DETAIL) {
		this.isa_ADDR_DETAIL = isa_ADDR_DETAIL;
	}

	public String getIsa_PER_ADDR_ZIP() {
		return isa_PER_ADDR_ZIP;
	}

	public void setIsa_PER_ADDR_ZIP(String isa_PER_ADDR_ZIP) {
		this.isa_PER_ADDR_ZIP = isa_PER_ADDR_ZIP;
	}

	public String getIsa_PERMANENT_ADDR() {
		return isa_PERMANENT_ADDR;
	}

	public void setIsa_PERMANENT_ADDR(String isa_PERMANENT_ADDR) {
		this.isa_PERMANENT_ADDR = isa_PERMANENT_ADDR;
	}

	public String getIsa_PER_ADDR_DETAIL() {
		return isa_PER_ADDR_DETAIL;
	}

	public void setIsa_PER_ADDR_DETAIL(String isa_PER_ADDR_DETAIL) {
		this.isa_PER_ADDR_DETAIL = isa_PER_ADDR_DETAIL;
	}

	public String getIsa_MARRIAGE_CODE() {
		return isa_MARRIAGE_CODE;
	}

	public void setIsa_MARRIAGE_CODE(String isa_MARRIAGE_CODE) {
		this.isa_MARRIAGE_CODE = isa_MARRIAGE_CODE;
	}

	public String getIsa_HOUSE_CODE() {
		return isa_HOUSE_CODE;
	}

	public void setIsa_HOUSE_CODE(String isa_HOUSE_CODE) {
		this.isa_HOUSE_CODE = isa_HOUSE_CODE;
	}

	public String getIsa_LIVING_CODE() {
		return isa_LIVING_CODE;
	}

	public void setIsa_LIVING_CODE(String isa_LIVING_CODE) {
		this.isa_LIVING_CODE = isa_LIVING_CODE;
	}

	public String getIsa_RELIGION_CODE() {
		return isa_RELIGION_CODE;
	}

	public void setIsa_RELIGION_CODE(String isa_RELIGION_CODE) {
		this.isa_RELIGION_CODE = isa_RELIGION_CODE;
	}

	public String getIsa_HOBBY_CODE() {
		return isa_HOBBY_CODE;
	}

	public void setIsa_HOBBY_CODE(String isa_HOBBY_CODE) {
		this.isa_HOBBY_CODE = isa_HOBBY_CODE;
	}

	public String getIsa_SPECIALTY_CODE() {
		return isa_SPECIALTY_CODE;
	}

	public void setIsa_SPECIALTY_CODE(String isa_SPECIALTY_CODE) {
		this.isa_SPECIALTY_CODE = isa_SPECIALTY_CODE;
	}

	public String getReligion_DETAI() {
		return religion_DETAI;
	}

	public void setReligion_DETAI(String religion_DETAI) {
		this.religion_DETAI = religion_DETAI;
	}

	public String getHobby_DETAI() {
		return hobby_DETAI;
	}

	public void setHobby_DETAI(String hobby_DETAI) {
		this.hobby_DETAI = hobby_DETAI;
	}

	public String getSpecialty_DETAI() {
		return specialty_DETAI;
	}

	public void setSpecialty_DETAI(String specialty_DETAI) {
		this.specialty_DETAI = specialty_DETAI;
	}

	public String getIsa_MILITARY_CODE() {
		return isa_MILITARY_CODE;
	}

	public void setIsa_MILITARY_CODE(String isa_MILITARY_CODE) {
		this.isa_MILITARY_CODE = isa_MILITARY_CODE;
	}

	public String getIsa_MYEONJE() {
		return isa_MYEONJE;
	}

	public void setIsa_MYEONJE(String isa_MYEONJE) {
		this.isa_MYEONJE = isa_MYEONJE;
	}

	public String getIsa_MIL_NUM() {
		return isa_MIL_NUM;
	}

	public void setIsa_MIL_NUM(String isa_MIL_NUM) {
		this.isa_MIL_NUM = isa_MIL_NUM;
	}

	public String getIsa_MILI_STA_DATE() {
		return isa_MILI_STA_DATE;
	}

	public void setIsa_MILI_STA_DATE(String isa_MILI_STA_DATE) {
		this.isa_MILI_STA_DATE = isa_MILI_STA_DATE;
	}

	public String getIsa_MILI_END_DATE() {
		return isa_MILI_END_DATE;
	}

	public void setIsa_MILI_END_DATE(String isa_MILI_END_DATE) {
		this.isa_MILI_END_DATE = isa_MILI_END_DATE;
	}

	public String getIsa_POS_CODE() {
		return isa_POS_CODE;
	}

	public void setIsa_POS_CODE(String isa_POS_CODE) {
		this.isa_POS_CODE = isa_POS_CODE;
	}

	public String getIsa_GUNBYEOL_CODE() {
		return isa_GUNBYEOL_CODE;
	}

	public void setIsa_GUNBYEOL_CODE(String isa_GUNBYEOL_CODE) {
		this.isa_GUNBYEOL_CODE = isa_GUNBYEOL_CODE;
	}

	public String getIsa_BOTS_CODE() {
		return isa_BOTS_CODE;
	}

	public void setIsa_BOTS_CODE(String isa_BOTS_CODE) {
		this.isa_BOTS_CODE = isa_BOTS_CODE;
	}

	public String getIsa_YEBIGUN_CODE() {
		return isa_YEBIGUN_CODE;
	}

	public void setIsa_YEBIGUN_CODE(String isa_YEBIGUN_CODE) {
		this.isa_YEBIGUN_CODE = isa_YEBIGUN_CODE;
	}

	public String getIsa_DISCHARGE_CODE() {
		return isa_DISCHARGE_CODE;
	}

	public void setIsa_DISCHARGE_CODE(String isa_DISCHARGE_CODE) {
		this.isa_DISCHARGE_CODE = isa_DISCHARGE_CODE;
	}

	public String getIsa_MILITARY_CLASS_CODE() {
		return isa_MILITARY_CLASS_CODE;
	}

	public void setIsa_MILITARY_CLASS_CODE(String isa_MILITARY_CLASS_CODE) {
		this.isa_MILITARY_CLASS_CODE = isa_MILITARY_CLASS_CODE;
	}
	
	
}
