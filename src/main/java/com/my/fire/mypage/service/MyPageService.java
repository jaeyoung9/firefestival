package com.my.fire.mypage.service;

import java.util.List;
import java.util.Map;

public interface MyPageService {

	Map<String, Object> myPage(Map<String, Object> map) throws Exception;

	void myUpdate(Map<String, Object> map) throws Exception;

	void withdraw(Map<String, Object> map) throws Exception;

	Map<String, Object> checkPw(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> myreview(Map<String, Object> map) throws Exception;

	// 이벤트 신청 내역
	List<Map<String, Object>> applyList(Map<String, Object> map);
	
}