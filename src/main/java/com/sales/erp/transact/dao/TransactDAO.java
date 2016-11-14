package com.sales.erp.transact.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.note.dao.NoteMapper;
import com.sales.erp.transact.vo.TransactVO;

@Repository
public class TransactDAO {

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<TransactVO> selectList(TransactVO vo) {
		TransactMapper transactMapper = sqlSession.getMapper(TransactMapper.class);
		return transactMapper.selectList(vo);
	}
}
