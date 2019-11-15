package hr.elect.p0002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("signImageVO")
public class SignImageVO {
	private String IMAGENO; // 이미지번호
	private String PK_SAWON_CODE; // 사원코드
	private String photo; // 결재이미지
	private String INT_USER_ID; // 입력자
	private String INT_DATE; // 입력일시
	private String MOD_USER_ID, // 수정자
				   MOD_DATE, // 수정일시
				   DELETEFLAG; // 삭제여부
	
	/* 
     * 사진 
     */
    private MultipartFile photofile;
	
	public SignImageVO() {
		System.out.println("SignImageVO 생성");
	}

	public String getIMAGENO() {
		return IMAGENO;
	}

	public void setIMAGENO(String iMAGENO) {
		IMAGENO = iMAGENO;
	}

	public String getPK_SAWON_CODE() {
		return PK_SAWON_CODE;
	}

	public void setPK_SAWON_CODE(String pK_SAWON_CODE) {
		PK_SAWON_CODE = pK_SAWON_CODE;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getINT_USER_ID() {
		return INT_USER_ID;
	}

	public void setINT_USER_ID(String iNT_USER_ID) {
		INT_USER_ID = iNT_USER_ID;
	}

	public String getINT_DATE() {
		return INT_DATE;
	}

	public void setINT_DATE(String iNT_DATE) {
		INT_DATE = iNT_DATE;
	}

	public String getMOD_USER_ID() {
		return MOD_USER_ID;
	}

	public void setMOD_USER_ID(String mOD_USER_ID) {
		MOD_USER_ID = mOD_USER_ID;
	}

	public String getMOD_DATE() {
		return MOD_DATE;
	}

	public void setMOD_DATE(String mOD_DATE) {
		MOD_DATE = mOD_DATE;
	}

	public String getDELETEFLAG() {
		return DELETEFLAG;
	}

	public void setDELETEFLAG(String dELETEFLAG) {
		DELETEFLAG = dELETEFLAG;
	}

	public MultipartFile getPhotofile() {
		return photofile;
	}

	public void setPhotofile(MultipartFile photofile) {
		this.photofile = photofile;
	}
	
}
