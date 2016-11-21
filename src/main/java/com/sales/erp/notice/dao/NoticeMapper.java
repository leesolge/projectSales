package com.sales.erp.notice.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.notice.vo.NoticeSearchVO;
import com.sales.erp.notice.vo.NoticeVO;

public interface NoticeMapper extends Serializable {

	ArrayList<NoticeVO> getNoticeList(NoticeSearchVO search);

	int getNoticeCount(NoticeSearchVO search);

	void noticeWrite(NoticeVO vo);

	NoticeVO noticeContent(String num);
}
