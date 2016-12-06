<%@page import="org.springframework.data.redis.core.ValueOperations"%>
<%@page import="org.springframework.data.redis.serializer.StringRedisSerializer"%>
<%@page import="org.springframework.data.redis.connection.jedis.JedisConnectionFactory"%>
<%@page import="com.ffzx.commerce.framework.utils.SpringContextHolder"%>
<%@page import="org.springframework.data.redis.core.RedisTemplate"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>data transport</title>
</head>
<body>
	<%
		//get default hessian2 template
		RedisTemplate<String, Object> defaultTemplate = SpringContextHolder.getBean(RedisTemplate.class);
	
		// build jdk template
		
		JedisConnectionFactory jedisConnectionFactory=SpringContextHolder.getBean(JedisConnectionFactory.class);
		StringRedisSerializer stringRedisSerializer=SpringContextHolder.getBean(StringRedisSerializer.class);
		RedisTemplate<String,Object> jdkTemplate=new RedisTemplate();
		
		jdkTemplate.setConnectionFactory(jedisConnectionFactory);
		jdkTemplate.setKeySerializer(stringRedisSerializer);
		jdkTemplate.setValueSerializer(stringRedisSerializer);
		jdkTemplate.setHashKeySerializer(stringRedisSerializer);
		jdkTemplate.setDefaultSerializer(new JdkSerializationRedisSerializer());
		
		Set<String> keys=jdkTemplate.keys("*");
		ValueOperations<String,Object> vp= jdkTemplate.opsForValue();
		ValueOperations<String,Object> dvp= defaultTemplate.opsForValue();
		
		for(String key:keys ){
			Object v=vp.get(key);
			dvp.set(key, v);
		}
		
	
	%>
</body>
</html>