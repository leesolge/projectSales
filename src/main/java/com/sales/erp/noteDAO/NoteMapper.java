package com.sales.erp.noteDAO;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.noteVO.NoteVO;
import com.sales.erp.smember.SMemberVO;

public interface NoteMapper extends Serializable{

	 ArrayList<NoteVO> selectSend(String empno);
	 ArrayList<NoteVO> selectReceive(String empno);
	 NoteVO viewNote(int noteNum);
	 void checkNote(int noteNum);
}
