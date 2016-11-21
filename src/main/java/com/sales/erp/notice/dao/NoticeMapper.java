package com.sales.erp.notice.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.notice.vo.NoticeReplyVO;
import com.sales.erp.notice.vo.NoticeSearchVO;
import com.sales.erp.notice.vo.NoticeVO;

public interface NoticeMapper extends Serializable {

	ArrayList<NoticeVO> getNoticeList(NoticeSearchVO search);

	int getNoticeCount(NoticeSearchVO search);

	void noticeWrite(NoticeVO vo);

	NoticeVO noticeContent(String num);

	void noticeUpdate(NoticeVO vo);

	void noticeDelete(String num);

	void replyWrite(NoticeReplyVO vo);

	ArrayList<NoticeReplyVO> replyList(String num);

	NoticeReplyVO replyUpdateForm(NoticeReplyVO voParam);

	void replyUpdate(NoticeReplyVO vo);

	void replyDelete(NoticeReplyVO vo);
}
