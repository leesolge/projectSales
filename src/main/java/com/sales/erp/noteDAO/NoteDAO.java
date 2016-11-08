package com.sales.erp.noteDAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.noteVO.NoteVO;
import com.sales.erp.smemberDao.SMemberMapper;

@Repository
public class NoteDAO {

	@Autowired
	private SqlSession sqlSession;
	
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
	
	public int countReceiveAll(int empno){
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		return noteMapper.countReceiveAll(empno);
	}
	
	public ArrayList<NoteVO> selectReceiveAll(int empno){
		return null;
	}
}
