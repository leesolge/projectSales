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
}
