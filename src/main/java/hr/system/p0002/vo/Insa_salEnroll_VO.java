package hr.system.p0002.vo;

import java.security.Timestamp;
import org.springframework.stereotype.Component;

@Component("insa_salEnroll_VO")
public class Insa_salEnroll_VO {
//인사정보등록-급여정보
	private String pk_sal_info_unique_num; // 급여정보 고유정보
	private String fk_sawon_code; // fk_사원 코드
	private String fk_hobong_code; // fk_호봉코드
	private String sal_info_acc_type_code; // 계정유형 코드
	private String sal_info_acc_type_name; // 계정유형 명
	private String sal_info_trans_amount_o_code; // 급여 이체은행코드1
	private String sal_info_trans_amount_o; // 급여 이체은행1
	private String sal_info_acc_num_one; // 계좌 번호1
	private String sal_info_acc_hold_one; // 예금주1
	private String sal_info_trans_amount_t_code; // 급여 이체은행코드2
	private String sal_info_trans_amount_t; // 급여 이체은행2
	private String sal_info_acc_num_two; // 계좌 번호2
	private String sal_info_acc_hold_two; // 예금주2
	private String sal_info_spouse_ded; // 배우자 공제
	private String sal_info_deduction; // 부녀자 공제
	private String sal_info_under_age_twen; // 20세 이하
	private String sal_info_depend_60years_older; // 부양 60세 이상
	private String sal_info_disabled_person; // 장애인
	private String sal_info_reci_foster_child; // 수급자/위탁아동
	private String sal_info_multi_child_ded; // 다자녀 추가 공제
	private String pk_sawon_code; // 조건 위한 사원코드

	private String sal_info_int_user_id; // 입력자
	private Timestamp sal_info_int_date; // 입력일시
	private String sal_info_mod_user_id; // 수정자
	private Timestamp sal_info_mod_date; // 수정일시	
	
	public Insa_salEnroll_VO() {
		System.out.println("Insa_salEnroll_VO 생성");
	}

	// 위의 선언 변수들의 GET, SET 정의 
	
	public String getPk_sal_info_unique_num() {
		return pk_sal_info_unique_num;
	}

	public void setPk_sal_info_unique_num(String pk_sal_info_unique_num) {
		this.pk_sal_info_unique_num = pk_sal_info_unique_num;
	}

	public String getFk_sawon_code() {
		return fk_sawon_code;
	}

	public void setFk_sawon_code(String fk_sawon_code) {
		this.fk_sawon_code = fk_sawon_code;
	}

	public String getFk_hobong_code() {
		return fk_hobong_code;
	}

	public void setFk_hobong_code(String fk_hobong_code) {
		this.fk_hobong_code = fk_hobong_code;
	}

	public String getSal_info_acc_type_code() {
		return sal_info_acc_type_code;
	}

	public void setSal_info_acc_type_code(String sal_info_acc_type_code) {
		this.sal_info_acc_type_code = sal_info_acc_type_code;
	}

	public String getSal_info_acc_type_name() {
		return sal_info_acc_type_name;
	}

	public void setSal_info_acc_type_name(String sal_info_acc_type_name) {
		this.sal_info_acc_type_name = sal_info_acc_type_name;
	}

	public String getSal_info_trans_amount_o_code() {
		return sal_info_trans_amount_o_code;
	}

	public void setSal_info_trans_amount_o_code(String sal_info_trans_amount_o_code) {
		this.sal_info_trans_amount_o_code = sal_info_trans_amount_o_code;
	}

	public String getSal_info_trans_amount_o() {
		return sal_info_trans_amount_o;
	}

	public void setSal_info_trans_amount_o(String sal_info_trans_amount_o) {
		this.sal_info_trans_amount_o = sal_info_trans_amount_o;
	}

	public String getSal_info_acc_num_one() {
		return sal_info_acc_num_one;
	}

	public void setSal_info_acc_num_one(String sal_info_acc_num_one) {
		this.sal_info_acc_num_one = sal_info_acc_num_one;
	}

	public String getSal_info_acc_hold_one() {
		return sal_info_acc_hold_one;
	}

