package hr.elect.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("signVO")
public class SignVO {
	private String PK_APPROVAL_NUM; // 결재번호
	private String APPROVAL_SSSTEP; // 결재단계
	private String APPROVAL_SSTYPE; // 결재종류
	private String APPROVAL_SSRESULT; // 결재결과
	private String APPROVAL_SSCOMMENT; // 코멘트(의견)
	private String APPROVAL_RECEIVE_DATE; // 받은일자
	private String APPROVAL_SIGN_DATE; // 결재일자
	private String APPROVAL_USER_POS, // 직위
				   FK_AD_NUM, // 전자결재문서번호
				   PK_AD_NUM, // updatesign위한 컬럼
				   FK_FILE_NUM, // 파일번호
				   PK_SAWON_CODE, // 사원코드
				   SAWON_NAME; // 사원이름
	
	// SignDocRead에서 photo 불러오기 위한 VO 
	private String photo; // 결재이미지
	
	/* 
     * 사진 
     */
    private MultipartFile photofile;
	
	public SignVO() {
		System.out.println("SignVO 생성");
	}

	public String getPK_APPROVAL_NUM() {
		return PK_APPROVAL_NUM;
	}

	public void setPK_APPROVAL_NUM(String pK_APPROVAL_NUM) {
		PK_APPROVAL_NUM = pK_APPROVAL_NUM;
	}

	public String getAPPROVAL_SSSTEP() {
		return APPROVAL_SSSTEP;
	}

	public void setAPPROVAL_SSSTEP(String aPPROVAL_SSSTEP) {
		APPROVAL_SSSTEP = aPPROVAL_SSSTEP;
	}

	public String getAPPROVAL_SSTYPE() {
		return APPROVAL_SSTYPE;
	}

	public void setAPPROVAL_SSTYPE(String aPPROVAL_SSTYPE) {
		APPROVAL_SSTYPE = aPPROVAL_SSTYPE;
	}

	public String getAPPROVAL_SSRESULT() {
		return APPROVAL_SSRESULT;
	}

	public void setAPPROVAL_SSRESULT(String aPPROVAL_SSRESULT) {
		APPROVAL_SSRESULT = aPPROVAL_SSRESULT;
	}

	public String getAPPROVAL_SSCOMMENT() {
		return APPROVAL_SSCOMMENT;
	}

	public void setAPPROVAL_SSCOMMENT(String aPPROVAL_SSCOMMENT) {
		APPROVAL_SSCOMMENT = aPPROVAL_SSCOMMENT;
	}

	public String getAPPROVAL_RECEIVE_DATE() {
		return APPROVAL_RECEIVE_DATE;
	}

	public void setAPPROVAL_RECEIVE_DATE(String aPPROVAL_RECEIVE_DATE) {
		APPROVAL_RECEIVE_DATE = aPPROVAL_RECEIVE_DATE;
	}

	public String getAPPROVAL_SIGN_DATE() {
		return APPROVAL_SIGN_DATE;
	}

	public void setAPPROVAL_SIGN_DATE(String aPPROVAL_SIGN_DATE) {
		APPROVAL_SIGN_DATE = aPPROVAL_SIGN_DATE;
	}

	public String getAPPROVAL_USER_POS() {
		return APPROVAL_USER_POS;
	}

	public void setAPPROVAL_USER_POS(String aPPROVAL_USER_POS) {
		APPROVAL_USER_POS = aPPROVAL_USER_POS;
	}

	public String getFK_AD_NUM() {
		return FK_AD_NUM;
	}

	public void setFK_AD_NUM(String fK_AD_NUM) {
		FK_AD_NUM = fK_AD_NUM;
	}

	public String getFK_FILE_NUM() {
		return FK_FILE_NUM;
	}

	public void setFK_FILE_NUM(String fK_FILE_NUM) {
		FK_FILE_NUM = fK_FILE_NUM;
	}

	public String getPK_SAWON_CODE() {
		return PK_SAWON_CODE;
	}

	public void setPK_SAWON_CODE(String pK_SAWON_CODE) {
		PK_SAWON_CODE = pK_SAWON_CODE;
	}

	public String getSAWON_NAME() {
		return SAWON_NAME;
	}

	public void setSAWON_NAME(String sAWON_NAME) {
		SAWON_NAME = sAWON_NAME;
	}

	public String getPK_AD_NUM() {
		return PK_AD_NUM;
	}

	public void setPK_AD_NUM(String pK_AD_NUM) {
		PK_AD_NUM = pK_AD_NUM;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public MultipartFile getPhotofile() {
		return photofile;
	}

	public void setPhotofile(MultipartFile photofile) {
		this.photofile = photofile;
	}
	
}
