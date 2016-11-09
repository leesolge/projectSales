package com.sales.erp.email;

import com.sales.erp.smember.SMemberVO;

public interface RegistrationNotifier {

	public void sendMail(SMemberVO vo);
}
