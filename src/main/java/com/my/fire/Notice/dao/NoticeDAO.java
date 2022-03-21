package com.my.fire.Notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

//민재영 - notice
@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO {

	// notice 공지 페이지d
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> notice(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectPagingList("notice.notice", map);
	}

	// notice 공지 상세 페이지d
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeDetail(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("notice.noticeDetail", map);
	}

	// notice 공지 작성 페이지d
	@SuppressWarnings("unchecked")
	public void noticeGo(Map<String, Object> map) throws Exception {
		insert("notice.noticeGo", map);
	}

	// notice 공지 수정 페이지d
	@SuppressWarnings("unchecked")
	public void noticeUp(Map<String, Object> map) throws Exception {
		update("notice.noticeUp", map);
	}

	// notice 공지 삭제 d
	@SuppressWarnings("unchecked")
	public void noticeDe(Map<String, Object> map) throws Exception {
		update("notice.noticeDe", map);
	}

	
}