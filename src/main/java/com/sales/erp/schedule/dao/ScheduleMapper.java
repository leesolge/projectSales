package com.sales.erp.schedule.dao;

import java.io.Serializable;

import com.sales.erp.schedule.vo.ScheduleVO;

public interface ScheduleMapper extends Serializable{
	public ScheduleVO select(String empno);
	public void delete(String empno);
	public void insert(ScheduleVO vo);
}
