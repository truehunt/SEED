package hr.human.s0001.vo;

import java.security.Timestamp;
import java.sql.Date;

import javax.xml.crypto.Data;

import org.springframework.stereotype.Component;

@Component("comEnroll_VO")
public class ComEnroll_VO {
    
	private String pk_company_code; // 회사코드
	private String company_name; // 회사명
	private String company_division; // 구분- 법인, 개인
	private String company_fiscal_year_o; // 회계년도1 
	private String company_fiscal_year_t; // 회계년도2
	private String company_reg_num; // 사업자등록번호
	private String company_corp_reg_num; // 법인등록번호
	private String company_rep_name; // 대표자 성명
	private String company_foreigner_whe; // 외국인 여부
	private String company_resi_reg_num; // 주민등록번호
	private String company_zip; // 본점 우편번호
	private String company_address; // 본점 주소
	private String company_detail_address; // 본점 상세주소
	private String company_tel; // 본점 전화번호
	private String company_fax; // 본점 fax
	private String company_business; // 업태
	private String company_stocks; // 종목
	private String company_establishment_date; // 설립연월일
	private String company_open_date; // 개업연월일
	private String company_closed_date; // 폐업연월일
	private String company_int_user_id; // 입력자
	private Timestamp company_int_date; // 입력일시
	private String company_mod_user_id; // 수정자
	private Timestamp company_mod_date; // 수정일시
	
	public ComEnroll_VO() {
		System.out.println("s0001VO 메서드 호출");
	}

	public String getPk_company_code() {
		return pk_company_code;
	}

	public void setPk_company_code(String pk_company_code) {
		this.pk_company_code = pk_company_code;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_division() {
		return company_division;
	}

	public void setCompany_division(String company_division) {
		this.company_division = company_division;
	}

	public String getCompany_fiscal_year_o() {
		return company_fiscal_year_o;
	}

	public void setCompany_fiscal_year_o(String company_fiscal_year_o) {
		this.company_fiscal_year_o = company_fiscal_year_o;
	}

	public String getCompany_fiscal_year_t() {
		return company_fiscal_year_t;
	}

	public void setCompany_fiscal_year_t(String company_fiscal_year_t) {
		this.company_fiscal_year_t = company_fiscal_year_t;
	}

	public String getCompany_reg_num() {
		return company_reg_num;
	}

	public void setCompany_reg_num(String company_reg_num) {
		this.company_reg_num = company_reg_num;
	}

	public String getCompany_corp_reg_num() {
		return company_corp_reg_num;
	}

	public void setCompany_corp_reg_num(String company_corp_reg_num) {
		this.company_corp_reg_num = company_corp_reg_num;
	}

	public String getCompany_rep_name() {
		return company_rep_name;
	}

	public void setCompany_rep_name(String company_rep_name) {
		this.company_rep_name = company_rep_name;
	}

	public String getCompany_foreigner_whe() {
		return company_foreigner_whe;
	}

	public void setCompany_foreigner_whe(String company_foreigner_whe) {
		this.company_foreigner_whe = company_foreigner_whe;
	}

	public String getCompany_resi_reg_num() {
		return company_resi_reg_num;
	}

	public void setCompany_resi_reg_num(String company_resi_reg_num) {
		this.company_resi_reg_num = company_resi_reg_num;
	}

	public String getCompany_zip() {
		return company_zip;
	}

	public void setCompany_zip(String company_zip) {
		this.company_zip = company_zip;
	}

	public String getCompany_address() {
		return company_address;
	}

	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}

	public String getCompany_detail_address() {
		return company_detail_address;
	}

	public void setCompany_detail_address(String company_detail_address) {
		this.company_detail_address = company_detail_address;
	}
	
	public String getCompany_tel() {
		return company_tel;
	}

	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}

	public String getCompany_fax() {
		return company_fax;
	}

	public void setCompany_fax(String company_fax) {
		this.company_fax = company_fax;
	}

	public String getCompany_business() {
		return company_business;
	}

	public void setCompany_business(String company_business) {
		this.company_business = company_business;
	}

	public String getCompany_stocks() {
		return company_stocks;
	}

	public void setCompany_stocks(String company_stocks) {
		this.company_stocks = company_stocks;
	}

	public String getCompany_establishment_date() {
		return company_establishment_date;
	}

	public void setCompany_establishment_date(String company_establishment_date) {
		this.company_establishment_date = company_establishment_date;
	}

	public String getCompany_open_date() {
		return company_open_date;
	}

	public void setCompany_open_date(String company_open_date) {
		this.company_open_date = company_open_date;
	}

	public String getCompany_closed_date() {
		return company_closed_date;
	}

	public void setCompany_closed_date(String company_closed_date) {
		this.company_closed_date = company_closed_date;
	}

	public String getCompany_int_user_id() {
		return company_int_user_id;
	}

	public void setCompany_int_user_id(String company_int_user_id) {
		this.company_int_user_id = company_int_user_id;
	}

	public Timestamp getCompany_int_date() {
		return company_int_date;
	}

	public void setCompany_int_date(Timestamp company_int_date) {
		this.company_int_date = company_int_date;
	}

	public String getCompany_mod_user_id() {
		return company_mod_user_id;
	}

	public void setCompany_mod_user_id(String company_mod_user_id) {
		this.company_mod_user_id = company_mod_user_id;
	}

	public Timestamp getCompany_mod_date() {
		return company_mod_date;
	}

	public void setCompany_mod_date(Timestamp company_mod_date) {
		this.company_mod_date = company_mod_date;
	}
	

	
}
