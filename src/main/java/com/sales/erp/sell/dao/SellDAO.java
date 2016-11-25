package com.sales.erp.sell.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.product.vo.ProductVO;
import com.sales.erp.sell.vo.SellListVO;
import com.sales.erp.sell.vo.SellVO;

@Repository
public class SellDAO{

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<ProductVO> selectProductAll() {
		SellMapper mapper = sqlSession.getMapper(SellMapper.class);
		return mapper.selectProductAll();
	}

	public MemberVO getMember(MemberVO mvoParam) {
		SellMapper mapper = sqlSession.getMapper(SellMapper.class);
		return mapper.getMember(mvoParam);
	}

	public void sellWrite(SellVO vo) {
		SellMapper mapper = sqlSession.getMapper(SellMapper.class);
		mapper.sellWrite(vo);
	}

	public ArrayList<SellListVO> sellListPayWaitAll() {
		SellMapper mapper = sqlSession.getMapper(SellMapper.class);
		return mapper.sellListPayWaitAll();
	}

	public ArrayList<SellListVO> sellListPayWaitTeam(MemberVO mvo) {
		SellMapper mapper = sqlSession.getMapper(SellMapper.class);
		return mapper.sellListPayWaitTeam(mvo);
	}

	public ArrayList<SellListVO> sellListPayWait(MemberVO mvo) {
		SellMapper mapper = sqlSession.getMapper(SellMapper.class);
		return mapper.sellListPayWait(mvo);
	}

	public ArrayList<SellListVO> sellListAll() {
		SellMapper mapper = sqlSession.getMapper(SellMapper.class);
		return mapper.sellListAll();
	}

	public ArrayList<SellListVO> sellListTeam(MemberVO mvo) {
		SellMapper mapper = sqlSession.getMapper(SellMapper.class);
		return mapper.sellListTeam(mvo);
	}

	public ArrayList<SellListVO> sellList(MemberVO mvo) {
		SellMapper mapper = sqlSession.getMapper(SellMapper.class);
		return mapper.sellList(mvo);
	}
	
}
