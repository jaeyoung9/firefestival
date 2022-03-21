package com.my.fire.join.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

//회원가입 Service_김형태
public interface JoinService {

	//id 중복 체크
	int joinIdCk(String id) throws Exception;

	//회원가입 완료
	void joinOk(Map<String, Object> map, HttpServletRequest request) throws Exception;
}
