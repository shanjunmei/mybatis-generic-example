package com.ffzx.purchase.controller.base;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/**
 * 
 * @ClassName: TestBase
 * @Description: 单元测试基类
 * @author 李淼淼 445052471@qq.com
 * @date 2016年6月23日 上午9:08:49
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {  "classpath:springmvc-servlet.xml","classpath:applicationContext-core.xml" })
public abstract class ControllerTestBase extends AbstractJUnit4SpringContextTests {

	protected MockMvc mockMvc;
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Before
	public void setup() {
		//this.mockMvc = MockMvcBuilders.webAppContextSetup(applicationContext).build();
	}

}
