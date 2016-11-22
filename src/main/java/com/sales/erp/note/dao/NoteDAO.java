package com.sales.erp.note.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.note.vo.JoinVO;
import com.sales.erp.note.vo.NoteSearchVO;
import com.sales.erp.note.vo.NoteVO;

@Repository
public class NoteDAO implements NoteMapper{

	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<NoteVO> selectUncheckedAll(NoteSearchVO vo){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.selectUncheckedAll(vo);
	}
	
	public void restoreOne(int noteNum) {
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		noteMapper.restoreOne(noteNum);
	}

	public ArrayList<JoinVO> adminSelectAll(NoteSearchVO vo) {
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.adminSelectAll(vo);
	}

	public int adminSelectCount(NoteSearchVO vo) {
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.adminSelectCount(vo);
	}

	public void deleteOne(int noteNum) {
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		noteMapper.deleteOne(noteNum);
	}

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
	
	public int countReceiveAll(NoteSearchVO vo){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.countReceiveAll(vo);
	}
	
	public ArrayList<NoteVO> selectReceiveAll(NoteSearchVO vo){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.selectReceiveAll(vo);
	}
	
	public int countSendAll(NoteSearchVO vo){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.countSendAll(vo);
	}
	
	public ArrayList<NoteVO> selectSendAll(NoteSearchVO vo){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.selectSendAll(vo);
	}
	
	public ArrayList<MemberVO> receiverCheck(String empno) {
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.receiverCheck(empno);
	}

	public MemberVO getNameTeamAuth(String empno) {
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.getNameTeamAuth(empno);
	}
	
	
}
