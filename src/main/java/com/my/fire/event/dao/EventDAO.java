package com.my.fire.event.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

//정주영 - event
@Repository("eventDAO")
public class EventDAO extends AbstractDAO {

		// 진행중 이벤트 페이지
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> event(Map<String, Object> map) {
			return (List<Map<String, Object>>) selectPagingList("event.event", map);
		}
		
		// 종료된 이벤트 페이지
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> eventEnd(Map<String, Object> map) {
			return (List<Map<String, Object>>) selectPagingList("event.eventEnd", map);
		}
		
		// 이벤트 신청
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> eventApply(Map<String, Object> map) {
			return (List<Map<String, Object>>) selectList("event.eventApply", map);
		}
		
		// 이벤트 신청 내역
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> applyList(Map<String, Object> map) {
			return (List<Map<String, Object>>) selectList("event.applyList", map);
		}
		
		// 이벤트 당첨 여부 수정
		@SuppressWarnings("unchecked")
		public Map<String, Object> win(Map<String, Object> map) {
			return (Map<String, Object>) selectOne("event.win", map);
		}

		// 이벤트 상세 페이지
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> eventDetail(Map<String, Object> map) {
			return (List<Map<String, Object>>) selectList("event.eventDetail", map);
		}

		// 이벤트 작성 페이지
		@SuppressWarnings("unchecked")
		public void eventWrite(Map<String, Object> map) throws Exception {
			insert("event.eventWrite", map);
		}

		// 이벤트 수정 페이지
		@SuppressWarnings("unchecked")
		public void eventUpdate(Map<String, Object> map) throws Exception {
			update("event.eventUpdate", map);
		}

		// 이벤트 삭제
		@SuppressWarnings("unchecked")
		public void eventDelete(Map<String, Object> map) throws Exception {
			update("event.eventDelete", map);
		}
		
}