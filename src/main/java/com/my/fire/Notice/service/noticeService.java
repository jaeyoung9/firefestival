package com.my.fire.Notice.service;

import java.util.List;
import java.util.Map;

public interface noticeService {

	// 공지페이지
	List<Map<String, Object>> notice(Map<String, Object> map);

	// 공지상세페이지
	List<Map<String, Object>> noticeList(Map<String, Object> map);

	// 공지작성
	void noticeGo(Map<String, Object> map) throws Exception;

	// 공지수정
	void noticeUp(Map<String, Object> map) throws Exception;

	// 공지삭제
	void noticeDe(Map<String, Object> map) throws Exception;
}
