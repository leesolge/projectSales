package com.sales.erp.schedule.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.schedule.vo.ScheduleVO;

@Repository
public class ScheduleDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<ScheduleVO> getschedule(String empno){
		ScheduleMapper sqlMapper = sqlSession.getMapper(ScheduleMapper.class);
		ArrayList<ScheduleVO> list = sqlMapper.select(empno);
		return list;
	}
	
	public ArrayList<ScheduleVO> selectOne(ScheduleVO vo){
		ScheduleMapper sqlMapper = sqlSession.getMapper(ScheduleMapper.class);
		ArrayList<ScheduleVO> list = sqlMapper.selectOne(vo);
		return list;
	}
	
	public void insertSchedule(ScheduleVO vo){
		ScheduleMapper sqlMapper = sqlSession.getMapper(ScheduleMapper.class);
		sqlMapper.insert(vo);
	}
	
	public void deleteSchedule(ScheduleVO vo){
		ScheduleMapper sqlMapper = sqlSession.getMapper(ScheduleMapper.class);
		sqlMapper.delete(vo);
	}
	
	public void updateSchedule(ScheduleVO vo){
		ScheduleMapper sqlMapper = sqlSession.getMapper(ScheduleMapper.class);
		sqlMapper.update(vo);
	}
	
	public int countSchedule(ScheduleVO vo){
		ScheduleMapper sqlMapper = sqlSession.getMapper(ScheduleMapper.class);
		int count = sqlMapper.count(vo);
		return count;
	}
}
