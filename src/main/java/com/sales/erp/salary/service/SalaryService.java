package com.sales.erp.salary.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.order.vo.OrderJoinVO;
import com.sales.erp.salary.dao.SalaryDAO;
import com.sales.erp.salary.vo.SalaryVO;
import com.sales.erp.salary.vo.VOforSQL;

@Service
public class SalaryService {

	@Autowired
	private SalaryDAO dao;
	
	public ModelAndView viewSalary(HttpServletRequest request) throws ParseException{
		ModelAndView mav = new ModelAndView();
		ArrayList<SalaryVO> selectlist = new ArrayList<SalaryVO>();
		Calendar today = Calendar.getInstance();
		int thisYear = today.get(Calendar.YEAR);
		int thisMonth = today.get(Calendar.MONTH);
		System.out.println(thisMonth);
		double payment = 0;
		
		String datevalue = request.getParameter("datevalue");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		if(datevalue==null||datevalue.equals("")){
			if(String.valueOf(thisMonth+1).length()==1){
				datevalue = String.valueOf(thisYear)+"0"+String.valueOf(thisMonth+1)+String.valueOf(today.getActualMaximum(today.DATE))+"235959";
			}else{
				datevalue = String.valueOf(thisYear)+String.valueOf(thisMonth+1)+String.valueOf(today.getActualMaximum(today.DATE))+"235959";
			}
		}
		String checks = datevalue.substring(0, 4)+"년 ";
		String tempmonth="";
		if(datevalue.substring(4, 6).startsWith("0")){
			tempmonth = datevalue.substring(5, 6);
			checks = checks+tempmonth+"월 ";
		}else{
			tempmonth = datevalue.substring(4, 6);
			checks = checks+tempmonth+"월 ";
		}
		
		if(String.valueOf(thisYear).equals(datevalue.substring(0, 4))&&String.valueOf(thisMonth+1).equals(tempmonth)){
			checks = checks+"예정 ";
		}
		
		VOforSQL vvo = new VOforSQL();
		vvo.setEmpno(empno);
		vvo.setStartdate(datevalue.substring(0, 6)+"01000000");
		vvo.setEnddate(datevalue);
		String profitsum = dao.profitSum(vvo);
		ArrayList<OrderJoinVO> perform = dao.selectMonthlyPerformance(vvo);
		System.out.println(perform.size());
		for(OrderJoinVO ovo:perform){
			Date date = ovo.getRegdate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
			String changes = sdf.format(date);
			ovo.setChanges(changes);
			double allowance = Integer.parseInt(ovo.getProfit());
			if(ovo.getAuth().equals("ROLE_EMPLOYEE")){
				ovo.setAuth("사원");
			}
			if(ovo.getAuth().equals("ROLE_MANAGER")){
				ovo.setAuth("팀장");
			}
			if(ovo.getAuth().equals("ROLE_ADMIN")){
				ovo.setAuth("관리자");
			}
			if(ovo.getAuth().equals("사원")){
				allowance = Math.round(allowance*0.4);
			}else if(ovo.getAuth().equals("팀장")){
				allowance = Math.round(allowance*0.5);
			}
			System.out.println(ovo.getAuth());
			System.out.println(allowance);
			ovo.setAllowance(allowance);
			payment = payment+ovo.getAllowance();
		}
		
		for(int i=0;i<12;i++){
			today.set(thisYear, thisMonth, 1);
			SalaryVO vo = new SalaryVO();
			String month = "0";
			if(String.valueOf(thisMonth+1).length()==1){
				month = "0"+String.valueOf(thisMonth+1);
			}else{
				month = String.valueOf(thisMonth+1); 
			}
			
			vo.setViewdate(String.valueOf(thisYear)+"년 "+month+"월");
			vo.setDatevalue(String.valueOf(thisYear)+""+month+String.valueOf(today.getActualMaximum(today.DATE))+"235959");
			selectlist.add(vo);
			thisMonth = thisMonth-1;
			if(thisMonth<0){
				thisMonth = 11;
				thisYear = thisYear-1;
			}
			
			mav.addObject("checks", checks);
			mav.addObject("calist", selectlist);
			mav.addObject("perlist", perform);
			mav.addObject("datevalue", datevalue);
			mav.addObject("payment", payment);
			mav.addObject("sum", profitsum);
		}
		return mav;
	}
}