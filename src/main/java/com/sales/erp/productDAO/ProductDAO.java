package com.sales.erp.productDAO;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.productVO.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<ProductVO> selectAll(){
		ProductMapper proMapper = sqlSession.getMapper(ProductMapper.class);
		ArrayList<ProductVO> pvo = proMapper.selectAll();
		return pvo;
	}
	public ArrayList<ProductVO> selectOne(String procode){
		ProductMapper proMapper = sqlSession.getMapper(ProductMapper.class);
		ArrayList<ProductVO> pvo = proMapper.selectOne(procode);
		return pvo;
	}
	public void insertPro(ProductVO vo){
		ProductMapper proMapper = sqlSession.getMapper(ProductMapper.class);
		proMapper.insertPro(vo);
	}
	public void deletePro(String procode){
		ProductMapper proMapper =sqlSession.getMapper(ProductMapper.class);
		proMapper.deletePro(procode);
		}
	
	
}
