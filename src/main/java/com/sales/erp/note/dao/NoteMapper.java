package com.sales.erp.note.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.note.vo.JoinVO;
import com.sales.erp.note.vo.NoteSearchVO;
import com.sales.erp.note.vo.NoteVO;

public interface NoteMapper extends Serializable{
	ArrayList<NoteVO> selectUncheckedAll(NoteSearchVO vo);
	void deleteOne(int noteNum);
	void restoreOne(int noteNum);
	ArrayList<NoteVO> selectSend(String empno);
	ArrayList<NoteVO> selectReceive(String empno);
	NoteVO viewNote(int noteNum);
	void checkNote(int noteNum);
	int countReceiveAll(NoteSearchVO vo);
	int countSendAll(NoteSearchVO vo);
	ArrayList<NoteVO> selectReceiveAll(NoteSearchVO vo);
	ArrayList<NoteVO> selectSendAll(NoteSearchVO vo);
	ArrayList<MemberVO> receiverCheck(String empno);
	void writePro(NoteVO vo);
	MemberVO getNameTeamAuth(String empno);
	int adminSelectCount(NoteSearchVO vo);
	ArrayList<JoinVO> adminSelectAll(NoteSearchVO vo);

}
