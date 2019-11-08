package hr.human.p0001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("h_Com_codeVO")
public class Com_codeVO {
	private String classno;
	private String codecd;
	private String codenm;

	public Com_codeVO() {
		System.out.println("MemberVO ?깮?꽦?옄 ?샇異?");
	}

	public String getClassno() {
		return classno;
	}

	public void setClassno(String classno) {
		this.classno = classno;
	}

	public String getCodecd() {
		return codecd;
	}

	public void setCodecd(String codecd) {
		this.codecd = codecd;
	}

	public String getCodenm() {
		return codenm;
	}

	public void setCodenm(String codenm) {
		this.codenm = codenm;
	}



	
}
