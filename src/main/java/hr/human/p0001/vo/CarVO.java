package hr.human.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("h_CarVO")
public class CarVO {
	private String pk_CAR_CODE;
	private String fk_CAR_SAWON_CODE;
	private String car_NAME;
	private String car_STA_DATE;
	private String car_END_DATE;
	private String car_DATE;
	private String car_DANDANG;
	private String car_POSITION;
	private String car_SALARY;
	private String car_RESIGN;
	private String car_GEUNSOG_CODE;
	private String car_INT_USER_ID;
	private String car_INT_DATE;
	private String car_MOD_USER_ID;
	private String car_MOD_DATE;
	
	public CarVO() {
		System.out.println("CarVO 생성");
	}

	public String getPk_CAR_CODE() {
		return pk_CAR_CODE;
	}

	public void setPk_CAR_CODE(String pk_CAR_CODE) {
		this.pk_CAR_CODE = pk_CAR_CODE;
	}

	public String getFk_CAR_SAWON_CODE() {
		return fk_CAR_SAWON_CODE;
	}

	public void setFk_CAR_SAWON_CODE(String fk_CAR_SAWON_CODE) {
		this.fk_CAR_SAWON_CODE = fk_CAR_SAWON_CODE;
	}

	public String getCar_NAME() {
		return car_NAME;
	}

	public void setCar_NAME(String car_NAME) {
		this.car_NAME = car_NAME;
	}

	public String getCar_STA_DATE() {
		return car_STA_DATE;
	}

	public void setCar_STA_DATE(String car_STA_DATE) {
		this.car_STA_DATE = car_STA_DATE;
	}

	public String getCar_END_DATE() {
		return car_END_DATE;
	}

	public void setCar_END_DATE(String car_END_DATE) {
		this.car_END_DATE = car_END_DATE;
	}

	public String getCar_DATE() {
		return car_DATE;
	}

	public void setCar_DATE(String car_DATE) {
		this.car_DATE = car_DATE;
	}

	public String getCar_DANDANG() {
		return car_DANDANG;
	}

	public void setCar_DANDANG(String car_DANDANG) {
		this.car_DANDANG = car_DANDANG;
	}

	public String getCar_POSITION() {
		return car_POSITION;
	}

	public void setCar_POSITION(String car_POSITION) {
		this.car_POSITION = car_POSITION;
	}

	public String getCar_SALARY() {
		return car_SALARY;
	}

	public void setCar_SALARY(String car_SALARY) {
		this.car_SALARY = car_SALARY;
	}

	public String getCar_RESIGN() {
		return car_RESIGN;
	}

	public void setCar_RESIGN(String car_RESIGN) {
		this.car_RESIGN = car_RESIGN;
	}

	public String getCar_GEUNSOG_CODE() {
		return car_GEUNSOG_CODE;
	}

	public void setCar_GEUNSOG_CODE(String car_GEUNSOG_CODE) {
		this.car_GEUNSOG_CODE = car_GEUNSOG_CODE;
	}

	public String getCar_INT_USER_ID() {
		return car_INT_USER_ID;
	}

	public void setCar_INT_USER_ID(String car_INT_USER_ID) {
		this.car_INT_USER_ID = car_INT_USER_ID;
	}

	public String getCar_INT_DATE() {
		return car_INT_DATE;
	}

	public void setCar_INT_DATE(String car_INT_DATE) {
		this.car_INT_DATE = car_INT_DATE;
	}

	public String getCar_MOD_USER_ID() {
		return car_MOD_USER_ID;
	}

	public void setCar_MOD_USER_ID(String car_MOD_USER_ID) {
		this.car_MOD_USER_ID = car_MOD_USER_ID;
	}

	public String getCar_MOD_DATE() {
		return car_MOD_DATE;
	}

	public void setCar_MOD_DATE(String car_MOD_DATE) {
		this.car_MOD_DATE = car_MOD_DATE;
	}
	
	
}	
