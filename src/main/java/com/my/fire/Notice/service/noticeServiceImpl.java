package com.my.fire.Notice.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.my.fire.Notice.dao.noticeDAO;

@Service("noticeService")
public class noticeServiceImpl implements noticeService{

	
	@Resource(name="noticeDAO")
	private noticeDAO noticeDao;

	@Override
	public List<Map<String, Object>> notice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeDao.notice(map);
	}

	@Override
	public List<Map<String, Object>> noticeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeDao.noticeList(map);
	}

	@Override
	public void noticeGo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		noticeDao.noticeGo(map);
	}

	@Override
	public void noticeUp(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		noticeDao.noticeUp(map);
	}

	@Override
	public void noticeDe(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		noticeDao.noticeDe(map);
	}


	
	
}
