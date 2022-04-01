package com.my.fire.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MyPageService {

	Map<String, Object> myPage(Map<String, Object> map) throws Exception;

	void myUpdate(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;

	void withdraw(Map<String, Object> map) throws Exception;

	Map<String, Object> checkPw(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> myreview(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> myevent(Map<String, Object> map) throws Exception;
	

}
