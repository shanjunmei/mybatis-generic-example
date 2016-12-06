package com.ffzx.common.controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ffzx.commerce.framework.utils.JsonMapper;
import com.ffzx.common.service.BaseService;
import com.ffzx.orm.common.GenericExample;

//@Controller
public abstract class BaseController<T, PK, EX extends GenericExample<?>> {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());

	public BaseController(){
		logger.debug(getClass()+" init");
	}
	public BaseService<T, PK> getService() {
		throw new RuntimeException(getClass() + " unsuppoted getService() method");
	}

	public abstract EX createExample();

	public abstract T createEntity();

	@RequestMapping("form")
	@ResponseBody
	public T form(PK id) {
		return getService().findById(id);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("queryData")
	@ResponseBody
	public List<T> query(T entity) {
		Map<String, Object> params = JsonMapper.convertVal(entity, Map.class);
		EX example = createExample();

		for (Entry<String, Object> e : params.entrySet()) {
			if (e.getValue() != null) {
				example.createCriteria().addCriterion(e.getKey() + "=", e.getValue(), e.getKey());
			}
		}
		return getService().selectByExample(example);
	}

	@RequestMapping("update")
	@ResponseBody
	public int update(T entity) {
		return getService().updateSelective(entity);
	}

	@RequestMapping("delete")
	@ResponseBody
	public int delete(PK id) {
		return getService().deleteById(id);
	}
}
