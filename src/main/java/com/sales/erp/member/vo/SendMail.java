package com.sales.erp.member.vo;

import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class SendMail {

	private MailSender mailSender;

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void sendMail(MemberVO vo) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setSubject("[승인거부]죄송합니다." + vo.getName() + "님의 Kosta125상사 회원가입이 거부되었습니다.");
		message.setFrom("anzolee@naver.com");
		message.setText("다음기회에....");
		message.setTo(vo.getEmail());
		try {
			mailSender.send(message);
		} catch (MailException ex) {
			ex.printStackTrace();
		}

	}
}
