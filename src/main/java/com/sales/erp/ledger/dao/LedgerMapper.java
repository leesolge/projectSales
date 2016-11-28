package com.sales.erp.ledger.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.ledger.vo.LedgerJoinVO;
import com.sales.erp.ledger.vo.SqlVO;
import com.sales.erp.member.vo.MemberVO;

public interface LedgerMapper extends Serializable{
	int countLedger(SqlVO sql);
	void registLedger(LedgerJoinVO vo);
	ArrayList<LedgerJoinVO> selectLedger(SqlVO sql);
	MemberVO selectAMember(SqlVO sql);
}
