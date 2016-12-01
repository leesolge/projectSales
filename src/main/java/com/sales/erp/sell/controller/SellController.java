package com.sales.erp.sell.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sales.erp.sell.service.SellService;
import com.sales.erp.sell.vo.SellVO.KeyValue;



@Controller
public class SellController {

	@Autowired
	private SellService ss;

	@RequestMapping("/sell/sellList")
	public String sellList(ModelMap modelMap) {
		List<KeyValue> pieDataList = ss.getChart();
		modelMap.addAttribute("pieDataList", pieDataList);
		return "sell/sellList";
	}

}
