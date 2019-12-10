package hr.system.p0002.vo;

import java.security.Timestamp;
import org.springframework.stereotype.Component;

@Component("insa_personEnroll_VO")
public class Insa_personEnroll_VO {
//인사정보등록-인적정보
	private String pk_person_info_unique_num; // 인적정보 고유번호 
	private String fk_sawon_code; // fk_사원코드
	private String person_info_picture; // 사진
	private String person_info_eng_name; // 사원 명(영문)
	private String person_info_domes_forei_pop; // 내외국인 구분
	private String person_info_res_reg_num; // 주민등록번호
	private String person_info_forei_reg_num; // 외국인등록번호
	private String person_info_gender; // 성별
	private String person_info_date_birth; // 생년월일
	private String person_info_tel; // 전화번호
	private String person_info_emerg_call; // 비상연락망
	private String person_info_final_edu_code; // 최종학력 코드
	private String person_info_final_edu_name; // 최종학력 이름 
	private String person_info_zip; // 우편번호
	private String person_info_resi_reg_address; // 주민등록주소
	private String person_info_detail_address; // 상세주소
	private String person_info_eng_address; // 영문주소
	private String person_info_email; // 이메일주소
	private String person_info_access_card_no; // 출입카드no
	private String person_info_head_household; // 세대주 여부
	private String person_info_dis_classifi; // 장애인구분
	private String person_info_nation_mngement; // 국적(관리용)
	private String person_info_nation_report_cd; // 국적(신고용) 코드
	private String person_info_nation_report_nm; // 국적(신고용) 명
	private String person_info_resident_classifi; // 거주자구분
	private String person_info_coun_resi_code; // 거주지국 코드
	private String person_info_coun_resi_name; // 거주지국 이름
	private String pk_sawon_code; // 조건 위한 사원코드
	
	private String person_info_int_user_id; // 입력자
	private Timestamp person_info_int_date; // 입력일시
	private String person_info_mod_user_id; // 수정자
	private Timestamp person_info_mod_date; // 수정일시

	public Insa_personEnroll_VO() {
		System.out.println("Insa_personEnroll_VO 생성");
	}

	// 위의 선언 변수들의 GET, SET 정의 
	public String getPk_person_info_unique_num() {
		return pk_person_info_unique_num;
	}

	public void setPk_person_info_unique_num(String pk_person_info_unique_num) {
		this.pk_person_info_unique_num = pk_person_info_unique_num;
	}

	public String getFk_sawon_code() {
		return fk_sawon_code;
	}

	public void setFk_sawon_code(String fk_sawon_code) {
		this.fk_sawon_code = fk_sawon_code;
	}

	public String getPerson_info_picture() {
		return person_info_picture;
	}

	public void setPerson_info_picture(String person_info_picture) {
		this.person_info_picture = person_info_picture;
	}

	public String getPerson_info_eng_name() {
		return person_info_eng_name;
	}

	public void setPerson_info_eng_name(String person_info_eng_name) {
		this.person_info_eng_name = person_info_eng_name;
	}

	public String getPerson_info_domes_forei_pop() {
		return person_info_domes_forei_pop;
	}

	public void setPerson_info_domes_forei_pop(String person_info_domes_forei_pop) {
		this.person_info_domes_forei_pop = person_info_domes_forei_pop;
	}

	public String getPerson_info_res_reg_num() {
		return person_info_res_reg_num;
	}

	public void setPerson_info_res_reg_num(String person_info_res_reg_num) {
		this.person_info_res_reg_num = person_info_res_reg_num;
	}

	public String getPerson_info_forei_reg_num() {
		return person_info_forei_reg_num;
	}

	public void setPerson_info_forei_reg_num(String person_info_forei_reg_num) {
		this.person_info_forei_reg_num = person_info_forei_reg_num;
	}

	public String getPerson_info_gender() {
		return person_info_gender;
	}

	public void setPerson_info_gender(String person_info_gender) {
		this.person_info_gender = person_info_gender;
	}

	public String getPerson_info_date_birth() {
		return person_info_date_birth;
	}

	public void setPerson_info_date_birth(String person_info_date_birth) {
		this.person_info_date_birth = person_info_date_birth;
	}

	public String getPerson_info_tel() {
		return person_info_tel;
	}

	public void setPerson_info_tel(String person_info_tel) {
		this.person_info_tel = person_info_tel;
	}

	public String getPerson_info_emerg_call() {
		return person_info_emerg_call;
	}

	public void setPerson_info_emerg_call(String person_info_emerg_call) {
		this.person_info_emerg_call = person_info_emerg_call;
	}

	public String getPerson_info_final_edu_code() {
		return person_info_final_edu_code;
	}

