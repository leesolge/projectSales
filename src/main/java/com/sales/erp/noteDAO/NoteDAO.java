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
		ArrayList<NoteVO> sendList = new ArrayList<NoteVO>();
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		sendList = noteMapper.selectSend(empno);
		return sendList;
	}
	
	public ArrayList<NoteVO> selectReceive(String empno){
		ArrayList<NoteVO> sendList = new ArrayList<NoteVO>();
		NoteMapper noteMapper = sqlSession.getMapper(NoteMapper.class);
		sendList = noteMapper.selectReceive(empno);
		return sendList;
	}
}
