package com.my.fire.login.service;

import java.util.List;
import java.util.Map;

//로그인 Service_한창식
public interface LoginService {

	//로그인 체크
	public Map<String, Object> loginMemberCk(Map<String, Object> map) throws Exception;
	
	//아이디 찾기
	public List<Map<String, Object>> findId(Map<String, Object> map) throws Exception;
	
	//비밀번호 찾기
	public List<Map<String, Object>> findPw(Map<String, Object> map) throws Exception;

//	public static void pwUpdate(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	
//
//	void pwUpdate(String memberId, String hashedPw) throws Exception;

	//public Map<String, Object> selectLoginUser(Map<String, Object> map)throws Exception;
	
//	public String pwCheck(String memberId)throws Exception;
//	public void pwUpdate(String memberId,String hashedPw)throws Exception;
	
}
