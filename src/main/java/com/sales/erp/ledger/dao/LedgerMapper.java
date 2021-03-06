package com.sales.erp.ledger.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.ledger.vo.LedgerJoinVO;
import com.sales.erp.ledger.vo.SqlVO;
import com.sales.erp.member.vo.MemberVO;

public interface LedgerMapper extends Serializable{
	void deleteOne(LedgerJoinVO one);
	void modifyMany(LedgerJoinVO ljvo);
	void modifyOne(LedgerJoinVO ljvo);
	LedgerJoinVO selectOne(SqlVO sql);
	int countLedger(SqlVO sql);
	void registLedger(LedgerJoinVO vo);
	ArrayList<LedgerJoinVO> selectLedger(SqlVO sql);
	MemberVO selectAMember(SqlVO sql);
}
