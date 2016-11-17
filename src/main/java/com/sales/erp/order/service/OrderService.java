package com.sales.erp.order.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.order.dao.OrderDAO;
import com.sales.erp.order.vo.OrderJoinVO;
import com.sales.erp.order.vo.OrderVO;
import com.sales.erp.order.vo.TeamVO;
import com.sales.erp.order.vo.TestVO;
import com.sales.erp.product.vo.ProductVO;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO dao;
	
	@Transactional
	public ModelAndView orderCheck(String orderid){
		RedirectView rv = null;
		
		TestVO vo = new TestVO();
		vo.setTests(orderid);
		int amount = dao.getProductAmount(vo);
		System.out.println(vo.getTests());
		OrderVO rvo = dao.selectOneOrder(vo);
		if(Integer.parseInt(rvo.getProamount())>amount){
			rv = new RedirectView("/erp/admin/orderfail");
		}else{
			OrderJoinVO ovo = dao.adminSelectOne(vo);
			ovo.toString();
			dao.orderCheck(vo);
			dao.transInsert(ovo);
			vo.setTests(rvo.getProamount()+" WHERE PROCODE="+rvo.getProcode());
			System.out.println(vo.getTests());
			dao.minusProduct(vo);
			rv = new RedirectView("/erp/admin/order");
		}
		
		rv.setExposeModelAttributes(false);
		ModelAndView mav = new ModelAndView(rv);
		return mav;
	}
	
	public ModelAndView modifyPro(HttpServletRequest request){
		RedirectView rv = null;
		rv = new RedirectView("/erp/admin/order");
		rv.setExposeModelAttributes(false);
		ModelAndView mav = new ModelAndView(rv);
		OrderVO vo = new OrderVO();
		vo.setEmpno(request.getParameter("empno"));
		vo.setProcode(request.getParameter("procode"));
		vo.setProamount(request.getParameter("proamount"));
		vo.setCustomer(request.getParameter("customer"));
		vo.setAddress(request.getParameter("address"));
		vo.setId(request.getParameter("id"));
		dao.modifyPro(vo);
		return mav;
	}
	
	public OrderVO selectOneOrder(String id){
		TestVO vo = new TestVO();
		vo.setTests(id);
		OrderVO ovo = dao.selectOneOrder(vo); 
		return ovo;
	}
	
	public ModelAndView canclePro(String id){
		TestVO vo = new TestVO();
		vo.setTests(id);
		dao.cancleOne(vo);
		RedirectView rv = null;
		rv = new RedirectView("/erp/admin/order");
		rv.setExposeModelAttributes(false);
		ModelAndView mav = new ModelAndView(rv);
		return mav;
	}
	
	public ModelAndView adminRegistPro(HttpServletRequest request){
		OrderVO vo = new OrderVO();
		vo.setEmpno(request.getParameter("empno"));
		vo.setProcode(request.getParameter("procode"));
		vo.setProamount(request.getParameter("proamount"));
		vo.setCustomer(request.getParameter("customer"));
		vo.setAddress(request.getParameter("address"));
		dao.insertOrder(vo);
		RedirectView rv = null;
		rv = new RedirectView("/erp/admin/order");
		rv.setExposeModelAttributes(false);
		ModelAndView mav = new ModelAndView(rv);
		return mav;
	}
	
	public ModelAndView adminRegistForm(){
		ModelAndView mav = new ModelAndView();
		ArrayList<MemberVO> mlist = dao.memberForReg(); 
		for(MemberVO vo:mlist){
			if(vo.getAuth().equals("ROLE_EMPLOYEE")){
				vo.setAuth("사원");
			}
			if(vo.getAuth().equals("ROLE_MANAGER")){
				vo.setAuth("팀장");
			}
			if(vo.getAuth().equals("ROLE_ADMIN")){
				vo.setAuth("관리자");
			}
		}
		ArrayList<ProductVO> plist = dao.selectProductAll();
		mav.addObject("mlist", mlist);
		mav.addObject("plist", plist);
		return mav;
	}
	
	public ModelAndView adminOrder(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductVO> plist = dao.selectProductAll();
		
		ArrayList<TeamVO> teams = dao.selectTeam();
		ArrayList<MemberVO> teamList = new ArrayList<MemberVO>();
		HashMap<Integer, ArrayList<MemberVO>> map = new HashMap<Integer, ArrayList<MemberVO>>();
		for(int i=0;i<teams.size();i++){
			map.put(i, dao.teamMember(teams.get(i)));
		}
		for(int j=0;j<teams.size();j++){
			MemberVO temp = new MemberVO();
			temp.setAuth("");
			temp.setEmpno(teams.get(j).getTeam());
			temp.setName("");
			teamList.add(temp);
			for(int k=0;k<map.get(j).size();k++){
				teamList.add(map.get(j).get(k));
			}
		}
		System.out.println(teamList);
		String firstdate = request.getParameter("firstdate");
		String seconddate = request.getParameter("seconddate");
		String product = request.getParameter("product");
		String emp = request.getParameter("emp");
		String checks = request.getParameter("checks");
		if(firstdate==null||firstdate.equals("")){
			firstdate = "";
		}else{
			firstdate = firstdate.replace("-", "")+"000000";
			firstdate = "AND O.REGDATE>=TO_DATE('"+firstdate+"', 'YYYYMMDDHH24MISS') ";
		}
		if(seconddate==null||seconddate.equals("")){
			seconddate = "";
		}else{
			seconddate = seconddate.replace("-", "")+"235959";
			seconddate = "AND O.REGDATE<=TO_DATE('"+seconddate+"', 'YYYYMMDDHH24MISS') ";
		}
		if(product==null||product.equals("")){
			product = "";
		}else{
			product = "AND O.PROCODE='"+product+"' ";
		}
		if(emp==null||emp.equals("")){
			emp = "";
		}else{
			boolean check = true;
			for(int l=0;l<teams.size();l++){
				String tempemp = teams.get(l).getTeam();
				if(emp.equals(tempemp)){
					emp = "AND S.TEAM='"+emp+"' ";
					check = false;
				}
			}
			if(check==true){
				emp = "AND O.EMPNO='"+emp+"' ";
			}
		}
		for(MemberVO vo:teamList){
			if(vo.getAuth().equals("ROLE_EMPLOYEE")){
				vo.setAuth("사원");
			}
			if(vo.getAuth().equals("ROLE_MANAGER")){
				vo.setAuth("팀장");
			}
			if(vo.getAuth().equals("ROLE_ADMIN")){
				vo.setAuth("관리자");
			}
		}
		if(checks==null||checks.equals("0")||checks.equals("")){
			checks = "AND CHECKS=0";
		}else{
			checks = "AND CHECKS=1";
		}
		TestVO vo = new TestVO();
		vo.setTests(firstdate+seconddate+product+emp+checks);
		System.out.println(vo.getTests());
		ArrayList<OrderJoinVO> list = dao.adminSelectOrders(vo);
		for(OrderJoinVO ovo:list){
			Date date = ovo.getRegdate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
			String changes = sdf.format(date);
			ovo.setChanges(changes);
			if(ovo.getAuth().equals("ROLE_EMPLOYEE")){
				ovo.setAuth("사원");
			}
			if(ovo.getAuth().equals("ROLE_MANAGER")){
				ovo.setAuth("팀장");
			}
			if(ovo.getAuth().equals("ROLE_ADMIN")){
				ovo.setAuth("관리자");
			}
			double allowance = Integer.parseInt(ovo.getProfit());
			if(ovo.getAuth().equals("사원")){
				allowance = Math.round(allowance*0.4);
			}else if(ovo.getAuth().equals("팀장")){
				allowance = Math.round(allowance*0.5);
			}
			ovo.setAllowance(allowance);
		}
		if(checks.contains("1")){
			checks = "1";
		}else{
			checks = "0";
		}
		
		mav.addObject("checks", checks);
		mav.addObject("plist", plist);
		mav.addObject("alist", list);
		mav.addObject("mlist", teamList);
		return mav;
	}
	
	public ModelAndView registForm(){
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		ArrayList<ProductVO> list = dao.selectProductAll();
		mav.addObject("plist", list);
		mav.addObject("empno", empno);
		return mav;
	}
	
	public ModelAndView registPro(HttpServletRequest request){
		OrderVO vo = new OrderVO();
		vo.setEmpno(request.getParameter("empno"));
		vo.setProcode(request.getParameter("procode"));
		vo.setProamount(request.getParameter("proamount"));
		vo.setCustomer(request.getParameter("customer"));
		vo.setAddress(request.getParameter("address"));
		dao.insertOrder(vo);
		RedirectView rv = null;
		rv = new RedirectView("/erp/order/list");
		rv.setExposeModelAttributes(false);
		ModelAndView mav = new ModelAndView(rv);
		return mav;
	}
}
