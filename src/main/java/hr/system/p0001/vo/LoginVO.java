package hr.system.p0001.vo;

import org.springframework.stereotype.Component;

@Component("loginVO")
public class LoginVO {
    private String PK_SAWON_CODE;
    private String SAWON_PASSWORD;
    private String remember;


    public String getPK_SAWON_CODE() {
		return PK_SAWON_CODE;
	}

	public void setPK_SAWON_CODE(String pK_SAWON_CODE) {
		PK_SAWON_CODE = pK_SAWON_CODE;
	}

	public String getSAWON_PASSWORD() {
		return SAWON_PASSWORD;
	}

	public void setSAWON_PASSWORD(String sAWON_PASSWORD) {
		SAWON_PASSWORD = sAWON_PASSWORD;
	}

	public String getRemember() {
        return remember;
    }
    
    public void setRemember(String remember) {
        this.remember = remember;
    }

}
