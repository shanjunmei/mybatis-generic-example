package com.ffzx.common.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ffzx.common.service.BaseService;

import tk.mybatis.mapper.common.Mapper;

public abstract class BaseServiceImpl<T, PK> implements BaseService<T, PK> {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	public BaseServiceImpl() {
		logger.debug(getClass() + " init");
	}
	// @Resource
	// Mapper<T> mapper;

	public Mapper<T> getMapper() {
		throw new RuntimeException(
				"type[" + getClass() + "] unsupported  getMapper() method");
	}

	@Override
	public int add(T entity) {
		return getMapper().insert(entity);
	}

	@Override
	public int deleteById(PK id) {
		return getMapper().deleteByPrimaryKey(id);
	}

	@Override
	public int update(T entity) {
		return getMapper().updateByPrimaryKey(entity);
	}

	@Override
	public int updateSelective(T entity) {
		return getMapper().updateByPrimaryKeySelective(entity);
	}

	@Override
	public T findById(PK id) {
		return getMapper().selectByPrimaryKey(id);
	}

	@Override
	public List<T> selectByExample(Object example) {
		return getMapper().selectByExample(example);
	}

	@Override
	public int updateByExample(T record, Object example) {
		return getMapper().updateByExampleSelective(record, example);
	}
}
