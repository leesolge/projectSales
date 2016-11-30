package com.sales.erp.etc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.etc.vo.EtcVO;

@Repository
public class EtcDAO implements EtcMapper {

	@Autowired
	private SqlSession sqlSession;

	public int countUncheckedNote(EtcVO vo) {
		EtcMapper mapper = sqlSession.getMapper(EtcMapper.class);
		return mapper.countUncheckedNote(vo);
	}
	
}
