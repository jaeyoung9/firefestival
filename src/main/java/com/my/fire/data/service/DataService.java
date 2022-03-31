package com.my.fire.data.service;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

// 조영준 - data
public interface DataService {

		// 자료실
		List<Map<String, Object>> data(Map<String, Object> map);
	
		// 자료실 상세
		List<Map<String, Object>> dataDetail(Map<String, Object> map);
				
		// 자료실 작성
		void dataWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;

		// 자료실 수정
		void dataUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

		// 자료실 삭제
		void dataDelete(Map<String, Object> map) throws Exception;
		
}