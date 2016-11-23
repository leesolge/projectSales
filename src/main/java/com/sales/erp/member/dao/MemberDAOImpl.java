package com.sales.erp.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.MemberVO;

@Repository
public class MemberDAOImpl{

	@Autowired
	private SqlSession sqlSession;
	
	public void insertMember(MemberVO member) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.insertMember(member);
	} 

	public MemberVO ConfirmID_Member(MemberVO member){
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);	
		MemberVO vo = memberMapper.ConfirmID_Member(member);
		return vo;
	}
}
