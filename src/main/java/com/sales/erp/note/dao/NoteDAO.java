package com.sales.erp.note.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.note.vo.NoteSearchVO;
import com.sales.erp.note.vo.NoteVO;
import com.sales.erp.smember.SMemberVO;

@Repository
public class NoteDAO implements NoteMapper{

	@Autowired
	private SqlSession sqlSession;
	
	public void writePro(NoteVO vo) {
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		noteMapper.writePro(vo);
	}

	public ArrayList<NoteVO> selectSend(String empno){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		ArrayList<NoteVO> sendList = noteMapper.selectSend(empno);
		return sendList;
	}
	
	public ArrayList<NoteVO> selectReceive(String empno){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		ArrayList<NoteVO> receiveList = noteMapper.selectReceive(empno);
		return receiveList;
	}
	
	public NoteVO viewNote(int noteNum){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		NoteVO vo = noteMapper.viewNote(noteNum);
		return vo;
	}
	
	public void checkNote(int noteNum){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		noteMapper.checkNote(noteNum);
	}
	
	public int countReceiveAll(String empno){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.countReceiveAll(empno);
	}
	
	public ArrayList<NoteVO> selectReceiveAll(NoteSearchVO vo){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.selectReceiveAll(vo);
	}
	
	public int countSendAll(String empno){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.countSendAll(empno);
	}
	
	public ArrayList<NoteVO> selectSendAll(NoteSearchVO vo){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.selectSendAll(vo);
	}
	
	public ArrayList<SMemberVO> receiverCheck(String empno) {
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.receiverCheck(empno);
	}

	public SMemberVO getNameTeamAuth(String empno) {
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.getNameTeamAuth(empno);
	}
	
	
}
