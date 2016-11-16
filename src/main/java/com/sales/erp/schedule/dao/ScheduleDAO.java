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
	
	public ScheduleVO getschedule(String empno){
		ScheduleVO vo = new ScheduleVO();
		ScheduleMapper sqlMapper = sqlSession.getMapper(ScheduleMapper.class);
		vo = sqlMapper.select(empno);
		return vo;
	}
	
	public void insertSchedule(ScheduleVO vo){
		ScheduleMapper sqlMapper = sqlSession.getMapper(ScheduleMapper.class);
		sqlMapper.insert(vo);
	}
	
	public void deleteSchedule(String empno){
		ScheduleMapper sqlMapper = sqlSession.getMapper(ScheduleMapper.class);
		sqlMapper.delete(empno);
	}
}
