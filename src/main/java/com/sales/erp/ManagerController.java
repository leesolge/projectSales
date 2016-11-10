package com.sales.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sales.erp.member.dao.MemberDAOImpl;

@Controller
public class ManagerController {

	@Autowired
	private MemberDAOImpl sMemberDAOImpl;

}
