package com.sales.erp.schedule.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.schedule.vo.ScheduleVO;

public interface ScheduleMapper extends Serializable{
	public ArrayList<ScheduleVO> select(String empno);
	public void delete(ScheduleVO vo);
	public void insert(ScheduleVO vo);
	public void update(ScheduleVO vo);
}
