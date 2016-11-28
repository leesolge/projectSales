package com.sales.erp.buy.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.buy.vo.BuyListVO;
import com.sales.erp.buy.vo.BuyVO;
import com.sales.erp.buy.vo.BuyPagingVO;
import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.product.vo.ProductVO;

@Repository
public class BuyDAO {

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<ProductVO> selectProductAll() {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.selectProductAll();
	}

	public void buyWrite(BuyVO bvo) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		mapper.buyWrite(bvo);
	}

	public void buyWriteSameBuynum(BuyVO bvo) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		mapper.buyWriteSameBuynum(bvo);
	}

	public ArrayList<BuyListVO> buyListWait(BuyPagingVO paging) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.buyListWait(paging);
	}

	public MemberVO getMember(MemberVO mvoParam) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.getMember(mvoParam);
	}

	public ArrayList<BuyListVO> buyListAppWaitTeam(MemberVO mvo) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.buyListAppWaitTeam(mvo);
	}

	public ArrayList<BuyListVO> buyListWaitAll() {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.buyListWaitAll();
	}

	public ArrayList<BuyVO> buyContent(BuyVO voParam) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.buyContent(voParam);
	}

	public void buyApproveManager(String buynum) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		mapper.buyApproveManager(buynum);
	}
	
	public void buyCancel(String buynum) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		mapper.buyCancel(buynum);
	}

	public void buyApproveAdmin(String buynum) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		mapper.buyApproveAdmin(buynum);
	}

	public ArrayList<BuyListVO> buyAppListAll(BuyPagingVO paging) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.buyAppListAll(paging);
	}

	public void addProduct(BuyVO bvo) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		mapper.addProduct(bvo);		
	}

	public int getbuyAppListCountAll(BuyPagingVO paging) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.getbuyAppListCountAll(paging);
	}

	public ArrayList<String> get_team() {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.get_team();
	}

	public int buyListWaitCount(BuyPagingVO paging) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.buyListWaitCount(paging);
	}


}
