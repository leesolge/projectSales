package com.sales.erp.email;

import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import com.sales.erp.smember.SMemberVO;

public class SimpleRegistrationNotifier implements RegistrationNotifier {

	private MailSender mailSender;

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	@Override
	public void sendMail(SMemberVO vo) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setSubject("[Simple] 됬다고!!");
		message.setFrom("anzolee@naver.com");
		message.setText("이건 실험용입니다.");
		message.setTo(vo.getEmail());
		try {
			mailSender.send(message);
		} catch (MailException ex) {
			ex.printStackTrace();
		}

	}
}
