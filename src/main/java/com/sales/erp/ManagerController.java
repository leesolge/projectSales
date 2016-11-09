package com.sales.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sales.erp.smemberDao.SMemberDAOImpl;

@Controller
public class ManagerController {

	@Autowired
	private SMemberDAOImpl sMemberDAOImpl;

}
