package com.ffzx.demo.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ffzx.demo.model.SettleBill;
import com.ffzx.demo.model.SettleBillExample;
import com.ffzx.demo.service.SettleBillService;

@Controller
@RequestMapping("settleBill")
public class SettleBillController
		extends com.ffzx.common.controller.BaseController<SettleBill, String, SettleBillExample> {

	@Resource
	private SettleBillService service;

	@Override
	public SettleBillService getService() {
		return service;
	}

	@Override
	public SettleBillExample createExample() {
		return new SettleBillExample();
	}

	@Override
	public SettleBill createEntity() {
		return new SettleBill();
	}

}
