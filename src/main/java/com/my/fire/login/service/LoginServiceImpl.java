package com.my.fire.login.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.my.fire.login.dao.LoginDAO;

//로그인 ServiceImpl_한창식
@Service("loginService")
public class LoginServiceImpl implements LoginService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	//로그인 체크
	@Override
	public Map<String, Object> loginMemberCk(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.loginMemberCk(map);
	}

	//아이디 찾기
	@Override
	public List<Map<String, Object>> findId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findId(map);
	}

	//비밀번호 찾기
	@Override
	public List<Map<String, Object>> findPw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findPw(map);
	}
//	@Override
//	public Map<String, Object> selectLoginUser(Map<String, Object> map) throws Exception{
//		return loginDAO.selectLoginUser(map);
//	}
}
