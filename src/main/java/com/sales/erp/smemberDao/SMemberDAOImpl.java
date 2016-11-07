package com.sales.erp.smemberDao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.smember.SMemberVO;

@Repository
public class SMemberDAOImpl implements SMemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<SMemberVO> getSMembers() {
		ArrayList<SMemberVO> member = new ArrayList<SMemberVO>();	
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		member = memberMapper.selectAllSMember();
		
		return member;
	}
	
	@Override
	public void insertMember(SMemberVO member) {
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		memberMapper.insertMember(member);
	} 
	
	@Override
	public ArrayList<SMemberVO> Admin_Ok_Members() {
		ArrayList<SMemberVO> member = new ArrayList<SMemberVO>();	
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		member = memberMapper.Admin_Ok_SMember();
		
		return member;
	}
	
	@Override
	public ArrayList<SMemberVO> Admin_Approved_Members() {
		ArrayList<SMemberVO> member = new ArrayList<SMemberVO>();	
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		member = memberMapper.Admin_Approved_Members();
		
		return member;
	}
	
	@Override
	public void Update_Approve_Member(String empno) {
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		memberMapper.Update_Approve_Member(empno);
	} 
}
