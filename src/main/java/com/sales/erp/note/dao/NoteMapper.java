package com.sales.erp.note.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.note.vo.NoteSearchVO;
import com.sales.erp.note.vo.NoteVO;

public interface NoteMapper extends Serializable{

	 ArrayList<NoteVO> selectSend(String empno);
	 ArrayList<NoteVO> selectReceive(String empno);
	 NoteVO viewNote(int noteNum);
	 void checkNote(int noteNum);
	 int countReceiveAll(String empno);
	 int countSendAll(String empno);
	 ArrayList<NoteVO> selectReceiveAll(NoteSearchVO vo);
	 ArrayList<NoteVO> selectSendAll(NoteSearchVO vo);
	 ArrayList<MemberVO> receiverCheck(String empno);
	 void writePro(NoteVO vo);
	 MemberVO getNameTeamAuth(String empno);
}
