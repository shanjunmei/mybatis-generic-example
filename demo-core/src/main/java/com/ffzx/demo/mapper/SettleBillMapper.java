package com.ffzx.demo.mapper;

import java.util.List;

import com.ffzx.demo.model.SettleBill;

import tk.mybatis.mapper.common.Mapper;

public interface SettleBillMapper extends Mapper<SettleBill> {
	
	public List<SettleBill> findByVendorCode(String vendorCode);
}