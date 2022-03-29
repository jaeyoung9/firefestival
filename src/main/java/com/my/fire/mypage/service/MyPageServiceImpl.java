package com.my.fire.mypage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

	@Override
	public void myUpdate(Map<String, Object> map,MultipartHttpServletRequest reqeust) throws Exception{
		List<Map<String, Object>> list = fileUtils.myUpdate(map, request);
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> vo = list.get(i);
		mypageDAO.myUpdate(vo);
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
	
	@Override 
	public List<Map<String, Object>> myevent(Map<String, Object> map) throws Exception{
		return mypageDAO.myevent(map);
	}
	
}
