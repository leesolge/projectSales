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
	
	@Override
	public void Update_Cancel_Member(String empno) {
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		memberMapper.Update_Cancel_Member(empno);
	}

	@Override
	public SMemberVO selectSMember(String empno) {
		SMemberVO vo = new SMemberVO();
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		vo = memberMapper.selectSMember(empno);
		return vo;
	}

	@Override
	public void Admin_Update_SMember(SMemberVO vo) {
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		memberMapper.Admin_Update_SMember(vo);	
	}

	@Override
	public int Count_Approved_Member() {
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);	
		int count = memberMapper.Count_Approved_Member();
		
		return count;
	}

	@Override
	public int Count_Ok_Member() {
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);	
		int count = memberMapper.Count_Ok_Member();
		
		return count;
	} 	
}
