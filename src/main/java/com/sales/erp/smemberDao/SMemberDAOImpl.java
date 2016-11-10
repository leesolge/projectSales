package com.sales.erp.smemberDao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.smember.SMemberVO;
import com.sales.erp.smember.SearchMember;

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
	public SMemberVO selectMember(String empno) {
		SMemberVO vo = new SMemberVO();
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		vo = memberMapper.selectMember(empno);
		
		return vo;
	}
	
	@Override
	public ArrayList<SMemberVO> Admin_Ok_Member() {
		ArrayList<SMemberVO> member = new ArrayList<SMemberVO>();	
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		member = memberMapper.Admin_Ok_Member();
		
		return member;
	}
	
	@Override
	public ArrayList<SMemberVO> Admin_Approved_Member(SearchMember vo) {
		ArrayList<SMemberVO> member = new ArrayList<SMemberVO>();	
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		member = memberMapper.Admin_Approved_Member(vo);
		
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
	public void Admin_Update_Member(SMemberVO vo) {
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);
		memberMapper.Admin_Update_Member(vo);	
	}

	@Override
	public int Count_Approved_Member(SearchMember vo) {
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);	
		int count = memberMapper.Count_Approved_Member(vo);
		
		return count;
	}

	@Override
	public int Count_Ok_Member() {
		SMemberMapper memberMapper = sqlSession.getMapper(SMemberMapper.class);	
		int count = memberMapper.Count_Ok_Member();
		
		return count;
	} 	
}
