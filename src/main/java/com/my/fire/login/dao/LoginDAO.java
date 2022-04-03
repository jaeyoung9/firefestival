package com.my.fire.login.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

//로그인 DAO_한창식
@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {

	//로그인 체크
	@SuppressWarnings("unchecked")
	public Map<String, Object> loginMemberCk(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.loginMemberCk", map);
	}
	
	//아이디 찾기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("login.findId", map);
	}
	
	//비밀번호 찾기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findPw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("login.findPw", map);
	}
//	@SuppressWarnings("unchecked")
//	public Map<String, Object> selectLoginUser(Map<String, Object> map) throws Exception {
//		return (Map<String, Object>) selectOne("login.selectLoginUser", map);
//	}
	//비밀번호 변경 
//public String pwCheck(String memberId)throws Exception;
//public void pwUpdate(String memberId,String hashedPw)throws Exception;
//
//	
//@Override
//public void pwUpdate(String memberId,String hashedPw)throws Exception{
//	Map<String,Object>map = new HashMap<String,Object>();
//	map.put("memberId",memberId);
//	map.put("memberPw",hashedPw);
//	sqlsession.update("memberMapper.pwUpdate",map);
//}

//	public static void pwUpdate(String memberId, String hashedPw) {
//		// TODO Auto-generated method stub
//		
//	}
	
}
