package com.sales.erp.member.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.MemberJoinVO;
import com.sales.erp.member.vo.MemberSearch;
import com.sales.erp.member.vo.MemberVO;

@Repository
public class MemberDAO{

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
	
	////////////////////////////////////새로 작성하는 부분

	public MemberVO getMemberEmpno(String id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.getMemberEmpno(id);
	}
	public MemberVO getMember(MemberVO mvoParam) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.getMember(mvoParam);
	}

	public int memberListCount(MemberSearch search) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.memberListCount(search);
	}

	public int memberListCountTeam(MemberSearch search) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.memberListCountTeam(search);
	}

	public ArrayList<MemberVO> memberList(MemberSearch search) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.memberList(search);
	}

	public ArrayList<MemberVO> memberListTeam(MemberSearch search) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.memberListTeam(search);
	}

	public void memberUpdate(MemberJoinVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.memberUpdate(vo);		
	}

	public void memberUpdateA(MemberVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.memberUpdateA(vo);			
	}

	public ArrayList<MemberVO> memberListWait(MemberSearch search) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.memberListWait(search);
	}

	public int memberListWaitCount(MemberSearch search) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.memberListWaitCount(search);
	}

	public void Approve(MemberVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.Approve(vo);		
	}

	public void Cancel(MemberVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.Cancel(vo);		
	}
}
