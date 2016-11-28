package com.sales.erp.ledger.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.ledger.dao.LedgerDAO;
import com.sales.erp.ledger.vo.LedgerJoinVO;
import com.sales.erp.ledger.vo.SqlVO;
import com.sales.erp.member.vo.MemberVO;

@Service
public class LedgerService {
	
	@Autowired
	private LedgerDAO dao;
	
	public void ledgerRegistPro(HttpServletRequest request){
		String empno = request.getParameter("empno");
		String content = request.getParameter("content");
		String sort = request.getParameter("sort");
		long amount = Long.parseLong(request.getParameter("amount"));
		String etc = request.getParameter("etc");
		LedgerJoinVO ljvo = new LedgerJoinVO();
		ljvo.setEmpno(empno);
		ljvo.setContent(content);
		ljvo.setSort(sort);
		ljvo.setEtc(etc);
		ljvo.setAmount(amount);
		if(sort.equals("수입")){
			ljvo.setSortamount(amount);
		}else{
			ljvo.setSortamount(amount*(-1));
		}
		dao.registLedger(ljvo);
	}
	
	public ModelAndView ledgerRegistForm(){
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		SqlVO vo = new SqlVO();
		vo.setQuery(empno);
		MemberVO mvo = dao.selectAMember(vo);
		mav.addObject("empno", empno);
		mav.addObject("name", mvo.getName());
		return mav;
	}
	
	public ModelAndView ledgerList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String sPage = request.getParameter("pageNum");
		if(sPage==null||sPage.equals("")){
			sPage = "1";
		}
		int pageNum = Integer.parseInt(sPage);
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		mav.addObject("sdate", startdate);
		mav.addObject("edate", enddate);
		String sort = request.getParameter("sort");
		String query = "";
		if(startdate==null||startdate.equals("")){
			startdate = "";
		}else{
			startdate = startdate.replace("-", "")+"000000";
			startdate = startdate.trim();
			query = query + "AND L.REGDATE>=TO_DATE('"+startdate+"', 'YYYYMMDDHH24MISS') ";
		}
		if(enddate==null||enddate.equals("")){
			enddate = "";
		}else{
			enddate = enddate.replace("-", "")+"235959";
			enddate = enddate.trim();
			query = query + "AND L.REGDATE<=TO_DATE('"+enddate+"', 'YYYYMMDDHH24MISS') ";
		}
		if(sort==null||sort.equals("")){
			sort = "";
		}else{
			query = query + "AND L.SORT='"+sort+"'";
		}
		SqlVO sql = new SqlVO();
		sql.setQuery(query);
		int count = dao.countLedger(sql);
		int pageSize = 10;
		int start = (pageSize*pageNum)-(pageSize-1);
		int end = start+(pageSize-1);
		sql.setStart(start);
		sql.setEnd(end);
		
		int max = count/pageSize;
		if(count%pageSize!=0){
			max = max+1;
		}
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("max", max);
		
		ArrayList<LedgerJoinVO> ledgerList = dao.selectLedger(sql);
		for(LedgerJoinVO jvo:ledgerList){
			Date date = jvo.getRegdate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
			String change = sdf.format(date);
			jvo.setChange(change);
		}
		mav.addObject("list", ledgerList);
		mav.addObject("startdate", startdate);
		mav.addObject("enddate", enddate);
		mav.addObject("sort", sort);
		return mav;
	}
}
