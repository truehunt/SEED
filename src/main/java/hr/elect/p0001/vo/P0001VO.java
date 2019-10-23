package hr.elect.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("p0001VO")
public class P0001VO {
	private String cust_id;
	private String cust_name;
	private String cust_address;
	private String cust_state;
	private String cust_zip;
	private String cust_country;
	private String cust_contact;
	private String cust_email;
	
	public P0001VO() {
		System.out.println("MemberVO �깮�꽦�옄 �샇異�");
	}

	public String getCust_id() {
		return cust_id;
	}

	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}

	public String getCust_name() {
		return cust_name;
	}

	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}

	public String getCust_address() {
		return cust_address;
	}

	public void setCust_address(String cust_address) {
		this.cust_address = cust_address;
	}

	public String getCust_state() {
		return cust_state;
	}

	public void setCust_state(String cust_state) {
		this.cust_state = cust_state;
	}

	public String getCust_zip() {
		return cust_zip;
	}

	public void setCust_zip(String cust_zip) {
		this.cust_zip = cust_zip;
	}

	public String getCust_country() {
		return cust_country;
	}

	public void setCust_country(String cust_country) {
		this.cust_country = cust_country;
	}

	public String getCust_contact() {
		return cust_contact;
	}

	public void setCust_contact(String cust_contact) {
		this.cust_contact = cust_contact;
	}

	public String getCust_email() {
		return cust_email;
	}

	public void setCust_email(String cust_email) {
		this.cust_email = cust_email;
	}

	
}