	public void setSal_info_acc_hold_one(String sal_info_acc_hold_one) {
		this.sal_info_acc_hold_one = sal_info_acc_hold_one;
	}

	public String getSal_info_trans_amount_t_code() {
		return sal_info_trans_amount_t_code;
	}

	public void setSal_info_trans_amount_t_code(String sal_info_trans_amount_t_code) {
		this.sal_info_trans_amount_t_code = sal_info_trans_amount_t_code;
	}

	public String getSal_info_trans_amount_t() {
		return sal_info_trans_amount_t;
	}

	public void setSal_info_trans_amount_t(String sal_info_trans_amount_t) {
		this.sal_info_trans_amount_t = sal_info_trans_amount_t;
	}

	public String getSal_info_acc_num_two() {
		return sal_info_acc_num_two;
	}

	public void setSal_info_acc_num_two(String sal_info_acc_num_two) {
		this.sal_info_acc_num_two = sal_info_acc_num_two;
	}

	public String getSal_info_acc_hold_two() {
		return sal_info_acc_hold_two;
	}

	public void setSal_info_acc_hold_two(String sal_info_acc_hold_two) {
		this.sal_info_acc_hold_two = sal_info_acc_hold_two;
	}

	public String getSal_info_spouse_ded() {
		return sal_info_spouse_ded;
	}

	public void setSal_info_spouse_ded(String sal_info_spouse_ded) {
		this.sal_info_spouse_ded = sal_info_spouse_ded;
	}

	public String getSal_info_deduction() {
		return sal_info_deduction;
	}

	public void setSal_info_deduction(String sal_info_deduction) {
		this.sal_info_deduction = sal_info_deduction;
	}

	public String getSal_info_under_age_twen() {
		return sal_info_under_age_twen;
	}

	public void setSal_info_under_age_twen(String sal_info_under_age_twen) {
		this.sal_info_under_age_twen = sal_info_under_age_twen;
	}

	public String getSal_info_depend_60years_older() {
		return sal_info_depend_60years_older;
	}

	public void setSal_info_depend_60years_older(String sal_info_depend_60years_older) {
		this.sal_info_depend_60years_older = sal_info_depend_60years_older;
	}

	public String getSal_info_disabled_person() {
		return sal_info_disabled_person;
	}

	public void setSal_info_disabled_person(String sal_info_disabled_person) {
		this.sal_info_disabled_person = sal_info_disabled_person;
	}

	public String getSal_info_reci_foster_child() {
		return sal_info_reci_foster_child;
	}

	public void setSal_info_reci_foster_child(String sal_info_reci_foster_child) {
		this.sal_info_reci_foster_child = sal_info_reci_foster_child;
	}

	public String getSal_info_multi_child_ded() {
		return sal_info_multi_child_ded;
	}

	public void setSal_info_multi_child_ded(String sal_info_multi_child_ded) {
		this.sal_info_multi_child_ded = sal_info_multi_child_ded;
	}

	public String getPk_sawon_code() {
		return pk_sawon_code;
	}

	public void setPk_sawon_code(String pk_sawon_code) {
		this.pk_sawon_code = pk_sawon_code;
	}

	public String getSal_info_int_user_id() {
		return sal_info_int_user_id;
	}

	public void setSal_info_int_user_id(String sal_info_int_user_id) {
		this.sal_info_int_user_id = sal_info_int_user_id;
	}

	public Timestamp getSal_info_int_date() {
		return sal_info_int_date;
	}

	public void setSal_info_int_date(Timestamp sal_info_int_date) {
		this.sal_info_int_date = sal_info_int_date;
	}

	public String getSal_info_mod_user_id() {
		return sal_info_mod_user_id;
	}

	public void setSal_info_mod_user_id(String sal_info_mod_user_id) {
		this.sal_info_mod_user_id = sal_info_mod_user_id;
	}

	public Timestamp getSal_info_mod_date() {
		return sal_info_mod_date;
	}

	public void setSal_info_mod_date(Timestamp sal_info_mod_date) {
		this.sal_info_mod_date = sal_info_mod_date;
	}

}