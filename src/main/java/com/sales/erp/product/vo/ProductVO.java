package com.sales.erp.product.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private String procode, proname, proamount, sellprice, originprice, proimage, proexpla;
	private MultipartFile file;
	
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getProcode() {
		return procode;
	}

	public void setProcode(String procode) {
		this.procode = procode;
	}

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public String getProamount() {
		return proamount;
	}

	public void setProamount(String proamount) {
		this.proamount = proamount;
	}

	public String getSellprice() {
		return sellprice;
	}

	public void setSellprice(String sellprice) {
		this.sellprice = sellprice;
	}

	public String getOriginprice() {
		return originprice;
	}

	public void setOriginprice(String originprice) {
		this.originprice = originprice;
	}

	public String getProimage() {
		return proimage;
	}

	public void setProimage(String proimage) {
		this.proimage = proimage;
	}

	public String getProexpla() {
		return proexpla;
	}

	public void setProexpla(String proexpla) {
		this.proexpla = proexpla;
	}
	
	
}
