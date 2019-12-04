package hr.human.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("h_CertVO")
public class CertVO {
	private String pk_CERTIFICATE_CODE;
	private String fk_CERTIFICATE_SAWON_CODE;
	private String certificate_SORT_CODE;
	private String certificate_STA_DATE;
	private String certificate_END_DATE;
	private String certificate_NUM;
	private String certificate_ISSUER_CODE;
	private String certificate_SUDANG_CODE;
	private String certificate_INT_USER_ID;
	private String certificate_INT_DATE;
	private String certificate_MOD_USER_ID;
	private String certificate_MOD_DATE;
	
	private int count_num;
	private String name;
	
	public CertVO() {
		System.out.println("CertVO 메서드 호출");
	}

	public String getPk_CERTIFICATE_CODE() {
		return pk_CERTIFICATE_CODE;
	}

	public void setPk_CERTIFICATE_CODE(String pk_CERTIFICATE_CODE) {
		this.pk_CERTIFICATE_CODE = pk_CERTIFICATE_CODE;
	}

	public String getFk_CERTIFICATE_SAWON_CODE() {
		return fk_CERTIFICATE_SAWON_CODE;
	}

	public void setFk_CERTIFICATE_SAWON_CODE(String fk_CERTIFICATE_SAWON_CODE) {
		this.fk_CERTIFICATE_SAWON_CODE = fk_CERTIFICATE_SAWON_CODE;
	}

	public String getCertificate_SORT_CODE() {
		return certificate_SORT_CODE;
	}

	public void setCertificate_SORT_CODE(String certificate_SORT_CODE) {
		this.certificate_SORT_CODE = certificate_SORT_CODE;
	}

	public String getCertificate_STA_DATE() {
		return certificate_STA_DATE;
	}

	public void setCertificate_STA_DATE(String certificate_STA_DATE) {
		this.certificate_STA_DATE = certificate_STA_DATE;
	}

	public String getCertificate_END_DATE() {
		return certificate_END_DATE;
	}

	public void setCertificate_END_DATE(String certificate_END_DATE) {
		this.certificate_END_DATE = certificate_END_DATE;
	}

	public String getCertificate_NUM() {
		return certificate_NUM;
	}

	public void setCertificate_NUM(String certificate_NUM) {
		this.certificate_NUM = certificate_NUM;
	}

	public String getCertificate_ISSUER_CODE() {
		return certificate_ISSUER_CODE;
	}

	public void setCertificate_ISSUER_CODE(String certificate_ISSUER_CODE) {
		this.certificate_ISSUER_CODE = certificate_ISSUER_CODE;
	}

	public String getCertificate_SUDANG_CODE() {
		return certificate_SUDANG_CODE;
	}

	public void setCertificate_SUDANG_CODE(String certificate_SUDANG_CODE) {
		this.certificate_SUDANG_CODE = certificate_SUDANG_CODE;
	}

	public String getCertificate_INT_USER_ID() {
		return certificate_INT_USER_ID;
	}

	public void setCertificate_INT_USER_ID(String certificate_INT_USER_ID) {
		this.certificate_INT_USER_ID = certificate_INT_USER_ID;
	}

	public String getCertificate_INT_DATE() {
		return certificate_INT_DATE;
	}

	public void setCertificate_INT_DATE(String certificate_INT_DATE) {
		this.certificate_INT_DATE = certificate_INT_DATE;
	}

	public String getCertificate_MOD_USER_ID() {
		return certificate_MOD_USER_ID;
	}

	public void setCertificate_MOD_USER_ID(String certificate_MOD_USER_ID) {
		this.certificate_MOD_USER_ID = certificate_MOD_USER_ID;
	}

	public String getCertificate_MOD_DATE() {
		return certificate_MOD_DATE;
	}

	public void setCertificate_MOD_DATE(String certificate_MOD_DATE) {
		this.certificate_MOD_DATE = certificate_MOD_DATE;
	}

	public int getCount_num() {
		return count_num;
	}

	public void setCount_num(int count_num) {
		this.count_num = count_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



}
