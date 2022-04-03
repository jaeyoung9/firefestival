package com.my.fire.event.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

//정주영 - event
public interface EventService {

		// 진행중 이벤트 페이지
		List<Map<String, Object>> event(Map<String, Object> map);
		
		// 종료된 이벤트 페이지
		List<Map<String, Object>> eventEnd(Map<String, Object> map);
		
		// 이벤트 신청
		List<Map<String, Object>> eventApply(Map<String, Object> map);
		
		// 이벤트 신청 내역
		List<Map<String, Object>> applyList(Map<String, Object> map);
		
		// 이벤트 당첨 여부 수정
		Map<String, Object> win(Map<String, Object> map);

		// 이벤트 상세페이지
		List<Map<String, Object>> eventDetail(Map<String, Object> map);
		
		// 이벤트 작성
		void eventWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;

		// 이벤트 수정
		void eventUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

		// 이벤트 삭제
		void eventDelete(Map<String, Object> map) throws Exception;
		
}