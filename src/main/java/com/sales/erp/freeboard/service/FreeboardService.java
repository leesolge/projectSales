package com.sales.erp.freeboard.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.freeboard.dao.FreeboardDAO;
import com.sales.erp.freeboard.vo.FreeboardPagingVO;
import com.sales.erp.freeboard.vo.FreeboardReplyVO;
import com.sales.erp.freeboard.vo.FreeboardSearchVO;
import com.sales.erp.freeboard.vo.FreeboardVO;
import com.sales.erp.member.vo.MemberVO;

@Service
public class FreeboardService {

	@Autowired
	private FreeboardDAO dao;
	
	public ModelAndView getFreeboardList(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		FreeboardVO vo = new FreeboardVO();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName(); //empno 값 가져오기
		
		String team = dao.getTeamTeamAuth(empno); //empno 값을 이용해서 team 값 가져오기
		vo.setTeam(team); //FreeboardVO의 team 필드에 가져온 team 값을 넣어줌.
		
		int pg=1;
		
		String strPg =request.getParameter("pg");
		String word = request.getParameter("word");
		
	    if(word == null || word.equals("")){
	    	word = "";
	    }    
		if(strPg != null){
			pg = Integer.parseInt(strPg);
		}
		
		FreeboardSearchVO search = new FreeboardSearchVO();
	    search.setWord("%" + word + "%");
	    search.setTeam(team); // 자유게시판에 들어갔을 때 같은 팀원들만 게시글 볼 수 있게 해줌.
	    
		int rowSize=10; // 한 페이지에 출력되는 글 수
		
		int start = (pg * rowSize) - (rowSize - 1); // 출력되는 페이지 시작글 번호
		int end = pg * rowSize; // 출력되는 페이지 마지막글 번호
		int block = 5; // 페이지 네비게이션 범위 << [1] [2] [3] [4] [5]>>
		int fromPage = ((pg - 1) / block * block) + 1; // 페이지 네비게이션 시작
		int toPage = ((pg - 1) / block * block) + block; // 페이지 네비게이션 마지막

		int total = dao.getFreeboardCount(search); // 총 공지사항 수
		int allPage = (int) Math.ceil(total / (double) rowSize); // 전체 페이지수
		if (toPage > allPage) {
			toPage = allPage;
		}

		FreeboardPagingVO paging = new FreeboardPagingVO();
		paging.setPage(pg);
		paging.setStart(start);
		paging.setEnd(end);
		paging.setTotal(total);
		paging.setAllPage(allPage);
		paging.setBlock(block);
		paging.setFromPage(fromPage);
		paging.setToPage(toPage);
		search.setEnd(end);
		search.setStart(start);
		search.setTeam(team);
		
		ArrayList<FreeboardVO> list = dao.getFreeboardList(search);
		
		mav.addObject("team", team);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("pg", pg);
		mav.addObject("word", word);
		
		return mav;
	}
	
	//글 쓰기
	public void freeboardWrite(HttpServletRequest request){
		FreeboardVO vo = new FreeboardVO();
		MemberVO mvo = new MemberVO();
		vo.setTeam(mvo.getTeam());
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		
		String team = dao.getTeamTeamAuth(empno);
		vo.setTeam(team);
		
		vo.setName(request.getParameter("name"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		dao.freeboardWrite(vo);
	}
	
	public ModelAndView freeboardContent(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String num = request.getParameter("num");
		FreeboardVO freeboardVO = dao.freeboardContent(num);
		ArrayList<FreeboardReplyVO> replyList = dao.replyList(num);
		
		int count = dao.getReplyCount(num);
		
		mav.addObject("freeboardVO", freeboardVO);
		mav.addObject("replyList", replyList);
		mav.addObject("count", count);
		return mav;
	}
	
	public ModelAndView freeboardUpdateForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String num = request.getParameter("num");
		FreeboardVO freeboardVo = dao.freeboardContent(num);
		mav.addObject("freeboardVo", freeboardVo);
		return mav;
	}
	
	//글 수정
	public void freeboardUpdate(HttpServletRequest request){
		FreeboardVO vo = new FreeboardVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setName(request.getParameter("name"));
		vo.setContent(request.getParameter("content"));
		vo.setTitle(request.getParameter("title"));
		dao.freeboardUpdate(vo);
	}
	
	//글 삭제
	public void freeboardDelete(HttpServletRequest request){
		String num = request.getParameter("num");
		dao.freeboardDelete(num);
	}
	
	/*여기서부터 댓글*/
	
	public void replyWrite(HttpServletRequest request){
		FreeboardReplyVO vo = new FreeboardReplyVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")));//글 번호
		vo.setEmpno(request.getParameter("empno"));//로그인 한 
		vo.setReply(request.getParameter("reply"));//댓글 내용
		
		dao.replyWrite(vo);
	}  
	
	public ModelAndView reReplyWriteForm(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		FreeboardReplyVO vo = new FreeboardReplyVO();
		vo.setReplynum(Integer.parseInt(request.getParameter("replynum")));
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setEmpno(request.getParameter("empno"));
		mav.addObject("vo", vo);
		return mav;
	}
	
	//대댓글 작성
	public void reReplyWrite(HttpServletRequest request) {
		FreeboardReplyVO vo = new FreeboardReplyVO();
		vo.setReplynum(Integer.parseInt(request.getParameter("replynum")));//댓글 번호
		vo.setNum(Integer.parseInt(request.getParameter("num")));//글 번호
		vo.setEmpno(request.getParameter("empno"));
		vo.setReply(request.getParameter("reply"));
		
		dao.reReplyWrite(vo);
	}
	
	public ModelAndView replyUpdateForm(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		FreeboardReplyVO voParam = new FreeboardReplyVO();
		//voParam.setNum(Integer.parseInt(request.getParameter("num")));
		voParam.setReplynum(Integer.parseInt(request.getParameter("replynum")));
		voParam.setChild(Integer.parseInt(request.getParameter("child")));
		FreeboardReplyVO vo = dao.replyUpdateForm(voParam);
		mav.addObject("vo", vo);
		return mav;
	}
	
	public void replyUpdate(HttpServletRequest request){
		FreeboardReplyVO vo = new FreeboardReplyVO();
		vo.setReplynum(Integer.parseInt(request.getParameter("replynum")));
		vo.setChild(Integer.parseInt(request.getParameter("child")));
		vo.setReply(request.getParameter("reply"));
		dao.replyUpdate(vo);
	}
	
	public void replyDelete(HttpServletRequest request){
		FreeboardReplyVO vo = new FreeboardReplyVO();
		if (Integer.parseInt(request.getParameter("child"))==0) {
			vo.setReplynum(Integer.parseInt(request.getParameter("replynum")));
			dao.replyDelete(vo);
		} else if (Integer.parseInt(request.getParameter("child"))!=0) {
			vo.setReplynum(Integer.parseInt(request.getParameter("replynum")));
			vo.setChild(Integer.parseInt(request.getParameter("child")));
			dao.reReplyDelete(vo);
		}
		
	}

	
}
