package com.my.fire.mypage.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

@Repository("mypageDAO")
public class MyPageDAO extends AbstractDAO {

	
	
	
	//회원정보 보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> myPage(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("myPage.myPage",map);
	}

	//회원정보 수정
	public void myUpdate(Map<String, Object> map ) throws Exception {
		update("myPage.myUpdate", map);
		
	}
	//회원탈퇴
	public void wirhdraw(Map<String, Object> map) throws Exception{
		delete("myPage.withdraw", map);
		
	}

	//비밀번호 확인
	@SuppressWarnings("unchecked")
	public Map<String, Object> checkPw(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("myPage.checkPw",map);
	}

	// 내리뷰 보기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myreview(Map<String, Object> map) throws Exception {
		return (List<Map<String,Object>>)selectList("myPage.myreview", map);
	}

	// 이벤트 신청 내역
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> userApplyList(Map<String, Object> map){
			return (List<Map<String, Object>>) selectList("event.userApplyList",map);
	}

}
