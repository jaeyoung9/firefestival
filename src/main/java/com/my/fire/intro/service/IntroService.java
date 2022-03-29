package com.my.fire.intro.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface IntroService {

	List<Map<String, Object>> intro(Map<String, Object> map);
	List<Map<String, Object>> intro2(Map<String, Object> map);
	
	public void introUpload(Map<String, Object> map, HttpServletRequest request) throws Exception;
	public void introUp1(Map<String, Object> map, HttpServletRequest request) throws Exception;

	
	
}
