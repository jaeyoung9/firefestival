package com.my.fire.Notice.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.my.fire.Notice.dao.NoticeDAO;


//민재영 - notice
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDao;

	
	//공지페이지
	@Override
	public List<Map<String, Object>> notice(Map<String, Object> map){
		// TODO Auto-generated method stub
		return noticeDao.notice(map);
	}
	
	//공지 상세페이지
	@Override
	public List<Map<String, Object>> noticeDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeDao.noticeDetail(map);
	}
	//공지 작성
	@Override
	public void noticeGo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		noticeDao.noticeGo(map);
	}

	//공지 수정
	@Override
	public void noticeUp(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		noticeDao.noticeUp(map);
	}

	//공지 삭제
	@Override
	public void noticeDe(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		noticeDao.noticeDe(map);
	}


	
	
}
