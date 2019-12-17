package hr.system.p0002.vo;

import java.security.Timestamp;
import org.springframework.stereotype.Component;

@Component("insa_popup_VO")
public class Insa_popup_VO {
//인사정보등록-팝업 관련 VO
	//공통 코드
	private String pk_person_bc_detai_code_num;	// 상세코드번호
	private String person_bc_detai_mngement_name; // 관리내역명
	private String fk_person_bc_code_num; // 코드번호 (조건)
	
	//부서
	private String pk_dept_code; // 부서코드
	private String fk_dept_code; // 부서코드 (조건)
	private String dept_name; // 부서 명
	
	//호봉
	
	
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
}