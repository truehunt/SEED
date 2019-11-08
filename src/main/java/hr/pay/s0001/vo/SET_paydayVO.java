package hr.pay.s0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("SET_paydayVO")
public class SET_paydayVO {
	private String pk_D_B_PAYMENT_SEQ_CODE;
	private String d_B_PAYMENT_DT;
	private String d_B_PAYMENT_SIMULTANE_ISSUE;
	private String d_B_PAYMENT_TARGET_SELECT;
	
	private String fk_D_B_PAYMENT_SEQ_CODE;
	private String pk_PAY_BEN_C_UNIQUE_NUM;
	private String pay_BEN_C_RECRUIT_METHOD;
	private String pay_BEN_C_DATE_RECRUIT;
	private String pay_BEN_C_RETIRE_BEN_METHOD;
	private String pay_BEN_C_DATE_RESIG;
	
	public SET_paydayVO() {
		System.out.println("MemberVO �뜝�럡臾멨뜝�럡�뎽�뜝�럩�겱 �뜝�럩源덌옙鍮듿뜝占�");
	}

	public String getPk_D_B_PAYMENT_SEQ_CODE() {
		return pk_D_B_PAYMENT_SEQ_CODE;
	}

	public void setPk_D_B_PAYMENT_SEQ_CODE(String pk_D_B_PAYMENT_SEQ_CODE) {
		this.pk_D_B_PAYMENT_SEQ_CODE = pk_D_B_PAYMENT_SEQ_CODE;
	}

	public String getD_B_PAYMENT_DT() {
		return d_B_PAYMENT_DT;
	}

	public void setD_B_PAYMENT_DT(String d_B_PAYMENT_DT) {
		this.d_B_PAYMENT_DT = d_B_PAYMENT_DT;
	}

	public String getD_B_PAYMENT_SIMULTANE_ISSUE() {
		return d_B_PAYMENT_SIMULTANE_ISSUE;
	}

	public void setD_B_PAYMENT_SIMULTANE_ISSUE(String d_B_PAYMENT_SIMULTANE_ISSUE) {
		this.d_B_PAYMENT_SIMULTANE_ISSUE = d_B_PAYMENT_SIMULTANE_ISSUE;
	}

	public String getD_B_PAYMENT_TARGET_SELECT() {
		return d_B_PAYMENT_TARGET_SELECT;
	}

	public void setD_B_PAYMENT_TARGET_SELECT(String d_B_PAYMENT_TARGET_SELECT) {
		this.d_B_PAYMENT_TARGET_SELECT = d_B_PAYMENT_TARGET_SELECT;
	}

	public String getFk_D_B_PAYMENT_SEQ_CODE() {
		return fk_D_B_PAYMENT_SEQ_CODE;
	}

	public void setFk_D_B_PAYMENT_SEQ_CODE(String fk_D_B_PAYMENT_SEQ_CODE) {
		this.fk_D_B_PAYMENT_SEQ_CODE = fk_D_B_PAYMENT_SEQ_CODE;
	}

	public String getPk_PAY_BEN_C_UNIQUE_NUM() {
		return pk_PAY_BEN_C_UNIQUE_NUM;
	}

	public void setPk_PAY_BEN_C_UNIQUE_NUM(String pk_PAY_BEN_C_UNIQUE_NUM) {
		this.pk_PAY_BEN_C_UNIQUE_NUM = pk_PAY_BEN_C_UNIQUE_NUM;
	}

	public String getPay_BEN_C_RECRUIT_METHOD() {
		return pay_BEN_C_RECRUIT_METHOD;
	}

	public void setPay_BEN_C_RECRUIT_METHOD(String pay_BEN_C_RECRUIT_METHOD) {
		this.pay_BEN_C_RECRUIT_METHOD = pay_BEN_C_RECRUIT_METHOD;
	}

	public String getPay_BEN_C_DATE_RECRUIT() {
		return pay_BEN_C_DATE_RECRUIT;
	}

	public void setPay_BEN_C_DATE_RECRUIT(String pay_BEN_C_DATE_RECRUIT) {
		this.pay_BEN_C_DATE_RECRUIT = pay_BEN_C_DATE_RECRUIT;
	}

	public String getPay_BEN_C_RETIRE_BEN_METHOD() {
		return pay_BEN_C_RETIRE_BEN_METHOD;
	}

	public void setPay_BEN_C_RETIRE_BEN_METHOD(String pay_BEN_C_RETIRE_BEN_METHOD) {
		this.pay_BEN_C_RETIRE_BEN_METHOD = pay_BEN_C_RETIRE_BEN_METHOD;
	}

	public String getPay_BEN_C_DATE_RESIG() {
		return pay_BEN_C_DATE_RESIG;
	}

	public void setPay_BEN_C_DATE_RESIG(String pay_BEN_C_DATE_RESIG) {
		this.pay_BEN_C_DATE_RESIG = pay_BEN_C_DATE_RESIG;
	}


	

	


	
	

	
}
