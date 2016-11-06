package com.sales.erp.smemberDao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.sales.erp.smember.SMemberVO;

@Repository
public interface SMemberDAO {

	ArrayList<SMemberVO> getSMembers();		//select
	public void insertMember(SMemberVO member);
}
