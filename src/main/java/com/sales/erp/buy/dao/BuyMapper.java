package com.sales.erp.buy.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.buy.vo.BuyListVO;
import com.sales.erp.buy.vo.BuyVO;
import com.sales.erp.buy.vo.BuyPagingVO;
import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.product.vo.ProductVO;

public interface BuyMapper extends Serializable {

	ArrayList<ProductVO> selectProductAll();

	void buyWrite(BuyVO bvo);

	void buyWriteSameBuynum(BuyVO bvo);

	ArrayList<BuyListVO> buyListWait(BuyPagingVO paging);

	int buyListWaitCount(BuyPagingVO paging);

	MemberVO getMember(MemberVO mvoParam);

	ArrayList<BuyListVO> buyListAppWaitTeam(BuyPagingVO paging);

	ArrayList<BuyListVO> buyListWaitAll();

	ArrayList<BuyVO> buyContent(BuyVO voParam);

	void buyApproveManager(String buynum);

	void buyApproveAdmin(String buynum);

	ArrayList<BuyListVO> buyAppListAll(BuyPagingVO paging);

	int getbuyAppListCountAll(BuyPagingVO paging);

	void addProduct(BuyVO bvo);

	void buyCancel(String buynum);

	ArrayList<String> get_team();

}
