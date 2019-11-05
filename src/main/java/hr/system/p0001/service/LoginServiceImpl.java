package hr.system.p0001.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hr.system.p0001.vo.SawonVO;
import hr.system.p0001.vo.LoginVO;


@Service("LoginService")
@Transactional(propagation = Propagation.REQUIRED)
public class LoginServiceImpl implements LoginService {
	@Autowired
	private SqlSession sqlSession;
	
	public SawonVO selectMember4Login(LoginVO param) {
        return sqlSession.selectOne("selectMember4Login", param);
    }
    
    public void insertLogIn(String param) {
        sqlSession.insert("insertLogIn", param);
    }

    public void insertLogOut(String param) {
        sqlSession.insert("insertLogOut", param);
    }
    
    public SawonVO find_by_Email(SawonVO sawonVO) {
    	return sqlSession.selectOne("find_by_Email", sawonVO);
    }
    
    // 이메일 발송
 	@Override
 	public void send_mail(SawonVO member, String div) throws Exception {
 		// Mail Server 설정
 		String charSet = "utf-8";
 		String hostSMTP = "smtp.gmail.com";
 		String hostSMTPid = "truehunt88@gmail.com";
 		String hostSMTPpwd = "bbgkmesdmzlsehqf";

 		// 보내는 사람 EMail, 제목, 내용
 		String fromEmail = "SEED@seed.com";
 		String fromName = "SEED";
 		String subject = "";
 		String msg = "";
 		
 		if(div.equals("find_pw")) {
 			subject = "SEED 임시 비밀번호 입니다.";
 			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
 			msg += "<h1 style='color: green;'>";
 			msg += "SEED(Smart Erpsystem based-on Encryted Database)</h1>";
 			msg += "<h3 style='color: blue;'>";
 			msg += member.getPK_SAWON_CODE() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
 			msg += "<p>임시 비밀번호 : ";
 			msg += member.getSAWON_PASSWORD() + "</p></div>";
 		}
 		// 받는 사람 E-Mail 주소
 		String mail = member.getSAWON_EMAIL();
 		try {
 			HtmlEmail email = new HtmlEmail();
 			email.setDebug(true);
 			email.setCharset(charSet);
 			email.setSSL(true);
 			email.setHostName(hostSMTP);
 			email.setSmtpPort(465);

 			email.setAuthentication(hostSMTPid, hostSMTPpwd);
 			email.setTLS(true);
 			email.addTo(mail, charSet);
 			email.setFrom(fromEmail, fromName, charSet);
 			email.setSubject(subject);
 			email.setHtmlMsg(msg);
 			email.send();
 		} catch (Exception e) {
 			System.out.println("메일발송 실패 : " + e);
 		}
 	}
 	
 	// 비밀번호 찾기
  	@Override
  	public void find_pw(HttpServletResponse response, SawonVO sawonVO) throws Exception {
  		response.setContentType("text/html;charset=utf-8");
  		PrintWriter out = response.getWriter();
			// 아이디가 없으면
			if(sqlSession.selectOne("check_id", sawonVO) == null) {
				out.print("아이디가 없습니다.");
				out.close();
			}
			// 가입에 사용한 이메일이 아니면
			else if(sqlSession.selectOne("find_by_Email", sawonVO) == null) {
				out.print("잘못된 이메일 입니다.");
				out.close();
			}else {
  			// 임시 비밀번호 생성
  			String pw = "";
  			for (int i = 0; i < 12; i++) {
  				pw += (char) ((Math.random() * 26) + 97);
  			}
  			sawonVO.setSAWON_PASSWORD(pw);
  			// 비밀번호 변경
  			sqlSession.update("update_pw", sawonVO);
  			// 비밀번호 변경 메일 발송
  			send_mail(sawonVO, "find_pw");
  			
  			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
  			out.close();
			}

  		}
  	
}
