package com.sales.erp.member.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.MemberJoinVO;
import com.sales.erp.member.vo.MemberSearch;
import com.sales.erp.member.vo.MemberVO;

@Repository
public class MemberDAOImpl{

	@Autowired
	private SqlSession sqlSession;
	
	public void insertMember(MemberVO member) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.insertMember(member);
	} 
	
	public MemberVO selectMember(String empno) {
		MemberVO vo = new MemberVO();
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		vo = memberMapper.selectMember(empno);
		
		return vo;
	}
	

	public void updateMember(MemberJoinVO vo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.updateMember(vo);
	}
	

	public ArrayList<MemberVO> Admin_Ok_Member(MemberSearch vo) {
		ArrayList<MemberVO> member = new ArrayList<MemberVO>();	
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		member = memberMapper.Admin_Ok_Member(vo);
		
		return member;
	}
	

	public ArrayList<MemberVO> Admin_Approved_Member(MemberSearch vo) {
		ArrayList<MemberVO> member = new ArrayList<MemberVO>();	
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		member = memberMapper.Admin_Approved_Member(vo);
		
		return member;
	}
	

	public void Update_Approve_Member(String empno) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.Update_Approve_Member(empno);
	}
	

	public void Update_Cancel_Member(String empno) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.Update_Cancel_Member(empno);
	}


	public void Admin_Update_Member(MemberVO vo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.Admin_Update_Member(vo);	
	}


	public int Count_Approved_Member(MemberSearch vo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);	
		int count = memberMapper.Count_Approved_Member(vo);
		
		return count;
	}


	public int Count_Ok_Member() {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);	
		int count = memberMapper.Count_Ok_Member();
		
		return count;
	} 	

	public MemberVO ConfirmID_Member(MemberVO member){
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);	
		MemberVO vo = memberMapper.ConfirmID_Member(member);
		return vo;
	}
}
