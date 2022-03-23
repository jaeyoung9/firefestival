package com.my.fire.join.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

//회원가입 Dao_김형태
@Repository("joinDAO")
public class JoinDAO extends AbstractDAO {

	//id 중복 체크
	public int joinIdCk(String id) throws Exception {
		return (Integer) selectOne("join.joinIdCk", id);
	}
	
	//nic 중복 체크
	public int joinNicCk(String nic) throws Exception {
		return (Integer) selectOne("join.joinNicCk", nic);
	}

	//회원가입 완료
	public void joinOk(Map<String, Object> map) throws Exception {
		insert("join.joinOk", map);
	}
}
