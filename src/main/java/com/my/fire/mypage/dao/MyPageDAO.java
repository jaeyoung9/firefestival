package com.my.fire.mypage.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

@Repository("mypageDAO")
public class MyPageDAO extends AbstractDAO {

	
	
	//회원정보 보
	@SuppressWarnings("unchecked")
	public Map<String, Object> myPage(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("myPage.myPage",map);
	}

}
