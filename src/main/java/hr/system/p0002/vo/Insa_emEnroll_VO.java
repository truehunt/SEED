package hr.system.p0002.vo;

import java.security.Timestamp;
import org.springframework.stereotype.Component;

@Component("insa_emEnroll_VO")
public class Insa_emEnroll_VO {
//인사정보등록-재직정보
	private String pk_em_info_uniq_num; // 재직정보 고유번호
	private String fk_sawon_code; // fk_사원코드
    private String em_info_join_date; // 입사일
    private String em_info_resi_date; // 퇴직일
    private String em_info_offi_division; // 재직구분
    private String em_info_date_retire; // 중도퇴사일
    private String em_info_prob_appli; // 수습적용
    private String em_info_prob_expi_date; // 수습만료일
    private String em_info_includ_work_peri; // 근속기간포함
    private String em_info_lea_absence_o; // 휴직기간 1
    private String em_info_lea_absence_t; // 휴직기간 2
    private String fk_dept_code; // 부서코드
    private String dept_name; // 부서이름
    private String em_info_emply_form_cd; // 고용형태 코드
    private String em_info_emply_form_nm; // 고용형태 명
    private String fk_occupation_code; // 직종 코드
    private String occupation_name; // 직종 명
    private String fk_pay_form_code; // 급여형태 코드
    private String pay_form_name; // 급여형태 명
    private String em_info_project_code; // 프로젝트 코드
    private String em_info_project_name; // 프로젝트 명
    private String em_info_work_group_cd; // 근무조 코드
    private String em_info_work_group_nm; // 근무조 명
    private String fk_rank_code; // 직급 코드
    private String rank_name; // 직급 명
    private String em_info_position_code; // 직책 코드
    private String em_info_position_name; // 직책 명
    private String em_info_duty_code; // 직무 코드
    private String em_info_duty_name; // 직무 명
    private String em_info_classifi_code; // 분류 코드
    private String em_info_classifi_name; // 분류코드 명
    private String em_info_retire_reason_code; // 퇴직사유 코드
    private String em_info_retire_reason_name; // 퇴직사유 명
    private String em_info_attri; // 귀속연월
    private String pk_sawon_code; // 조건 위한 사원 코드
    private String pk_dept_code; // 조건 위한 부서 코드

	private String em_info_int_user_id; // 입력자
    private Timestamp em_info_int_date; // 입력일시
    private String em_info_mod_user_id; // 수정자
    private Timestamp em_info_mod_date; // 수정일시

	public Insa_emEnroll_VO() {
		System.out.println("Insa_emEnroll_VO 생성");
	}

	// 위의 선언 변수들의 GET, SET 정의 
	
	public String getPk_em_info_uniq_num() {
		return pk_em_info_uniq_num;
	}

	public void setPk_em_info_uniq_num(String pk_em_info_uniq_num) {
		this.pk_em_info_uniq_num = pk_em_info_uniq_num;
	}

	public String getFk_sawon_code() {
		return fk_sawon_code;
	}

	public void setFk_sawon_code(String fk_sawon_code) {
		this.fk_sawon_code = fk_sawon_code;
	}

	public String getEm_info_join_date() {
		return em_info_join_date;
	}

	public void setEm_info_join_date(String em_info_join_date) {
		this.em_info_join_date = em_info_join_date;
	}

	public String getEm_info_resi_date() {
		return em_info_resi_date;
	}

	public void setEm_info_resi_date(String em_info_resi_date) {
		this.em_info_resi_date = em_info_resi_date;
	}

	public String getEm_info_offi_division() {
		return em_info_offi_division;
	}

	public void setEm_info_offi_division(String em_info_offi_division) {
		this.em_info_offi_division = em_info_offi_division;
	}

	public String getEm_info_date_retire() {
		return em_info_date_retire;
	}

	public void setEm_info_date_retire(String em_info_date_retire) {
		this.em_info_date_retire = em_info_date_retire;
	}

	public String getEm_info_prob_appli() {
		return em_info_prob_appli;
	}

	public void setEm_info_prob_appli(String em_info_prob_appli) {
		this.em_info_prob_appli = em_info_prob_appli;
	}
	
	public String getEm_info_prob_expi_date() {
		return em_info_prob_expi_date;
	}

	public void setEm_info_prob_expi_date(String em_info_prob_expi_date) {
		this.em_info_prob_expi_date = em_info_prob_expi_date;
	}

	public String getEm_info_includ_work_peri() {
		return em_info_includ_work_peri;
	}

	public void setEm_info_includ_work_peri(String em_info_includ_work_peri) {
		this.em_info_includ_work_peri = em_info_includ_work_peri;
	}

	public String getEm_info_lea_absence_o() {
		return em_info_lea_absence_o;
	}

	public void setEm_info_lea_absence_o(String em_info_lea_absence_o) {
		this.em_info_lea_absence_o = em_info_lea_absence_o;
	}

	public String getEm_info_lea_absence_t() {
		return em_info_lea_absence_t;
	}

	public void setEm_info_lea_absence_t(String em_info_lea_absence_t) {
		this.em_info_lea_absence_t = em_info_lea_absence_t;
	}

	public String getFk_dept_code() {
		return fk_dept_code;
	}

