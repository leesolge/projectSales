package com.sales.erp.etc.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sales.erp.etc.dao.EtcDAO;
import com.sales.erp.etc.vo.EtcVO;

@RestController
@RequestMapping("/count")
public class EtcController {

	@Autowired
	private EtcDAO dao;
	
	@RequestMapping("/countNote")
	public ResponseEntity<ArrayList<EtcVO>> counts(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		EtcVO vo = new EtcVO();
		vo.setEmpno(empno);
		ResponseEntity<ArrayList<EtcVO>> counter = null;
		try {
			int count = dao.countUncheckedNote(vo);
			vo.setEmpno(String.valueOf(count));
			ArrayList<EtcVO> list = new ArrayList<>();
			list.add(vo);
			counter = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			counter = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return counter;
	}
}
