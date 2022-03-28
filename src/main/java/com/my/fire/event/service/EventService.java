package com.my.fire.event.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

//정주영 - event
public interface EventService {

		// 이벤트 페이지
		List<Map<String, Object>> event(Map<String, Object> map);

		// 이벤트 상세페이지
		List<Map<String, Object>> eventDetail(Map<String, Object> map);
		
		// 이벤트 작성
		void eventWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;

		// 이벤트 수정
		void eventUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

		// 이벤트 삭제
		void eventDelete(Map<String, Object> map) throws Exception;
		
}