package com.my.fire.mypage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.my.fire.mypage.dao.MyPageDAO;

@Service("mypageService")
public class MyPageServiceImpl implements MyPageService{
	
	private static final Logger log = Logger.getLogger(MyPageServiceImpl.class);
	
	@Resource(name="mypageDAO")
	private MyPageDAO mypageDAO;
	
	@Override
	public Map<String, Object> myPage(Map<String, Object> map) throws Exception{
		return mypageDAO.myPage(map);
	}

	public void myUpdate(Map<String, Object> map) throws Exception{
		mypageDAO.myUpdate(map);
	}

	public void withdraw(Map<String, Object> map) throws Exception{
		mypageDAO.wirhdraw(map);
	}
	
	@Override
	public Map<String, Object> checkPw(Map<String, Object> map) throws Exception{
		return mypageDAO.checkPw(map);
	}
	
	@Override 
	public List<Map<String, Object>> myreview(Map<String, Object> map) throws Exception{
		return mypageDAO.myreview(map);
	}

	// 이벤트 신청 내역
	@Override
	public List<Map<String, Object>> applyList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mypageDAO.applyList(map);
	}
		
}