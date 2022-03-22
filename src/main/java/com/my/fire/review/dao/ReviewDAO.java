package com.my.fire.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO{

	// 리뷰 페이지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewPage(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectPagingList("review.reviewPage", map);
	}
	
	// 리뷰 작성
	@SuppressWarnings("unchecked")
	public void reviewUserWrite(Map<String, Object> map) {
		insert("review.reviewUserWrite", map);
	}
	
	// 리뷰 작성 페이지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getReview(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("review.getOrder",map);
	}
	
	// 리뷰 상세보기 페이지 이동 	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewDetail(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("review.reviewDetail",map);
	}
	// 리뷰 삭제
	public void reviewDelete(Map<String, Object> map) throws Exception {
		delete("review.reviewDelete", map);	
	}
	
	//리뷰 정보 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> review(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("review.review",map);
	}
	
	//리뷰 수정
	public void reviewUpdate(Map<String, Object> map) throws Exception {
		update("review.reviewUpdate", map);
	}
	
	
}
