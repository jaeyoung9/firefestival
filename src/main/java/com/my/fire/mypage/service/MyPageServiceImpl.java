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

	

}