	public void setPerson_info_final_edu_code(String person_info_final_edu_code) {
		this.person_info_final_edu_code = person_info_final_edu_code;
	}

	public String getPerson_info_final_edu_name() {
		return person_info_final_edu_name;
	}

	public void setPerson_info_final_edu_name(String person_info_final_edu_name) {
		this.person_info_final_edu_name = person_info_final_edu_name;
	}

	public String getPerson_info_zip() {
		return person_info_zip;
	}

	public void setPerson_info_zip(String person_info_zip) {
		this.person_info_zip = person_info_zip;
	}

	public String getPerson_info_resi_reg_address() {
		return person_info_resi_reg_address;
	}

	public void setPerson_info_resi_reg_address(String person_info_resi_reg_address) {
		this.person_info_resi_reg_address = person_info_resi_reg_address;
	}

	public String getPerson_info_detail_address() {
		return person_info_detail_address;
	}

	public void setPerson_info_detail_address(String person_info_detail_address) {
		this.person_info_detail_address = person_info_detail_address;
	}

	public String getPerson_info_eng_address() {
		return person_info_eng_address;
	}

	public void setPerson_info_eng_address(String person_info_eng_address) {
		this.person_info_eng_address = person_info_eng_address;
	}

	public String getPerson_info_email() {
		return person_info_email;
	}

	public void setPerson_info_email(String person_info_email) {
		this.person_info_email = person_info_email;
	}

	public String getPerson_info_access_card_no() {
		return person_info_access_card_no;
	}

	public void setPerson_info_access_card_no(String person_info_access_card_no) {
		this.person_info_access_card_no = person_info_access_card_no;
	}

	public String getPerson_info_head_household() {
		return person_info_head_household;
	}

	public void setPerson_info_head_household(String person_info_head_household) {
		this.person_info_head_household = person_info_head_household;
	}

	public String getPerson_info_dis_classifi() {
		return person_info_dis_classifi;
	}

	public void setPerson_info_dis_classifi(String person_info_dis_classifi) {
		this.person_info_dis_classifi = person_info_dis_classifi;
	}

	public String getPerson_info_nation_mngement() {
		return person_info_nation_mngement;
	}

	public void setPerson_info_nation_mngement(String person_info_nation_mngement) {
		this.person_info_nation_mngement = person_info_nation_mngement;
	}

	public String getPerson_info_nation_report_cd() {
		return person_info_nation_report_cd;
	}

	public void setPerson_info_nation_report_cd(String person_info_nation_report_cd) {
		this.person_info_nation_report_cd = person_info_nation_report_cd;
	}

	public String getPerson_info_nation_report_nm() {
		return person_info_nation_report_nm;
	}

	public void setPerson_info_nation_report_nm(String person_info_nation_report_nm) {
		this.person_info_nation_report_nm = person_info_nation_report_nm;
	}

	public String getPerson_info_resident_classifi() {
		return person_info_resident_classifi;
	}

	public void setPerson_info_resident_classifi(String person_info_resident_classifi) {
		this.person_info_resident_classifi = person_info_resident_classifi;
	}

	public String getPerson_info_coun_resi_code() {
		return person_info_coun_resi_code;
	}

	public void setPerson_info_coun_resi_code(String person_info_coun_resi_code) {
		this.person_info_coun_resi_code = person_info_coun_resi_code;
	}

	public String getPerson_info_coun_resi_name() {
		return person_info_coun_resi_name;
	}

	public void setPerson_info_coun_resi_name(String person_info_coun_resi_name) {
		this.person_info_coun_resi_name = person_info_coun_resi_name;
	}

	public String getPk_sawon_code() {
		return pk_sawon_code;
	}

	public void setPk_sawon_code(String pk_sawon_code) {
		this.pk_sawon_code = pk_sawon_code;
	}

	public String getPerson_info_int_user_id() {
		return person_info_int_user_id;
	}

	public void setPerson_info_int_user_id(String person_info_int_user_id) {
		this.person_info_int_user_id = person_info_int_user_id;
	}

	public Timestamp getPerson_info_int_date() {
		return person_info_int_date;
	}

	public void setPerson_info_int_date(Timestamp person_info_int_date) {
		this.person_info_int_date = person_info_int_date;
	}

	public String getPerson_info_mod_user_id() {
		return person_info_mod_user_id;
	}

	public void setPerson_info_mod_user_id(String person_info_mod_user_id) {
		this.person_info_mod_user_id = person_info_mod_user_id;
	}

	public Timestamp getPerson_info_mod_date() {
		return person_info_mod_date;
	}

	public void setPerson_info_mod_date(Timestamp person_info_mod_date) {
		this.person_info_mod_date = person_info_mod_date;
	}

}