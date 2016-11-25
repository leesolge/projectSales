package com.sales.erp.sell.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.product.vo.ProductVO;
import com.sales.erp.sell.vo.SellListVO;
import com.sales.erp.sell.vo.SellVO;

public interface SellMapper extends Serializable {

	ArrayList<ProductVO> selectProductAll();

	MemberVO getMember(MemberVO mvoParam);

	void sellWrite(SellVO vo);

	ArrayList<SellListVO> sellListPayWaitAll();

	ArrayList<SellListVO> sellListPayWaitTeam(MemberVO mvo);

	ArrayList<SellListVO> sellListPayWait(MemberVO mvo);

	ArrayList<SellListVO> sellListAll();

	ArrayList<SellListVO> sellListTeam(MemberVO mvo);

	ArrayList<SellListVO> sellList(MemberVO mvo);

}
