package com.sales.erp.noteDAO;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.noteVO.NoteSearchVO;
import com.sales.erp.noteVO.NoteVO;

public interface NoteMapper extends Serializable{

	 ArrayList<NoteVO> selectSend(String empno);
	 ArrayList<NoteVO> selectReceive(String empno);
	 NoteVO viewNote(int noteNum);
	 void checkNote(int noteNum);
	 int countReceiveAll(String empno);
	 int countSendAll(String empno);
	 ArrayList<NoteVO> selectReceiveAll(NoteSearchVO vo);
	 ArrayList<NoteVO> selectSendAll(NoteSearchVO vo);
}
