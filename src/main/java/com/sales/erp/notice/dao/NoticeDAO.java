package com.sales.erp.notice.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.notice.vo.NoticeSearchVO;
import com.sales.erp.notice.vo.NoticeVO;


@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<NoticeVO> getNoticeList(NoticeSearchVO search) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		return mapper.getNoticeList(search);
	}
	
	public int getNoticeCount(NoticeSearchVO search) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		return mapper.getNoticeCount(search);
	}

	public void noticeWrite(NoticeVO vo) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		mapper.noticeWrite(vo);	
	}

	public NoticeVO noticeContent(String num) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		return mapper.noticeContent(num);
	}


	
}
