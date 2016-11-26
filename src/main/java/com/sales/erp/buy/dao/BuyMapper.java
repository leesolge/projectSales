package com.sales.erp.buy.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.buy.vo.BuyListVO;
import com.sales.erp.buy.vo.BuyVO;
import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.product.vo.ProductVO;

public interface BuyMapper extends Serializable {

	ArrayList<ProductVO> selectProductAll();

	void buyWrite(BuyVO bvo);

	void buyWriteSameBuynum(BuyVO bvo);

	ArrayList<BuyListVO> buyListWait(BuyVO vo);

	MemberVO getMember(MemberVO mvoParam);

	ArrayList<BuyListVO> buyListAppWaitTeam(MemberVO mvo);

	ArrayList<BuyListVO> buyListWaitAll();

	ArrayList<BuyVO> buyContent(BuyVO voParam);

	void buyApproveManager(String buynum);

	void buyApproveAdmin(String buynum);

	ArrayList<BuyListVO> buyAppListTeam(MemberVO mvo);

	ArrayList<BuyListVO> buyAppListAll();

	ArrayList<BuyListVO> buyAppList(MemberVO mvo);

	void addProduct(BuyVO bvo);

	void buyCancel(String buynum);

}
