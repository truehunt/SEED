package hr.system.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("codeVO")
public class InsaCodeVO {
	private String pk_PERSON_BC_CODE_NUM;
	private String person_BC_OUTPUT;
	private String person_BC_MNGEMENT_NAME;
	private String person_BC_MODIFY_WHE;
	private String person_BC_INT_USER_ID;
	private Date person_BC_INT_DATE;
	private String person_BC_MOD_USER_ID;
	private Date person_BC_MOD_DATE;
	
	private String pk_PERSON_BC_DETAI_CODE_NUM;
	private String fk_PERSON_BC_CODE_NUM;
	private String person_BC_DETAI_MNGEMENT_NAME;
	private String person_BC_DETAI_REMARKS;
	private String person_BC_DETAI_INT_USER_ID;
	private String person_BC_DETAI_INT_DATE;
	private String person_BC_DETAI_MOD_USER_ID;
	private String person_BC_DETAI_MOD_DATE;
	private String person_BC_DETAI_NOT_USE;
	
	private String copy_CODE_NUM;
	
	public String getCopy_CODE_NUM() {
		return copy_CODE_NUM;
	}

	public void setCopy_CODE_NUM(String copy_CODE_NUM) {
		this.copy_CODE_NUM = copy_CODE_NUM;
	}

	public InsaCodeVO() {
		System.out.println("MemberVO ?Éù?Ñ±?ûê ?ò∏Ï∂?");
	}

	public String getPk_PERSON_BC_CODE_NUM() {
		return pk_PERSON_BC_CODE_NUM;
	}

	public void setPk_PERSON_BC_CODE_NUM(String pk_PERSON_BC_CODE_NUM) {
		this.pk_PERSON_BC_CODE_NUM = pk_PERSON_BC_CODE_NUM;
	}

	public String getPerson_BC_OUTPUT() {
		return person_BC_OUTPUT;
	}

	public void setPerson_BC_OUTPUT(String person_BC_OUTPUT) {
		this.person_BC_OUTPUT = person_BC_OUTPUT;
	}

	public String getPerson_BC_MNGEMENT_NAME() {
		return person_BC_MNGEMENT_NAME;
	}

	public void setPerson_BC_MNGEMENT_NAME(String person_BC_MNGEMENT_NAME) {
		this.person_BC_MNGEMENT_NAME = person_BC_MNGEMENT_NAME;
	}

	public String getPerson_BC_MODIFY_WHE() {
		return person_BC_MODIFY_WHE;
	}

	public void setPerson_BC_MODIFY_WHE(String person_BC_MODIFY_WHE) {
		this.person_BC_MODIFY_WHE = person_BC_MODIFY_WHE;
	}

	public String getPerson_BC_INT_USER_ID() {
		return person_BC_INT_USER_ID;
	}

	public void setPerson_BC_INT_USER_ID(String person_BC_INT_USER_ID) {
		this.person_BC_INT_USER_ID = person_BC_INT_USER_ID;
	}

	public Date getPerson_BC_INT_DATE() {
		return person_BC_INT_DATE;
	}

	public void setPerson_BC_INT_DATE(Date person_BC_INT_DATE) {
		this.person_BC_INT_DATE = person_BC_INT_DATE;
	}

	public String getPerson_BC_MOD_USER_ID() {
		return person_BC_MOD_USER_ID;
	}

	public void setPerson_BC_MOD_USER_ID(String person_BC_MOD_USER_ID) {
		this.person_BC_MOD_USER_ID = person_BC_MOD_USER_ID;
	}

	public Date getPerson_BC_MOD_DATE() {
		return person_BC_MOD_DATE;
	}

	public void setPerson_BC_MOD_DATE(Date person_BC_MOD_DATE) {
		this.person_BC_MOD_DATE = person_BC_MOD_DATE;
	}

	public String getPk_PERSON_BC_DETAI_CODE_NUM() {
		return pk_PERSON_BC_DETAI_CODE_NUM;
	}

	public void setPk_PERSON_BC_DETAI_CODE_NUM(String pk_PERSON_BC_DETAI_CODE_NUM) {
		this.pk_PERSON_BC_DETAI_CODE_NUM = pk_PERSON_BC_DETAI_CODE_NUM;
	}

	public String getFk_PERSON_BC_CODE_NUM() {
		return fk_PERSON_BC_CODE_NUM;
	}

	public void setFk_PERSON_BC_CODE_NUM(String fk_PERSON_BC_CODE_NUM) {
		this.fk_PERSON_BC_CODE_NUM = fk_PERSON_BC_CODE_NUM;
	}

	public String getPerson_BC_DETAI_MNGEMENT_NAME() {
		return person_BC_DETAI_MNGEMENT_NAME;
	}

	public void setPerson_BC_DETAI_MNGEMENT_NAME(String person_BC_DETAI_MNGEMENT_NAME) {
		this.person_BC_DETAI_MNGEMENT_NAME = person_BC_DETAI_MNGEMENT_NAME;
	}

	public String getPerson_BC_DETAI_REMARKS() {
		return person_BC_DETAI_REMARKS;
	}

	public void setPerson_BC_DETAI_REMARKS(String person_BC_DETAI_REMARKS) {
		this.person_BC_DETAI_REMARKS = person_BC_DETAI_REMARKS;
	}

	public String getPerson_BC_DETAI_INT_USER_ID() {
		return person_BC_DETAI_INT_USER_ID;
	}

	public void setPerson_BC_DETAI_INT_USER_ID(String person_BC_DETAI_INT_USER_ID) {
		this.person_BC_DETAI_INT_USER_ID = person_BC_DETAI_INT_USER_ID;
	}

	public String getPerson_BC_DETAI_INT_DATE() {
		return person_BC_DETAI_INT_DATE;
	}

	public void setPerson_BC_DETAI_INT_DATE(String person_BC_DETAI_INT_DATE) {
		this.person_BC_DETAI_INT_DATE = person_BC_DETAI_INT_DATE;
	}

	public String getPerson_BC_DETAI_MOD_USER_ID() {
		return person_BC_DETAI_MOD_USER_ID;
	}

	public void setPerson_BC_DETAI_MOD_USER_ID(String person_BC_DETAI_MOD_USER_ID) {
		this.person_BC_DETAI_MOD_USER_ID = person_BC_DETAI_MOD_USER_ID;
	}

	public String getPerson_BC_DETAI_MOD_DATE() {
		return person_BC_DETAI_MOD_DATE;
	}

	public void setPerson_BC_DETAI_MOD_DATE(String person_BC_DETAI_MOD_DATE) {
		this.person_BC_DETAI_MOD_DATE = person_BC_DETAI_MOD_DATE;
	}

	public String getPerson_BC_DETAI_NOT_USE() {
		return person_BC_DETAI_NOT_USE;
	}

	public void setPerson_BC_DETAI_NOT_USE(String person_BC_DETAI_NOT_USE) {
		this.person_BC_DETAI_NOT_USE = person_BC_DETAI_NOT_USE;
	}

	


	
}
