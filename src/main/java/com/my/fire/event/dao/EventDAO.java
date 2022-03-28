package com.my.fire.event.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

//정주영 - event
@Repository("eventDAO")
public class EventDAO extends AbstractDAO {

		// 이벤트 페이지
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> event(Map<String, Object> map) {
			return (List<Map<String, Object>>) selectPagingList("event.event", map);
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
			delete("event.eventDelete", map);
		}
		
}