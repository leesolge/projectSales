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
import com.sales.erp.note.dao.NoteDAO;
import com.sales.erp.note.vo.NoteVO;
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
	
	@Autowired
	private NoteDAO ndao;
	
	@Transactional
	public ModelAndView orderCheck(String orderid){
		RedirectView rv = null;
		TestVO vo = new TestVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		vo.setTests(empno);
		MemberVO memvo = dao.selectAMember(vo);
		vo.setTests(orderid); 
		int amount = dao.getProductAmount(vo);
		OrderVO rvo = dao.selectOneOrder(vo);
		if(Integer.parseInt(rvo.getProamount())>amount){
			rv = new RedirectView("/erp/order/orderfail");
		}else{
			OrderJoinVO ovo = dao.adminSelectOne(vo);
			Date date = ovo.getRegdate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
			String changes = sdf.format(date);
			ovo.setChanges(changes);
			dao.orderCheck(vo);
			dao.transInsert(ovo);
			vo.setTests(rvo.getProamount()+" WHERE PROCODE="+rvo.getProcode());
			dao.minusProduct(vo);
			rv = new RedirectView("/erp/order/list");
			NoteVO notevo = new NoteVO();
			notevo.setSender(memvo.getEmpno());
			notevo.setReceiver(ovo.getEmpno());
			notevo.setTitle("요청하신 수주가 승인되었습니다.");
			String content = "주문 정보\n\n";
			content = content + "등록자 : "+ovo.getEmpno()+"\n";
			content = content + "등록일자 : "+ovo.getChanges()+"\n";
			content = content + "상품명 : "+ovo.getProname()+"\n";
			content = content + "주문수량 : "+ovo.getProamount()+"\n";
			content = content + "금액 : "+ovo.getProfit()+"\n";
			content = content + "고객명 : "+ovo.getCustomer()+"\n";
			content = content + "감사합니다.";
			notevo.setContent(content);
			ndao.writePro(notevo);
		}
		
		rv.setExposeModelAttributes(false);
		ModelAndView mav = new ModelAndView(rv);
		return mav;
	}
	
	public ModelAndView modifyPro(HttpServletRequest request){
		RedirectView rv = null;
		rv = new RedirectView("/erp/order/list");
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
		rv = new RedirectView("/erp/order/list");
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
		rv = new RedirectView("/erp/order/list");
		rv.setExposeModelAttributes(false);
		ModelAndView mav = new ModelAndView(rv);
		return mav;
	}
	
	public ModelAndView adminRegistForm(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		/*관리자용 사원 선택 보내기*/
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		TestVO tevo = new TestVO();
		tevo.setTests(empno);
		String authpage = request.getParameter("authpage");
		MemberVO memvo = dao.selectAMember(tevo);
		if(authpage==null||authpage.equals("")){
			authpage = memvo.getAuth();
		}
		mav.addObject("authpage", authpage);
		ArrayList<MemberVO> mlist = new ArrayList<MemberVO>();
		if(authpage.equals("ROLE_ADMIN")){
			mlist = dao.memberForReg(); 
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
		}else{
			TestVO testvo = new TestVO();
			testvo.setTests(empno);
			MemberVO mvo = dao.selectAMember(testvo);
			if(mvo.getAuth().equals("ROLE_EMPLOYEE")){
				mvo.setAuth("사원");
			}
			if(mvo.getAuth().equals("ROLE_MANAGER")){
				mvo.setAuth("팀장");
			}
			if(mvo.getAuth().equals("ROLE_ADMIN")){
				mvo.setAuth("관리자");
			}
			mlist.add(mvo);
		}
		mav.addObject("mlist", mlist);
		mav.addObject("authpage", authpage);
		mav.addObject("empno", empno);
		
		ArrayList<ProductVO> plist = dao.selectProductAll();
		mav.addObject("plist", plist);
		return mav;
	}
	
	public ModelAndView orderContents(String authpage, String orderid, String checks){
		ModelAndView mav = new ModelAndView();
		TestVO vo = new TestVO();
		if(checks.equals("1")){
			vo.setTests("'"+orderid+"' "+"AND CHECKS=1");
		}else{
			vo.setTests("'"+orderid+"' "+"AND CHECKS=0");
		}
		OrderJoinVO ovo = dao.adminSelectO(vo);
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
		long allowance = Long.parseLong(ovo.getProfit());
		if(ovo.getAuth().equals("사원")){
			allowance = (long) (allowance*0.4);
			ovo.setManage(allowance/4);
		}else if(ovo.getAuth().equals("팀장")){
			allowance = (long) (allowance*0.5);
		}
		ovo.setAllowance(allowance);
		mav.addObject("ovo", ovo);
		mav.addObject("authpage", authpage);
		return mav;
	}
	
	/*Order List*/
	public ModelAndView adminOrder(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		/*권한 정보 받아오기*/
		String authpage = request.getParameter("authpage");
		
		/*제품 받아오기*/
		ArrayList<ProductVO> plist = dao.selectProductAll();
		mav.addObject("plist", plist);
		
		/*회원 정보 가져오기*/
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		TestVO testvo = new TestVO();
		testvo.setTests(empno);
		MemberVO mvo = dao.selectAMember(testvo);
		if(authpage==null||authpage.equals("")){
			authpage = mvo.getAuth();
		}
		mav.addObject("authpage", authpage);
		
		/*팀 종류 받아오기*/
		ArrayList<TeamVO> teams = null;
		if(authpage.equals("ROLE_MANAGER")){
			testvo.setTests(mvo.getTeam());
			teams = dao.selectATeam(testvo);
		}else if(authpage.equals("ROLE_ADMIN")){
			teams = dao.selectTeam();
		}
		
		if(!authpage.equals("ROLE_MANAGER")&&!authpage.equals("ROLE_ADMIN")){
			
		}else{
		/*팀 종류 / 팀원 순으로 담을 ArrayList teamList*/
			ArrayList<MemberVO> teamList = new ArrayList<MemberVO>();
			
		/*팀 종류별 팀원 받아 HashMap에 팀별로 싣기*/
			HashMap<Integer, ArrayList<MemberVO>> map = new HashMap<Integer, ArrayList<MemberVO>>();
			for(int i=0;i<teams.size();i++){
				map.put(i, dao.teamMember(teams.get(i)));
			}
			
		/*팀 종류 / 팀원들 / 팀 종류 / 팀원들 순으로 teamList에 담기*/ 
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
		/*teamList에 있는 권한 이름 출력을 위해 변경*/
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
			mav.addObject("mlist", teamList);
		}
		/*해당 리스트는 emp 파라미터로 셀렉트 타입이 될 예정*/
		
		
		/*검색에 사용될 파라미터 받아오기*/
		
		/*부터 날짜*/
		String firstdate = request.getParameter("firstdate");
		/*까지 날짜*/
		String seconddate = request.getParameter("seconddate");
		/*제품*/
		String product = request.getParameter("product");
		/*팀 / 팀원*/
		String emp = request.getParameter("emp");
		/*대기 중인지 승인된 목록인지 선택*/
		String checks = request.getParameter("checks");
		
		
		/*SQL에 들어갈 내용 입력*/
		
		/*부터 날짜가 비었다면 조건 삭제, 입력이 되었다면 해당 날짜부터 검색*/
		if(firstdate==null||firstdate.equals("")){
			firstdate = "";
		}else{
			firstdate = firstdate.replace("-", "")+"000000";
			firstdate = "AND O.REGDATE>=TO_DATE('"+firstdate+"', 'YYYYMMDDHH24MISS') ";
		}
		
		/*까지 날짜가 비었다면 조건 삭제, 입력이 되었다면 해당 날짜까지 검색*/
		if(seconddate==null||seconddate.equals("")){
			seconddate = "";
		}else{
			seconddate = seconddate.replace("-", "")+"235959";
			seconddate = "AND O.REGDATE<=TO_DATE('"+seconddate+"', 'YYYYMMDDHH24MISS') ";
		}
		
		/*제품 코드가 비었다면 조건 삭제, 입력이 되었다면 해당 제품만 검색*/
		if(product==null||product.equals("")){
			product = "";
		}else{
			product = "AND O.PROCODE='"+product+"' ";
		}
		
		/*emp 파라미터가 비었다면 조건 삭제, 팀이 들어왔다면 팀별 내용, 사번이 들어왔다면 해당 사원만 검색했으면 좋겠지만 사실은*/
		if(!authpage.equals("ROLE_MANAGER")&&!authpage.equals("ROLE_ADMIN")){
			emp = empno;
		}
		
		if(emp==null||emp.equals("")){
			emp = "";
		}else{
			boolean check = true;
			if(teams==null){
				
			}else{
				for(int l=0;l<teams.size();l++){
					String tempemp = teams.get(l).getTeam();
					if(emp.equals(tempemp)){
						emp = "AND S.TEAM='"+emp+"' ";
						check = false;
					}
				}
			}
			if(check==true){
				emp = "AND O.EMPNO='"+emp+"' ";
			}
		}
		
		/*0이면 승인 대기, 1이면 승인 목록*/
		if(checks==null||checks.equals("0")||checks.equals("")){
			checks = "AND CHECKS=0";
		}else{
			checks = "AND CHECKS=1";
		}
		
		/*DB에 접근할 객체 생성 및 내용 입력*/
		TestVO vo = new TestVO();
		vo.setTests(firstdate+seconddate+product+emp+checks);
		
		/*객체를 매개변수로 주문 목록을 가져와서 Join DB에 싣기*/
		ArrayList<OrderJoinVO> list = dao.adminSelectOrders(vo);
		/*날짜 및 권한 이름 가공, 수당 추가*/
		for(OrderJoinVO ovo:list){
			Date date = ovo.getRegdate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
			/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");*/
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
			long allowance = Long.parseLong(ovo.getProfit());
			if(ovo.getAuth().equals("사원")){
				allowance = (long) (allowance*0.4);
				ovo.setManage(allowance/4);
			}else if(ovo.getAuth().equals("팀장")){
				allowance = (long) (allowance*0.5);
			}
			ovo.setAllowance(allowance);
		}
		
		/*DB 접근에 사용된 checks를 변형해서 selected에 이용*/
		if(checks.contains("1")){
			checks = "1";
		}else{
			checks = "0";
		}
		mav.addObject("checks", checks);
		
		/*받아온 리스트를 페이지에 전달*/
		mav.addObject("alist", list);
		return mav;
	}
	
}
