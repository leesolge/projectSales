package com.sales.erp.smemberDao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.sales.erp.smember.SMemberVO;

@Repository
public interface SMemberDAO {
	public void insertMember(SMemberVO member);
	SMemberVO selectSMember(String empno);		//select one person
	public ArrayList<SMemberVO> Admin_Ok_Members() ;
	public ArrayList<SMemberVO> Admin_Approved_Members();
	public void Update_Approve_Member(String empno);
	public void Update_Cancel_Member(String empno);
	public void Admin_Update_SMember(SMemberVO vo);
	public int Count_Approved_Member();
	public int Count_Ok_Member();
}
