package com.sales.erp.note.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.note.vo.NoteSearchVO;
import com.sales.erp.note.vo.NoteVO;
import com.sales.erp.smember.SMemberVO;

public interface NoteMapper extends Serializable{

	 ArrayList<NoteVO> selectSend(String empno);
	 ArrayList<NoteVO> selectReceive(String empno);
	 NoteVO viewNote(int noteNum);
	 void checkNote(int noteNum);
	 int countReceiveAll(String empno);
	 int countSendAll(String empno);
	 ArrayList<NoteVO> selectReceiveAll(NoteSearchVO vo);
	 ArrayList<NoteVO> selectSendAll(NoteSearchVO vo);
	 ArrayList<SMemberVO> receiverCheck(String empno);
	 void writePro(NoteVO vo);
	 SMemberVO getNameTeamAuth(String empno);
}
