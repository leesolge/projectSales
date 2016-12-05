package com.sales.erp.sell.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.sell.vo.SellVO.KeyValue;

@Repository
public class SellDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<KeyValue> getChart() {
		/*SellMapper mapper = sqlSession.getMapper(SellMapper.class);*/
		/*return SellVO.getPieDataList();*/
		
		SellMapper mapper = sqlSession.getMapper(SellMapper.class);
		return mapper.getChart();
	}

}
