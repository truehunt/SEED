package hr.system.p0001.vo;

import java.security.Timestamp;
import java.sql.Date;

import javax.xml.crypto.Data;

import org.springframework.stereotype.Component;

import oracle.sql.DATE;

@Component("workEnroll_VO")
public class WorkEnroll_VO {
    
	private String pk_workplace_code; // 사업장코드(PK)
	private String fk_company_code; // 회사 코드(FK)
	private String workplace_name; // 사업장 명
	private String workplace_com_reg_num; // 사업자등록번호
	private String workplace_corp_reg_num; // 법인등록번호
	private String workplace_rep_name; // 대표자 명
	private String workplace_zip; // 사업장 우편번호
	private String workplace_address; // 사업장 주소
	private String workplace_detail_address; // 사업장 상세주소
	private String workplace_tel; // 사업장 전화번호
	private String workplace_fax; // 사업장 fax
	private String workplace_business; // 업태
	private String workplace_stocks; // 종목
	private String workplace_open_date; // 개업년월일
	private String workplace_closed_date; // 폐업년월일
	private String workplace_headoff_whe; // 본점 여부
	private String fk_workplace_code2; // 근태 관련 본사 대리점 구분 여부
	private String workplace_int_user_id; // 입력자
	private Timestamp workplace_int_date; // 입력일시
	private String workplace_mod_user_id; // 수정자
	private Timestamp workplace_mod_date; // 수정일시
	
	private String pk_company_code; // 조인문 걸어줄 pk_company_code
	
	
	public WorkEnroll_VO() {
		System.out.println("WorkEnroll_VO 생성");
	}

	// 위의 선언 변수들의 GET, SET 정의 
	public String getPk_workplace_code() {
		return pk_workplace_code;
	}

	public void setPk_workplace_code(String pk_workplace_code) {
		this.pk_workplace_code = pk_workplace_code;
	}

	public String getFk_company_code() {
		return fk_company_code;
	}

	public void setFk_company_code(String fk_company_code) {
		this.fk_company_code = fk_company_code;
	}

	public String getWorkplace_name() {
		return workplace_name;
	}

	public void setWorkplace_name(String workplace_name) {
		this.workplace_name = workplace_name;
	}

	public String getWorkplace_com_reg_num() {
		return workplace_com_reg_num;
	}

	public void setWorkplace_com_reg_num(String workplace_com_reg_num) {
		this.workplace_com_reg_num = workplace_com_reg_num;
	}

	public String getWorkplace_corp_reg_num() {
		return workplace_corp_reg_num;
	}

	public void setWorkplace_corp_reg_num(String workplace_corp_reg_num) {
		this.workplace_corp_reg_num = workplace_corp_reg_num;
	}

	public String getWorkplace_rep_name() {
		return workplace_rep_name;
	}

	public void setWorkplace_rep_name(String workplace_rep_name) {
		this.workplace_rep_name = workplace_rep_name;
	}

	public String getWorkplace_zip() {
		return workplace_zip;
	}

	public void setWorkplace_zip(String workplace_zip) {
		this.workplace_zip = workplace_zip;
	}

	public String getWorkplace_address() {
		return workplace_address;
	}

	public void setWorkplace_address(String workplace_address) {
		this.workplace_address = workplace_address;
	}

	public String getWorkplace_detail_address() {
		return workplace_detail_address;
	}

	public void setWorkplace_detail_address(String workplace_detail_address) {
		this.workplace_detail_address = workplace_detail_address;
	}

	public String getWorkplace_tel() {
		return workplace_tel;
	}

	public void setWorkplace_tel(String workplace_tel) {
		this.workplace_tel = workplace_tel;
	}

	public String getWorkplace_fax() {
		return workplace_fax;
	}

	public void setWorkplace_fax(String workplace_fax) {
		this.workplace_fax = workplace_fax;
	}

	public String getWorkplace_business() {
		return workplace_business;
	}

	public void setWorkplace_business(String workplace_business) {
		this.workplace_business = workplace_business;
	}

	public String getWorkplace_stocks() {
		return workplace_stocks;
	}

	public void setWorkplace_stocks(String workplace_stocks) {
		this.workplace_stocks = workplace_stocks;
	}

	public String getWorkplace_open_date() {
		return workplace_open_date;
	}

	public void setWorkplace_open_date(String workplace_open_date) {
		this.workplace_open_date = workplace_open_date;
	}

	public String getWorkplace_closed_date() {
		return workplace_closed_date;
	}

	public void setWorkplace_closed_date(String workplace_closed_date) {
		this.workplace_closed_date = workplace_closed_date;
	}

	public String getWorkplace_headoff_whe() {
		return workplace_headoff_whe;
	}

	public void setWorkplace_headoff_whe(String workplace_headoff_whe) {
		this.workplace_headoff_whe = workplace_headoff_whe;
	}
	
	public String getFk_workplace_code2() {
		return fk_workplace_code2;
	}

	public void setFk_workplace_code2(String fk_workplace_code2) {
		this.fk_workplace_code2 = fk_workplace_code2;
	}

	public String getWorkplace_int_user_id() {
		return workplace_int_user_id;
	}

	public void setWorkplace_int_user_id(String workplace_int_user_id) {
		this.workplace_int_user_id = workplace_int_user_id;
	}

	public Timestamp getWorkplace_int_date() {
		return workplace_int_date;
	}

	public void setWorkplace_int_date(Timestamp workplace_int_date) {
		this.workplace_int_date = workplace_int_date;
	}

	public String getWorkplace_mod_user_id() {
		return workplace_mod_user_id;
	}

	public void setWorkplace_mod_user_id(String workplace_mod_user_id) {
		this.workplace_mod_user_id = workplace_mod_user_id;
	}

	public Timestamp getWorkplace_mod_date() {
		return workplace_mod_date;
	}

	public void setWorkplace_mod_date(Timestamp workplace_mod_date) {
		this.workplace_mod_date = workplace_mod_date;
	}

	public String getPk_company_code() {
		return pk_company_code;
	}

	public void setPk_company_code(String pk_company_code) {
		this.pk_company_code = pk_company_code;
	}
	
}