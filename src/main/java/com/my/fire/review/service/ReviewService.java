package com.my.fire.review.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReviewService {

	//리뷰 페이지
	List<Map<String, Object>> notice(Map<String, Object> map) ;
	
	// 리뷰 작성
	public void reviewUserWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	// 리뷰 작성 페이지
	List<Map<String, Object>> getReview(Map<String, Object> map);
	
	// 리뷰 상세
	List<Map<String, Object>> reviewDetail(Map<String, Object> map);
	
	// 리뷰 삭제
	void reviewDelete(Map<String, Object> map) throws Exception;
	
	//리뷰 정보 가져오기
	Map<String, Object> review(Map<String, Object> map) throws Exception;
	
	// 리뷰 수정
	void reviewUpdate(Map<String, Object> map) throws Exception;
}
