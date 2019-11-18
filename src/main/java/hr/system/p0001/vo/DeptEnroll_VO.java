package hr.system.p0001.vo;

import java.security.Timestamp;
import java.sql.Date;

import javax.xml.crypto.Data;

import org.springframework.stereotype.Component;

import oracle.sql.DATE;

@Component("deptEnroll_VO")
public class DeptEnroll_VO {

	private String pk_dept_code; // 부서코드
	private String dept_name; // 부서 명
	private String workplace_code; // 사업장 코드
	private String workplace_name; // 사업장 명
	private String fk_sector_code; // 부문코드
	private String sector_name; // 부문 명
	private String dept_priodof; // 사용기간
	
	private String dept_int_user_id; // 입력자
	private Timestamp dept_int_date; // 입력일시
	private String dept_mod_user_id; // 수정자
	private Timestamp dept_mod_date; // 수정일시
	
	public DeptEnroll_VO() {
		System.out.println("DeptEnroll_VO 메서드 호출");
	}

	// 위의 선언 변수들의 GET, SET 정의 
	
	public String getPk_dept_code() {
		return pk_dept_code;
	}

	public void setPk_dept_code(String pk_dept_code) {
		this.pk_dept_code = pk_dept_code;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getworkplace_code() {
		return workplace_code;
	}

	public void setworkplace_code(String workplace_code) {
		this.workplace_code = workplace_code;
	}

	public String getWorkplace_name() {
		return workplace_name;
	}

	public void setWorkplace_name(String workplace_name) {
		this.workplace_name = workplace_name;
	}

	public String getFk_sector_code() {
		return fk_sector_code;
	}

	public void setFk_sector_code(String fk_sector_code) {
		this.fk_sector_code = fk_sector_code;
	}

	public String getSector_name() {
		return sector_name;
	}

	public void setSector_name(String sector_name) {
		this.sector_name = sector_name;
	}

	public String getDept_priodof() {
		return dept_priodof;
	}

	public void setDept_priodof(String dept_priodof) {
		this.dept_priodof = dept_priodof;
	}

	public String getDept_int_user_id() {
		return dept_int_user_id;
	}

	public void setDept_int_user_id(String dept_int_user_id) {
		this.dept_int_user_id = dept_int_user_id;
	}

	public Timestamp getDept_int_date() {
		return dept_int_date;
	}

	public void setDept_int_date(Timestamp dept_int_date) {
		this.dept_int_date = dept_int_date;
	}

	public String getDept_mod_user_id() {
		return dept_mod_user_id;
	}

	public void setDept_mod_user_id(String dept_mod_user_id) {
		this.dept_mod_user_id = dept_mod_user_id;
	}

	public Timestamp getDept_mod_date() {
		return dept_mod_date;
	}

	public void setDept_mod_date(Timestamp dept_mod_date) {
		this.dept_mod_date = dept_mod_date;
	}

}
