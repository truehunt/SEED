package hr.system.p0002.vo;

import java.security.Timestamp;
import org.springframework.stereotype.Component;

@Component("insa_popup_VO")
public class Insa_popup_VO {
//인사정보등록-팝업 관련 VO
	//공통 코드
	private String pk_person_bc_detai_code_num;	// 상세코드번호
	private String person_bc_detai_mngement_name; // 관리내역명
	private String fk_person_bc_code_num; // 코드번호 (조건) - 호봉이랑 같이 씀
	
	//부서
	private String pk_dept_code; // 부서코드
	private String fk_dept_code; // 부서코드 (조건)
	private String dept_name; // 부서 명
	
	//호봉
	private String fk_hobong_code; // 호봉 코드(몇 호봉)
	private String hobong_table_price; // 호봉 금액
	private String fk_hobong_code_cla_code; // 호봉구분코드(공통코드부분에서..)
	private String fk_rank_code; // 직급 코드
	private String hobong_table_start_date_appli; // 적용시작연월일
	private String hobong_table_end_date_appli; // 적용종료연월일
	
	public Insa_popup_VO() {
		System.out.println("Insa_emEnroll_VO 생성");
	}

	// 위의 선언 변수들의 GET, SET 정의 
	// 공통 팝업
	public String getPk_person_bc_detai_code_num() {
		return pk_person_bc_detai_code_num;
	}

	public void setPk_person_bc_detai_code_num(String pk_person_bc_detai_code_num) {
		this.pk_person_bc_detai_code_num = pk_person_bc_detai_code_num;
	}

	public String getPerson_bc_detai_mngement_name() {
		return person_bc_detai_mngement_name;
	}

	public void setPerson_bc_detai_mngement_name(String person_bc_detai_mngement_name) {
		this.person_bc_detai_mngement_name = person_bc_detai_mngement_name;
	}

	public String getFk_person_bc_code_num() {
		return fk_person_bc_code_num;
	}

	public void setFk_person_bc_code_num(String fk_person_bc_code_num) {
		this.fk_person_bc_code_num = fk_person_bc_code_num;
	}
	
	// 부서
	public String getPk_dept_code() {
		return pk_dept_code;
	}

	public void setPk_dept_code(String pk_dept_code) {
		this.pk_dept_code = pk_dept_code;
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
	
	// 호봉
	public String getFk_hobong_code() {
		return fk_hobong_code;
	}

	public void setFk_hobong_code(String fk_hobong_code) {
		this.fk_hobong_code = fk_hobong_code;
	}

	public String getHobong_table_price() {
		return hobong_table_price;
	}

	public void setHobong_table_price(String hobong_table_price) {
		this.hobong_table_price = hobong_table_price;
	}

	public String getFk_hobong_code_cla_code() {
		return fk_hobong_code_cla_code;
	}

	public void setFk_hobong_code_cla_code(String fk_hobong_code_cla_code) {
		this.fk_hobong_code_cla_code = fk_hobong_code_cla_code;
	}

	public String getFk_rank_code() {
		return fk_rank_code;
	}

	public void setFk_rank_code(String fk_rank_code) {
		this.fk_rank_code = fk_rank_code;
	}

	public String getHobong_table_start_date_appli() {
		return hobong_table_start_date_appli;
	}

	public void setHobong_table_start_date_appli(String hobong_table_start_date_appli) {
		this.hobong_table_start_date_appli = hobong_table_start_date_appli;
	}

	public String getHobong_table_end_date_appli() {
		return hobong_table_end_date_appli;
	}

	public void setHobong_table_end_date_appli(String hobong_table_end_date_appli) {
		this.hobong_table_end_date_appli = hobong_table_end_date_appli;
	}

}