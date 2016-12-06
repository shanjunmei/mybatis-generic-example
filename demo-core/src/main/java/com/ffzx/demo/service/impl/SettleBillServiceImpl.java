package com.ffzx.demo.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ffzx.common.service.impl.BaseServiceImpl;
import com.ffzx.demo.mapper.SettleBillMapper;
import com.ffzx.demo.model.SettleBill;
import com.ffzx.demo.service.SettleBillService;

import tk.mybatis.mapper.common.Mapper;

@Service
public class SettleBillServiceImpl extends BaseServiceImpl<SettleBill, String> implements SettleBillService{

	@Resource
	SettleBillMapper mapper;
	
	
	@Override
	public Mapper<SettleBill> getMapper() {
		return mapper;
	}

}
