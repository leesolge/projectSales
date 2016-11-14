package com.sales.erp.transact.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.transact.vo.TransactSearchVO;
import com.sales.erp.transact.vo.TransactVO;

@Repository
public class TransactDAO {

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<TransactVO> selectList(TransactSearchVO vo) {
		TransactMapper transactMapper = sqlSession.getMapper(TransactMapper.class);
		return transactMapper.selectList(vo);
	}

	public ArrayList<String> get_procode() {
		TransactMapper transactMapper = sqlSession.getMapper(TransactMapper.class);
		return transactMapper.get_procode();
	}

	public ArrayList<String> get_team() {
		TransactMapper transactMapper = sqlSession.getMapper(TransactMapper.class);
		return transactMapper.get_team();
	}
}
