package com.sales.erp.smemberDao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.sales.erp.smember.SMemberVO;

@Repository
public interface SMemberDAO {
	ArrayList<SMemberVO> getSMembers();
	public void insertMember(SMemberVO member);
	public ArrayList<SMemberVO> Admin_Ok_Members() ;
	public ArrayList<SMemberVO> Admin_Approved_Members();
	public void Update_Approve_Member(String empno);
}
