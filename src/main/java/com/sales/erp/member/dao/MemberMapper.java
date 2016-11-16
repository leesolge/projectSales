package com.sales.erp.member.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.member.vo.MemberJoinVO;
import com.sales.erp.member.vo.MemberSearch;
import com.sales.erp.member.vo.MemberVO;

public interface MemberMapper extends Serializable{
	
	public void insertMember(MemberVO member); // 회원등록
	public MemberVO selectMember(String empno); // empno에 따른 개인정보 추출
	public void updateMember(MemberJoinVO vo); // 사원정보 수정
	public ArrayList<MemberVO> Admin_Ok_Member(MemberSearch vo);  // 승인대기 목록
	public ArrayList<MemberVO> Admin_Approved_Member(MemberSearch vo); // 사원목록
	public void Update_Approve_Member(String empno); // 가입승인
	public void Update_Cancel_Member(String empno); // 반려, 사원정보 삭제
	public void Admin_Update_Member(MemberVO vo); // 사원정보 수정
	public int Count_Approved_Member(MemberSearch vo); // 사원 수
	public int Count_Ok_Member(); // 승인 대기자 수
	public MemberVO ConfirmID_Member(MemberVO vo);//ID 찾기
}
