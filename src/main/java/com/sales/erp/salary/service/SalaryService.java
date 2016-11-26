package com.sales.erp.salary.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.order.vo.OrderJoinVO;
import com.sales.erp.order.vo.TeamVO;
import com.sales.erp.salary.dao.SalaryDAO;
import com.sales.erp.salary.vo.SalaryJoinVO;
import com.sales.erp.salary.vo.SalaryVO;
import com.sales.erp.salary.vo.TempVO;
import com.sales.erp.salary.vo.VOforSQL;

public class SalaryService {

	@Autowired
	private SalaryDAO dao;
	
	/*selectlist : 셀렉션 옵션을 위한 리스트*/
	/*mlist : 팀 옵션을 위한 리스트*/
	public ModelAndView adminSalary(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<TempVO> selectionlist = new ArrayList<TempVO>();
		ArrayList<SalaryVO> templist = new ArrayList<SalaryVO>();
		ArrayList<SalaryJoinVO> sjlist = new ArrayList<SalaryJoinVO>();
		
		/*예정 월급과 지급된 월급을 보여주기 위한 selection 항목 작성*/
		Calendar today = Calendar.getInstance();
		int thisYear = today.get(Calendar.YEAR);
		int thisMonth = today.get(Calendar.MONTH);
		
		TempVO vo = new TempVO();
		
		String compareDate;
		if(thisMonth<9){
			compareDate = String.valueOf(thisYear) + "0" + String.valueOf(thisMonth+1);
		}else{
			compareDate = String.valueOf(thisYear) + String.valueOf(thisMonth+1);
		}
		vo.setViewdate(compareDate.substring(0, 4)+"년 "+compareDate.substring(4, 6)+"월");
		compareDate = String.valueOf(thisYear) + String.valueOf(thisMonth+1) + "01000000";
		vo.setDatevalue(compareDate);
		selectionlist.add(vo);
		templist = dao.dateObject();
		for(SalaryVO savo : templist){
			String date = savo.getSalarydate();
			TempVO tvo = new TempVO();
			String year = date.substring(0, 4);
			String month = date.substring(5, 7);
			tvo.setViewdate(year+"년 "+month+"월");
			date = date.trim();
			date = date.replace(":", "");
			date = date.replace("-", "");
			tvo.setDatevalue(date);
			selectionlist.add(tvo);
		}
		mav.addObject("selectlist", selectionlist);
		
		/*팀 종류 받아오기*/
		ArrayList<TeamVO> teams = null;
		teams = dao.selectTeam();
		ArrayList<MemberVO> teamList = new ArrayList<MemberVO>();

		/*팀 종류별 팀원 받아 HashMap에 팀별로 싣기*/
		HashMap<Integer, ArrayList<MemberVO>> map = new HashMap<Integer, ArrayList<MemberVO>>();
		for(int i=0;i<teams.size();i++){
			map.put(i, dao.teamMember(teams.get(i)));
		}
		for (int j = 0; j < teams.size(); j++) {
			MemberVO temp = new MemberVO();
			temp.setAuth("");
			temp.setEmpno(teams.get(j).getTeam());
			temp.setName("");
			teamList.add(temp);
			for (int k = 0; k < map.get(j).size(); k++) {
				teamList.add(map.get(j).get(k));
			}
		}
		
		/*teamList에 있는 권한 이름 출력을 위해 변경*/
		for (MemberVO mvo : teamList) {
			if (mvo.getAuth().equals("ROLE_EMPLOYEE")) {
				mvo.setAuth("사원");
			}
			if (mvo.getAuth().equals("ROLE_MANAGER")) {
				mvo.setAuth("팀장");
			}
		}
		mav.addObject("mlist", teamList);
		
		String datevalue = request.getParameter("datevalue");
		
		if(datevalue==null||datevalue.equals("")){
			datevalue = String.valueOf(thisYear) + String.valueOf(thisMonth+1);
			datevalue = datevalue + "01000000";
		}
		/*시작날짜 역할도 하는 datevalue*/
		mav.addObject("datevalue", datevalue);
		String dateview = datevalue.substring(0, 4)+"년 "+datevalue.substring(4, 6)+"월";
		mav.addObject("dateview", dateview);
		
		/*끝날짜 가공*/
		String startdate = datevalue;
		String enddate = datevalue;
		int endyear = Integer.parseInt(datevalue.substring(0, 4));
		int endmonth = Integer.parseInt(datevalue.substring(4, 6));
		endmonth = endmonth+1;
		if(endmonth>12){
			endmonth = 1;
			endyear = endyear+1;
		}
		if(String.valueOf(endmonth).length()!=2){
			enddate = String.valueOf(endyear)+"0"+String.valueOf(endmonth);
		}else{
			enddate = String.valueOf(endyear)+String.valueOf(endmonth);
		}
		enddate = enddate + "01000000";
		
		String emp = request.getParameter("emp");
		
		if(emp==null||emp.equals("")){
			emp = "";
		}else{
			boolean check = true;
			for (int l=0;l<teams.size();l++) {
				String tempemp = teams.get(l).getTeam();
				if (emp.equals(tempemp)) {
					if(emp.equals("자재팀")){
						mav.addObject("budget", "1");
					}
					emp = "AND M.TEAM='" + emp + "' ";
					check = false;
				}
			}
			if(check==true){
				TempVO ttvo = new TempVO();
				ttvo.setDatevalue(emp);
				MemberVO mmvo = dao.selectAMember(ttvo);
				emp = "AND S.EMPNO='"+emp+"' ";
				if(mmvo.getTeam().equals("자재팀")){
					mav.addObject("budget", "1");
				}
			}
		}
		TempVO temvo = new TempVO();
		temvo.setDatevalue(emp);
		ArrayList<MemberVO> memberList = dao.tempTeam(temvo);
		
		String sql = emp + " AND S.REGDATE>=TO_DATE('"+startdate+"', 'YYYYMMDDHH24MISS') AND S.REGDATE<TO_DATE('"+enddate+"', 'YYYYMMDDHH24MISS')";
		temvo.setDatevalue(sql);
		ArrayList<OrderJoinVO> orderjoinlist = dao.selectOrders(temvo);
		for(OrderJoinVO ovo:orderjoinlist){
			Date date = ovo.getRegdate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
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
		mav.addObject("mylist", orderjoinlist);
		
		if(compareDate.equals(datevalue)){
			mav.addObject("equal", "1");
			VOforSQL vosql = new VOforSQL();
			for(MemberVO mbvo:memberList){
				if(mbvo.getTeam().contains("영업")){
					if(mbvo.getAuth().equals("ROLE_EMPLOYEE")){
						SalaryJoinVO svo = new SalaryJoinVO();
						vosql.setEmpno(mbvo.getEmpno());
						vosql.setStartdate(startdate);
						vosql.setEnddate(enddate);
						String tempsa = dao.profitOfEmpl(vosql);
						if(tempsa==null||tempsa.equals("")){
							tempsa = "0";
						}
						long salary = (long) (Long.parseLong(tempsa)*0.4);
						svo.setTeam(mbvo.getTeam());
						svo.setAllowance(salary);
						svo.setSalary(salary);
						svo.setName(mbvo.getName());
						svo.setAuth("사원");
						long tax1 = (long) (salary*0.06);
						long tax2 = (long) (salary*0.006);
						long reals = salary-tax1-tax2;
						svo.setEmpno(mbvo.getEmpno());
						svo.setSalarydate(startdate);
						svo.setTax1(tax1);
						svo.setTax2(tax2);
						svo.setReals(reals);
						sjlist.add(svo);
					}else{
						SalaryJoinVO svo = new SalaryJoinVO();
						vosql.setEmpno(mbvo.getEmpno());
						vosql.setStartdate(startdate);
						vosql.setEnddate(enddate);
						String tempsa = dao.profitOfEmpl(vosql);
						if(tempsa==null||tempsa.equals("")){
							tempsa = "0";
						}
						long salary = (long) (Long.parseLong(tempsa)*0.5);
						svo.setAllowance(salary);
						svo.setTeam(mbvo.getTeam());
						svo.setName(mbvo.getName());
						svo.setAuth("팀장");
						vosql.setTeam(mbvo.getTeam());
						vosql.setAuth(mbvo.getAuth());
						tempsa = dao.profitOfManager(vosql);
						if(tempsa==null||tempsa.equals("")){
							tempsa = "0";
						}
						long manager = (long) (Long.parseLong(tempsa));
						svo.setManager(manager);
						salary = (salary + manager);
						svo.setSalary(salary);
						long tax1 = (long) (salary*0.06);
						long tax2 = (long) (salary*0.006);
						long reals = salary-tax1-tax2;
						svo.setEmpno(mbvo.getEmpno());
						svo.setSalarydate(startdate);
						svo.setTax1(tax1);
						svo.setTax2(tax2);
						svo.setReals(reals);
						sjlist.add(svo);
					}
				}else{
					SalaryJoinVO svo = new SalaryJoinVO();
					long salary = 2150000;
					long tax1 = (long) (salary*0.06);
					long tax2 = (long) (salary*0.006);
					svo.setName(mbvo.getName());
					svo.setAuth("사원");
					svo.setTeam(mbvo.getTeam());
					svo.setEmpno(mbvo.getEmpno());
					svo.setAllowance(0);
					svo.setManager(0);
					svo.setReals(salary-tax1-tax2);
					svo.setSalary(salary);
					svo.setTax1(tax1);
					svo.setTax2(tax2);
					sjlist.add(svo);
				}
			}
			mav.addObject("salarylist", sjlist);
		}else{
			mav.addObject("equal", "0");
			String query = emp + "AND S.SALARYDATE=TO_DATE('"+datevalue+"',  'YYYYMMDDHH24MISS')";
			temvo.setDatevalue(query);
			sjlist = dao.adminSalary(temvo);
			for(SalaryJoinVO sjoinvo:sjlist){
				if(sjoinvo.getAuth().equals("ROLE_EMPLOYEE")){
					sjoinvo.setAuth("사원");
				}else{
					sjoinvo.setAuth("팀장");
				}
			}
			mav.addObject("salarylist", sjlist);
		}
		
		return mav;
	}
		
	
	/* selectlist : 셀렉트 옵션(datevalue / viewdate) */
	/* slist : 월급 내역(SalaryVO) */
	/* datevalue : 날짜값 (parameter) */
	/* dateview : 출력값 */
	/* mylist : 내 실적 (OrderJoinVO) */ 
	/* teamlist : 팀 실적 (OrderJoinVO) */
	/* equal : 예정 월급이면 1 아니면 0 */
	public ModelAndView viewSalary(HttpServletRequest request) {
		String datevalue = request.getParameter("datevalue");
		ModelAndView mav = new ModelAndView();
		/*현재 사용자 사번, 이름, 팀, 직급 받아오기*/
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		TempVO vo = new TempVO();
		vo.setDatevalue(empno);
		MemberVO membervo = dao.selectMember(vo);
		
		/* templist:하위 세개 항목을 잠시 담아둠 */
		/* slist:전체를 담을 리스트 */
		ArrayList<SalaryVO> templist = new ArrayList<SalaryVO>();
		ArrayList<SalaryVO> slist = new ArrayList<SalaryVO>();
		ArrayList<TempVO> list = new ArrayList<TempVO>();
		
		/*이번달 날짜와 받아온 날짜를 비교하여 예정 월급을 보여줄지 받은 월급을 보여줄지 결정*/
		/*날짜 select option을 만들어줄 객체 생성*/
		Calendar today = Calendar.getInstance();
		int thisYear = today.get(Calendar.YEAR);
		int thisMonth = today.get(Calendar.MONTH);
		
		String compareDate;
		if(thisMonth<9){
			compareDate = String.valueOf(thisYear) + "0" + String.valueOf(thisMonth+1);
		}else{
			compareDate = String.valueOf(thisYear) + String.valueOf(thisMonth+1);
		}
		vo.setViewdate(compareDate.substring(0, 4)+"년 "+compareDate.substring(4, 6)+"월");
		compareDate = String.valueOf(thisYear) + String.valueOf(thisMonth+1) + "01000000";
		vo.setDatevalue(compareDate);
		list.add(vo);
		TempVO ab = new TempVO();
		ab.setDatevalue(empno);
		templist = dao.salaryList(ab);
		for(SalaryVO savo : templist){
			String date = savo.getSalarydate();
			TempVO tvo = new TempVO();
			String year = date.substring(0, 4);
			String month = date.substring(5, 7);
			tvo.setViewdate(year+"년 "+month+"월");
			date = date.replace(" ", "");
			date = date.replace(":", "");
			date = date.replace("-", "");
			tvo.setDatevalue(date);
			
			/*savo.salarydate는 jsp에서 값을 비교하여 출력해줌*/
			savo.setSalarydate(date);
			list.add(tvo);
		}
		mav.addObject("selectlist", list);
		
		if(datevalue==null||datevalue.equals("")){
			datevalue = String.valueOf(thisYear) + String.valueOf(thisMonth+1);
			datevalue = datevalue + "01000000";
		}
		/*시작날짜 역할도 하는 datevalue*/
		mav.addObject("datevalue", datevalue);
		String dateview = datevalue.substring(0, 4)+"년 "+datevalue.substring(4, 6)+"월";
		mav.addObject("dateview", dateview);
		
		/*끝날짜 가공*/
		String enddate = datevalue;
		int endyear = Integer.parseInt(datevalue.substring(0, 4));
		int endmonth = Integer.parseInt(datevalue.substring(4, 6));
		endmonth = endmonth+1;
		if(endmonth>12){
			endmonth = 1;
			endyear = endyear+1;
		}
		if(String.valueOf(endmonth).length()!=2){
			enddate = String.valueOf(endyear)+"0"+String.valueOf(endmonth);
		}else{
			enddate = String.valueOf(endyear)+String.valueOf(endmonth);
		}
		enddate = enddate + "01000000";
		
		/*월급 정보 받을 준비*/
		VOforSQL vosql = new VOforSQL();
		vosql.setAuth(membervo.getAuth());
		vosql.setEmpno(membervo.getEmpno());
		vosql.setTeam(membervo.getTeam());
		vosql.setStartdate(datevalue);
		vosql.setEnddate(enddate);
		
		if(compareDate.equals(datevalue)){
			mav.addObject("equal", "1");
		}else{
			mav.addObject("equal", "0");
		}
		/* 이번달 예정 월급 */
		if (membervo.getAuth().equals("ROLE_MANAGER")) {
			String tempprofit = dao.profitOfEmpl(vosql);
			if(tempprofit==null||tempprofit.equals("")){
				tempprofit = "0";
			}
			long allowance = (long) (Long.parseLong(tempprofit) * 0.5);
			String tempmanager = dao.profitOfEmpl(vosql);
			if(tempmanager==null||tempmanager.equals("")){
				tempmanager = "0";
			}
			long manager = (long) (Long.parseLong(tempmanager));
			long salary = allowance + manager;
			long tax1 = (long) (salary * 0.06);
			long tax2 = (long) (salary * 0.006);
			long reals = salary - tax1 - tax2;
			SalaryVO salvo = new SalaryVO();
			salvo.setAllowance(allowance);
			salvo.setEmpno(empno);
			salvo.setManager(manager);
			salvo.setReals(reals);
			salvo.setSalary(salary);
			salvo.setSalarydate(compareDate);
			salvo.setTax1(tax1);
			salvo.setTax2(tax2);
			slist.add(salvo);
			for (int i = 0; i < templist.size(); i++) {
				slist.add(templist.get(i));
			}
			mav.addObject("slist", slist);
			
			/*내 실적*/
			ArrayList<OrderJoinVO> olist = dao.selectMonthlyPerformance(vosql);
			for(OrderJoinVO ovo:olist){
				Date date = ovo.getRegdate();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
				String changes = sdf.format(date);
				ovo.setChanges(changes);
				long allow = Long.parseLong(ovo.getProfit());
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
					allow = (long) (Long.parseLong(ovo.getProfit())*0.4);
				}else if(ovo.getAuth().equals("팀장")){
					allow = (long) (Long.parseLong(ovo.getProfit())*0.5);
				}
				ovo.setAllowance(allow);
			}
			mav.addObject("mylist", olist);
			
			ArrayList<OrderJoinVO> team = dao.team(vosql);
			mav.addObject("teamlist", team);
		} else if (membervo.getAuth().equals("ROLE_EMPLOYEE")) {
			String tempprofit = dao.profitOfEmpl(vosql);
			if(tempprofit==null||tempprofit.equals("")){
				tempprofit = "0";
			}
			long allowance = (long) (Long.parseLong(tempprofit) * 0.4);
			long salary = allowance;
			long manager = 0;
			long tax1 = (long) (salary * 0.06);
			long tax2 = (long) (salary * 0.006);
			long reals = salary - tax1 - tax2;
			SalaryVO salvo = new SalaryVO();
			salvo.setAllowance(allowance);
			salvo.setEmpno(empno);
			salvo.setManager(manager);
			salvo.setReals(reals);
			salvo.setSalary(salary);
			salvo.setSalarydate(compareDate);
			salvo.setTax1(tax1);
			salvo.setTax2(tax2);
			slist.add(salvo);
			for (int i = 0; i < templist.size(); i++) {
				slist.add(templist.get(i));
			}
			mav.addObject("slist", slist);
			
			/*내 실적*/
			ArrayList<OrderJoinVO> olist = dao.selectMonthlyPerformance(vosql);
			for(OrderJoinVO ovo:olist){
				Date date = ovo.getRegdate();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
				String changes = sdf.format(date);
				ovo.setChanges(changes);
				long allow = Long.parseLong(ovo.getProfit());
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
					allow = (long) (Long.parseLong(ovo.getProfit())*0.4);
				}else if(ovo.getAuth().equals("팀장")){
					allow = (long) (Long.parseLong(ovo.getProfit())*0.5);
				}
				ovo.setAllowance(allow);
			}
			mav.addObject("mylist", olist);
		} else {
			SalaryVO salvo = new SalaryVO();
			long salary = 2150000;
			long tax1 = (long) (salary*0.06);
			long tax2 = (long) (salary*0.006);
			salvo.setEmpno(membervo.getEmpno());
			salvo.setAllowance(0);
			salvo.setManager(0);
			salvo.setReals(salary-tax1-tax2);
			salvo.setSalary(salary);
			salvo.setSalarydate(compareDate);
			salvo.setTax1(tax1);
			salvo.setTax2(tax2);
			slist.add(salvo);
			for (int i = 0; i < templist.size(); i++) {
				slist.add(templist.get(i));
			}
			mav.addObject("slist", slist);
		}
		return mav;
	}
	
	/*@Scheduled(cron="15 * * * * *")*/
	@Scheduled(cron="0 0 0 1 * *")
	public void confirmSalaries(){
		
		ArrayList<MemberVO> memberList = dao.allMemberExceptAdmin();
		long all = 0;
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH)+1;/*실험 중이니 나중에 +2>>+1로 바꿀 것*/
		String cYear = String.valueOf(year);
		String cMonth = String.valueOf(month);
		if(cMonth.length()<2){
			cMonth = "0"+cMonth;
		}
		String pMonth;
		String pYear;
		if(month-1<0){
			pMonth = "12";
			pYear = String.valueOf(year-1);
		}else{
			pMonth = String.valueOf(month-1);
			if(pMonth.length()<2){
				pMonth = "0"+pMonth;
			}
			pYear = String.valueOf(year);
		}
		String enddate = cYear+cMonth+"01000000";
		String startdate = pYear+pMonth+"01000000";
		VOforSQL vosql = new VOforSQL();
		SalaryVO svo = new SalaryVO();
		
		for(MemberVO vo:memberList){
			if(vo.getTeam().contains("영업")){
				if(vo.getAuth().equals("ROLE_EMPLOYEE")){
					vosql.setEmpno(vo.getEmpno());
					vosql.setStartdate(startdate);
					vosql.setEnddate(enddate);
					String tempsa = dao.profitOfEmpl(vosql);
					if(tempsa==null||tempsa.equals("")){
						tempsa = "0";
					}
					long salary = (long) (Long.parseLong(tempsa)*0.4);
					svo.setAllowance(salary);
					svo.setSalary(salary);
					long tax1 = (long) (salary*0.06);
					long tax2 = (long) (salary*0.006);
					long reals = salary-tax1-tax2;
					svo.setEmpno(vo.getEmpno());
					svo.setSalarydate(startdate);
					svo.setTax1(tax1);
					svo.setTax2(tax2);
					svo.setReals(reals);
					dao.insertSalary(svo);
				}else{
					vosql.setEmpno(vo.getEmpno());
					vosql.setStartdate(startdate);
					vosql.setEnddate(enddate);
					String tempsa = dao.profitOfEmpl(vosql);
					if(tempsa==null||tempsa.equals("")){
						tempsa = "0";
					}
					long salary = (long) (Long.parseLong(tempsa)*0.5);
					svo.setAllowance(salary);
					vosql.setTeam(vo.getTeam());
					vosql.setAuth(vo.getAuth());
					tempsa = dao.profitOfManager(vosql);
					if(tempsa==null||tempsa.equals("")){
						tempsa = "0";
					}
					long manager = (long) (Long.parseLong(tempsa));
					svo.setManager(manager);
					salary = (salary + manager);
					svo.setSalary(salary);
					long tax1 = (long) (salary*0.06);
					long tax2 = (long) (salary*0.006);
					long reals = salary-tax1-tax2;
					svo.setEmpno(vo.getEmpno());
					svo.setSalarydate(startdate);
					svo.setTax1(tax1);
					svo.setTax2(tax2);
					svo.setReals(reals);
					dao.insertSalary(svo);
				}
			}else{
				long salary = 2150000;
				long tax1 = (long) (salary*0.06);
				long tax2 = (long) (salary*0.006);
				svo.setEmpno(vo.getEmpno());
				svo.setAllowance(0);
				svo.setManager(0);
				svo.setReals(salary-tax1-tax2);
				svo.setSalary(salary);
				svo.setTax1(tax1);
				svo.setTax2(tax2);
				dao.insertSalary(svo);
			}
			all += svo.getSalary();
		}
	}
	
	/*public ModelAndView viewsSalary(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		ArrayList<TempVO> selectlist = new ArrayList<TempVO>();
		Calendar today = Calendar.getInstance();
		int thisYear = today.get(Calendar.YEAR);
		int thisMonth = today.get(Calendar.MONTH);
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
		for(OrderJoinVO ovo:perform){
			Date date = ovo.getRegdate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
			String changes = sdf.format(date);
			ovo.setChanges(changes);
			long allowance = Long.parseLong(ovo.getProfit());
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
				allowance = (long) (allowance*0.4);
			}else if(ovo.getAuth().equals("팀장")){
				allowance = (long) (allowance*0.5);
			}
			ovo.setAllowance(allowance);
			payment = payment+ovo.getAllowance();
		}
		
		for(int i=0;i<12;i++){
			today.set(thisYear, thisMonth, 1);
			TempVO vo = new TempVO();
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
	}*/
}
