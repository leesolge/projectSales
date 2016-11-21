package com.sales.erp.transact.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.OrderRequestListJoinVO;
import com.sales.erp.member.vo.OrderRequestListVO;
import com.sales.erp.member.vo.OrderRequestVO;
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

	public ArrayList<OrderRequestListJoinVO> getRequestList() {
		TransactMapper transactMapper = sqlSession.getMapper(TransactMapper.class);
		return transactMapper.getRequestList();
	}

	public void RequestApprove(String onum) {
		TransactMapper transactMapper = sqlSession.getMapper(TransactMapper.class);
		transactMapper.RequestApprove(onum);
	}

	public ArrayList<OrderRequestVO> GetTransactList(String onum) {
		TransactMapper transactMapper = sqlSession.getMapper(TransactMapper.class);
		return transactMapper.GetTransactList(onum);
	}

	public void AddTransactList(OrderRequestVO vo) {
		TransactMapper transactMapper = sqlSession.getMapper(TransactMapper.class);
		transactMapper.AddTransactList(vo);		
	}
}
