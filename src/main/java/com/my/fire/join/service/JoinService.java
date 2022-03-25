package com.my.fire.join.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

//회원가입 Service_김형태
public interface JoinService {

	//id 중복 체크
	int joinIdCk(String id) throws Exception;
	
	//nic 중복 체크
	int joinNicCk(String nic) throws Exception;

	//회원가입 완료
	void joinOk(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;
}
