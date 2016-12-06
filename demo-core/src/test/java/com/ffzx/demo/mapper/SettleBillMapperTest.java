package com.ffzx.demo.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.ffzx.commerce.framework.utils.JsonMapper;
import com.ffzx.demo.TestBase;
import com.ffzx.demo.mapper.SettleBillMapper;
import com.ffzx.demo.model.SettleBill;
import com.ffzx.demo.model.SettleBillExample;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

public class SettleBillMapperTest extends TestBase{

	@Resource
	private SettleBillMapper mapper;
	
	@Test
	public void testFindById(){
		
		String id="191eb3835c7f4e9db8b1a32f6850df0a";
		SettleBill order=mapper.selectByPrimaryKey(id);
		org.junit.Assert.assertNotNull(order);
		logger.info(JsonMapper.toJsonString(order));
	}

	@Test
	public void testSelectByExample(){

		String id="191eb3835c7f4e9db8b1a32f6850df0a";
		SettleBillExample example=new SettleBillExample();
		example.createCriteria().andIdEqualTo(id);
		example.or().andIdEqualTo("6b552a3bb285486b913ffd356e74b27d");
		Page<?> page= PageHelper.startPage(1, 2);
		List<SettleBill> orders=mapper.selectByExample(example);
		org.junit.Assert.assertNotNull(orders);
		logger.info(JsonMapper.toJsonString(orders));
		logger.info(page.getTotal()+"");
	
	}
	
	@Test
	public void testFindByVendorCode(){

		String vendorCode="LY20161121004";
		Page<?> page= PageHelper.startPage(1, 2);
		List<SettleBill> orders=mapper.findByVendorCode(vendorCode);
		org.junit.Assert.assertNotNull(orders);
		logger.info(JsonMapper.toJsonString(orders));
		logger.info(page.getTotal()+"");
	
	}
	
	@Test
	public void testInsert(){

		String vendorCode="LY20161121004";
		SettleBill record=new SettleBill();
		record.setId("test");
		record.setCode("test");
		record.setVendorCode(vendorCode);
		int i=mapper.insert(record);
		logger.info(i+"");
	
	}
	@Test
	public void testUpdate(){

		String vendorCode="LY20161121004";
		SettleBill record=new SettleBill();
		record.setId("test");
		record.setCode("test");
		record.setCreateBy("test");
		record.setVendorCode(vendorCode);
		int i=mapper.updateByPrimaryKeySelective(record);
		logger.info(i+"");
	
	}
	
	@Test
	public void testDelete(){

		String vendorCode="LY20161121004";
		SettleBill record=new SettleBill();
		record.setId("test");
		record.setCode("test");
		record.setVendorCode(vendorCode);
		int i=mapper.delete(record);
		logger.info(i+"");
	
	}
}
