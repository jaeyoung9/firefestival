package com.my.fire.mypage.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.fire.common.util.FileUtils;
import com.my.fire.mypage.dao.MyPageDAO;

@Service("mypageService")
public class MyPageServiceImpl implements MyPageService{
	
	private static final Logger log = Logger.getLogger(MyPageServiceImpl.class);
	
	@Resource(name="mypageDAO")
	private MyPageDAO mypageDAO;
	
	@Resource
	private FileUtils fileUtils;
	
	@Override
	public Map<String, Object> myPage(Map<String, Object> map) throws Exception{
		return mypageDAO.myPage(map);
	}

	@Override
	public void myUpdate(Map<String, Object> map,MultipartHttpServletRequest request) throws Exception{
		List<Map<String, Object>> list = fileUtils.myUpdate(map, request);
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> vo = list.get(i);
		mypageDAO.myUpdate(vo);
	}
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				log.debug("---------- file start ----------");
				log.debug("name : " + multipartFile.getName());
				log.debug("filename : " + multipartFile.getOriginalFilename());
				log.debug("size : " + multipartFile.getSize());
				log.debug("---------- file end ----------\n");
			}
		}
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
