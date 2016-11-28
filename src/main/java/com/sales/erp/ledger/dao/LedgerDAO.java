package com.sales.erp.ledger.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.ledger.vo.LedgerJoinVO;
import com.sales.erp.ledger.vo.SqlVO;
import com.sales.erp.member.vo.MemberVO;

@Repository
public class LedgerDAO implements LedgerMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void deleteOne(LedgerJoinVO one) {
		LedgerMapper mapper = sqlSession.getMapper(LedgerMapper.class);
		mapper.deleteOne(one);
	}

	public void modifyMany(LedgerJoinVO ljvo) {
		LedgerMapper mapper = sqlSession.getMapper(LedgerMapper.class);
		mapper.modifyMany(ljvo);
	}

	public void modifyOne(LedgerJoinVO ljvo) {
		LedgerMapper mapper = sqlSession.getMapper(LedgerMapper.class);
		mapper.modifyOne(ljvo);
	}

	public LedgerJoinVO selectOne(SqlVO sql) {
		LedgerMapper mapper = sqlSession.getMapper(LedgerMapper.class);
		return mapper.selectOne(sql);
	}

	public int countLedger(SqlVO sql) {
		LedgerMapper mapper = sqlSession.getMapper(LedgerMapper.class);
		return mapper.countLedger(sql);
	}

	public void registLedger(LedgerJoinVO vo) {
		LedgerMapper mapper = sqlSession.getMapper(LedgerMapper.class);
		mapper.registLedger(vo);
	}

	public MemberVO selectAMember(SqlVO sql) {
		LedgerMapper mapper = sqlSession.getMapper(LedgerMapper.class);
		return mapper.selectAMember(sql);
	}

	public ArrayList<LedgerJoinVO> selectLedger(SqlVO sql) {
		LedgerMapper mapper = sqlSession.getMapper(LedgerMapper.class);
		return mapper.selectLedger(sql);
	}
	
}
