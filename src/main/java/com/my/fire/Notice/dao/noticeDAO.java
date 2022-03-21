package com.my.fire.Notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

@Repository("noticeDAO")
public class noticeDAO extends AbstractDAO {

	// notice 공지 페이지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> notice(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notice.notice", map);
	}

	// notice 공지 상세 페이지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notice.noticeList", map);
	}

	// notice 공지 작성 페이지
	public void noticeGo(Map<String, Object> map) throws Exception {
		insert("notice.noticeGo", map);
	}

	// notice 공지 수정 페이지
	public void noticeUp(Map<String, Object> map) throws Exception {
		update("notice.noticeUp", map);
	}

	// notice 공지 삭제
	public void noticeDe(Map<String, Object> map) throws Exception {
		update("notice.noticeDe", map);
	}

}
