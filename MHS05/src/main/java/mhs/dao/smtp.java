package mhs.dao;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class smtp 
{

	// 구글 이메일
	static final String user_email 	= "ckksa111@gmail.com";
	// 구글 비번
	static final String user_pw 	= "ijij hhsx szex tohg";
	// G-mail 사용
	static final String smtp_host 	= "smtp.gmail.com";
	static final int smtp_port = 465; // TLS : 587, SSL : 465

	public String Send(String email) throws Exception {
		Properties props = System.getProperties();
		props.put("mail.smtp.host", smtp_host);
		props.put("mail.smtp.port", smtp_port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", smtp_host);

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user_email, user_pw);
			}
		});
		
		Random random = new Random();		//랜덤 함수 선언
		int createNum = 0;  				//1자리 난수
		String ranNum = ""; 				//1자리 난수 형변환 변수
        int letter    = 6;					//난수 자릿수:6
		String resultNum = "";  			//결과 난수
		
		for (int i=0; i < letter; i++) { 
            		
			createNum = random.nextInt(9);			//0부터 9까지 올 수 있는 1자리 난수 생성
			ranNum =  Integer.toString(createNum);  //1자리 난수를 String으로 형변환
			resultNum += ranNum;					//생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열
		}

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user_email));

			// 받는 이메일
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));

			// 제목
			message.setSubject("MHS 인증번호");

			// 내용 인증번호
			message.setText(resultNum);

			// 발송
			Transport.send(message);
			
			return resultNum;
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return null;
		}
	}
	
}