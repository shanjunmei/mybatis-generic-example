package com.ffzx.common.service;

import java.util.List;

public interface BaseService<T, PK> {

	public int add(T entity);

	public int deleteById(PK id);

	public int update(T entity);
	
	public int updateSelective(T entity);

	public T findById(PK id);

	public List<T> selectByExample(Object example);

	public int updateByExample(T entity,Object example);

}
