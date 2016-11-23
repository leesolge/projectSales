package com.sales.erp.member.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.member.vo.MemberJoinVO;
import com.sales.erp.member.vo.MemberSearch;
import com.sales.erp.member.vo.MemberVO;

public interface MemberMapper extends Serializable{
	
	public void insertMember(MemberVO member); // 회원등록
	public MemberVO ConfirmID_Member(MemberVO vo);//ID 찾기
	
	/////////////////////////////////////////새로 시작하는 부분
	public MemberVO getMember(MemberVO mvoParam); // 사용자 정보 받아오기
	public MemberVO getMemberEmpno(String empno);
	public int memberListCount(MemberSearch search);		// 사원 수
	public int memberListCountTeam(MemberSearch search);	// 팀별 사원 수
	public ArrayList<MemberVO> memberList(MemberSearch search);
	public ArrayList<MemberVO> memberListTeam(MemberSearch search);
	public void memberUpdate(MemberJoinVO vo);	// 개인정보 수정
	public void memberUpdateA(MemberVO vo);		// 사원정보 수정
	public ArrayList<MemberVO> memberListWait(MemberSearch search);
	public int memberListWaitCount(MemberSearch search);
	public void Approve(MemberVO vo);
	public void Cancel(MemberVO vo);
	
}
