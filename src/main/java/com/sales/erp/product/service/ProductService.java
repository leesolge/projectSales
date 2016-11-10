package com.sales.erp.product.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.sales.erp.product.dao.ProductDAO;
import com.sales.erp.product.vo.ProductVO;

@Repository
public class ProductService {
	
	@Autowired
	private ProductDAO pdao;
	
	public ModelAndView selectAll(){
		ArrayList<ProductVO> pvo = pdao.selectAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("proList", pvo);
		return mav;
	}
	
	public ModelAndView selectOne(String procode){
		ProductVO pvo = pdao.selectOne(procode);
	    ModelAndView mav = new ModelAndView();
	    System.out.println(pvo);
	    mav.addObject("proList", pvo);
	    return mav;
	}
	
	public void insertPro(ProductVO vo){
		MultipartFile uploadfile = vo.getFile();
		System.out.println("DD");
        if (uploadfile != null) {
            String fileName = uploadfile.getOriginalFilename();
            try {
                File file = new File("C:/sales/sales/src/main/webapp/resources/proportraits/" + fileName);
	            int count = 0;
                while(file.exists()) {           	
	                	int indexes = fileName.lastIndexOf(".");
	                	System.out.println("순서 = "+indexes);
	                	String extension = fileName.substring(indexes);
	                	System.out.println("확장자 = "+extension);
	                	String newFileName = fileName.substring(0, indexes) + count + extension;
	                	System.out.println("새 파일 이름 = "+newFileName);
	                	fileName = newFileName;
	                	file = new File("C:/sales/sales/src/main/webapp/resources/proportraits/" + newFileName);
	                	count++;
	                }
	               vo.setProimage(fileName);
	               uploadfile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		pdao.insertPro(vo);
	}
	
	public void deletePro(String procode){
		pdao.deletePro(procode);
	}
}

