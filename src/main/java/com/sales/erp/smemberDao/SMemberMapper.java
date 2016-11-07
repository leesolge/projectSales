package com.sales.erp.smemberDao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.smember.SMemberVO;

public interface SMemberMapper extends Serializable{

	 ArrayList<SMemberVO> selectAllSMember();		//select
	 public void insertMember(SMemberVO member);
	 SMemberVO selectSMember(String empno);		//select one person
	 ArrayList<SMemberVO>  Admin_Ok_SMember();		//select waiting ok person
	 ArrayList<SMemberVO>  Admin_Approved_Members();		//select Approved person
	 public void Update_Approve_Member(String empno);
}