	public void setFk_dept_code(String fk_dept_code) {
		this.fk_dept_code = fk_dept_code;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getEm_info_emply_form_cd() {
		return em_info_emply_form_cd;
	}

	public void setEm_info_emply_form_cd(String em_info_emply_form_cd) {
		this.em_info_emply_form_cd = em_info_emply_form_cd;
	}

	public String getEm_info_emply_form_nm() {
		return em_info_emply_form_nm;
	}

	public void setEm_info_emply_form_nm(String em_info_emply_form_nm) {
		this.em_info_emply_form_nm = em_info_emply_form_nm;
	}

	public String getFk_occupation_code() {
		return fk_occupation_code;
	}

	public void setFk_occupation_code(String fk_occupation_code) {
		this.fk_occupation_code = fk_occupation_code;
	}

	public String getOccupation_name() {
		return occupation_name;
	}

	public void setOccupation_name(String occupation_name) {
		this.occupation_name = occupation_name;
	}

	public String getFk_pay_form_code() {
		return fk_pay_form_code;
	}

	public void setFk_pay_form_code(String fk_pay_form_code) {
		this.fk_pay_form_code = fk_pay_form_code;
	}

	public String getPay_form_name() {
		return pay_form_name;
	}

	public void setPay_form_name(String pay_form_name) {
		this.pay_form_name = pay_form_name;
	}

	public String getEm_info_project_code() {
		return em_info_project_code;
	}

	public void setEm_info_project_code(String em_info_project_code) {
		this.em_info_project_code = em_info_project_code;
	}

	public String getEm_info_project_name() {
		return em_info_project_name;
	}

	public void setEm_info_project_name(String em_info_project_name) {
		this.em_info_project_name = em_info_project_name;
	}

	public String getEm_info_work_group_cd() {
		return em_info_work_group_cd;
	}

	public void setEm_info_work_group_cd(String em_info_work_group_cd) {
		this.em_info_work_group_cd = em_info_work_group_cd;
	}

	public String getEm_info_work_group_nm() {
		return em_info_work_group_nm;
	}

	public void setEm_info_work_group_nm(String em_info_work_group_nm) {
		this.em_info_work_group_nm = em_info_work_group_nm;
	}

	public String getFk_rank_code() {
		return fk_rank_code;
	}

	public void setFk_rank_code(String fk_rank_code) {
		this.fk_rank_code = fk_rank_code;
	}

	public String getRank_name() {
		return rank_name;
	}

	public void setRank_name(String rank_name) {
		this.rank_name = rank_name;
	}

	public String getEm_info_position_code() {
		return em_info_position_code;
	}

	public void setEm_info_position_code(String em_info_position_code) {
		this.em_info_position_code = em_info_position_code;
	}

	public String getEm_info_position_name() {
		return em_info_position_name;
	}

	public void setEm_info_position_name(String em_info_position_name) {
		this.em_info_position_name = em_info_position_name;
	}

	public String getEm_info_duty_code() {
		return em_info_duty_code;
	}

	public void setEm_info_duty_code(String em_info_duty_code) {
		this.em_info_duty_code = em_info_duty_code;
	}

	public String getEm_info_duty_name() {
		return em_info_duty_name;
	}

	public void setEm_info_duty_name(String em_info_duty_name) {
		this.em_info_duty_name = em_info_duty_name;
	}

	public String getEm_info_classifi_code() {
		return em_info_classifi_code;
	}

	public void setEm_info_classifi_code(String em_info_classifi_code) {
		this.em_info_classifi_code = em_info_classifi_code;
	}

	public String getEm_info_classifi_name() {
		return em_info_classifi_name;
	}

	public void setEm_info_classifi_name(String em_info_classifi_name) {
		this.em_info_classifi_name = em_info_classifi_name;
	}

	public String getEm_info_retire_reason_code() {
		return em_info_retire_reason_code;
	}

	public void setEm_info_retire_reason_code(String em_info_retire_reason_code) {
		this.em_info_retire_reason_code = em_info_retire_reason_code;
	}

	public String getEm_info_retire_reason_name() {
		return em_info_retire_reason_name;
	}

	public void setEm_info_retire_reason_name(String em_info_retire_reason_name) {
		this.em_info_retire_reason_name = em_info_retire_reason_name;
	}

	public String getEm_info_attri() {
		return em_info_attri;
	}

	public void setEm_info_attri(String em_info_attri) {
		this.em_info_attri = em_info_attri;
	}

	public String getPk_sawon_code() {
		return pk_sawon_code;
	}

	public void setPk_sawon_code(String pk_sawon_code) {
		this.pk_sawon_code = pk_sawon_code;
	}

    public String getPk_dept_code() {
		return pk_dept_code;
	}

	public void setPk_dept_code(String pk_dept_code) {
		this.pk_dept_code = pk_dept_code;
	}

	public String getEm_info_int_user_id() {
		return em_info_int_user_id;
	}

	public void setEm_info_int_user_id(String em_info_int_user_id) {
		this.em_info_int_user_id = em_info_int_user_id;
	}

	public Timestamp getEm_info_int_date() {
		return em_info_int_date;
	}

	public void setEm_info_int_date(Timestamp em_info_int_date) {
		this.em_info_int_date = em_info_int_date;
	}

	public String getEm_info_mod_user_id() {
		return em_info_mod_user_id;
	}

	public void setEm_info_mod_user_id(String em_info_mod_user_id) {
		this.em_info_mod_user_id = em_info_mod_user_id;
	}

	public Timestamp getEm_info_mod_date() {
		return em_info_mod_date;
	}

	public void setEm_info_mod_date(Timestamp em_info_mod_date) {
		this.em_info_mod_date = em_info_mod_date;
	}



}