package com.sales.erp.notice.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.notice.dao.NoticeDAO;
import com.sales.erp.notice.vo.NoticeReplyVO;
import com.sales.erp.notice.vo.NoticeSearchVO;
import com.sales.erp.notice.vo.NoticeVO;
import com.sales.erp.notice.vo.PagingVO;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO dao;

	public ModelAndView getNoticeList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		int pg = 1;
		String strPg = request.getParameter("pg");
		String word = request.getParameter("word");

		if (word == null || word.equals("")) {
			word = "";
		}
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		NoticeSearchVO search = new NoticeSearchVO();
		search.setWord("%" + word + "%");

		int rowSize = 10; // 한페이지에 출력되는 게시글 수
		int start = (pg * rowSize) - (rowSize - 1); // 출력되는 페이지 시작글 번호
		int end = pg * rowSize; // 출력되는 페이지 마지막글 번호
		int block = 5; // 페이지 네비게이션 범위 << [1] [2] [3] [4] [5]>>
		int fromPage = ((pg - 1) / block * block) + 1; // 페이지 네비게이션 시작
		int toPage = ((pg - 1) / block * block) + block; // 페이지 네비게이션 마지막

		int total = dao.getNoticeCount(search); // 총 공지사항 수
		int allPage = (int) Math.ceil(total / (double) rowSize); // 전체 페이지수
		if (toPage > allPage) {
			toPage = allPage;
		}

		PagingVO paging = new PagingVO();
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

		ArrayList<NoticeVO> list = dao.getNoticeList(search);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("pg", pg);
		mav.addObject("word", word);

		return mav;
	}

	public void noticeWrite(HttpServletRequest request) {
		NoticeVO vo = new NoticeVO();
		vo.setName(request.getParameter("name"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		dao.noticeWrite(vo);
	}

	public ModelAndView noticeContent(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String num = request.getParameter("num");
		NoticeVO noticeVo = dao.noticeContent(num);						//공지사항 내용 불러오는부분
		ArrayList<NoticeReplyVO> replyList = dao.replyList(num);		//공지사항내 댓글 불러오는 부분
		
		int count=dao.getReplyCount(num);
		
		mav.addObject("noticeVo", noticeVo);
		mav.addObject("replyList", replyList);
		mav.addObject("count", count);
		return mav;
	}

	public ModelAndView noticeUpdateForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String num = request.getParameter("num");
		NoticeVO noticeVo = dao.noticeContent(num);
		mav.addObject("noticeVo", noticeVo);
		return mav;
	}

	public void noticeUpdate(HttpServletRequest request) {
		NoticeVO vo = new NoticeVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setName(request.getParameter("name"));
		vo.setContent(request.getParameter("content"));
		vo.setTitle(request.getParameter("title"));
		dao.noticeUpdate(vo);
	}

	public void noticeDelete(HttpServletRequest request) {
		String num = request.getParameter("num");
		dao.noticeDelete(num);
		dao.replyAllDelete(num);
	}

	public void replyWrite(HttpServletRequest request) {
		NoticeReplyVO vo = new NoticeReplyVO();
		vo.setEmpno(request.getParameter("empno"));
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setReply(request.getParameter("reply"));
		dao.replyWrite(vo);
	}

	public ModelAndView replyUpdateForm(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		NoticeReplyVO voParam = new NoticeReplyVO();
		voParam.setNum(Integer.parseInt(request.getParameter("num")));
		voParam.setReplynum(Integer.parseInt(request.getParameter("replynum")));
		NoticeReplyVO vo = dao.replyUpdateForm(voParam);
		mav.addObject("vo", vo);		
		return mav;
	}

	public void replyUpdate(HttpServletRequest request) {
		NoticeReplyVO vo = new NoticeReplyVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setReplynum(Integer.parseInt(request.getParameter("replynum")));
		vo.setReply(request.getParameter("reply"));
		dao.replyUpdate(vo);		
	}

	public void replyDelete(HttpServletRequest request) {
		NoticeReplyVO vo = new NoticeReplyVO();
		vo.setReplynum(Integer.parseInt(request.getParameter("replynum")));
		dao.replyDelete(vo);
	}

}
