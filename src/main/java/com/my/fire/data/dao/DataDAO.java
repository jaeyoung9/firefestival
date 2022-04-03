package com.my.fire.data.dao;

import java.util.List;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

//조영준 - data
@Repository("dataDAO")
public class DataDAO extends AbstractDAO {

		// 자료실
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> data(Map<String, Object> map) {
			return (List<Map<String, Object>>) selectPagingList("data.data", map);
		}
		
		// 자료실 상세페이지
				@SuppressWarnings("unchecked")
				public List<Map<String, Object>> dataDetail(Map<String, Object> map) {
					return (List<Map<String, Object>>) selectList("data.dataDetail", map);
				}

		// 자료실 작성페이지
		@SuppressWarnings("unchecked")
		public void dataWrite(Map<String, Object> map) throws Exception {
			insert("data.dataWrite", map);
		}

		// 자료실 수정페이지
		@SuppressWarnings("unchecked")
		public void dataUpdate(Map<String, Object> map) throws Exception {
			update("data.dataUpdate", map);
		}

		// 자료실 삭제
		@SuppressWarnings("unchecked")
		public void dataDelete(Map<String, Object> map) throws Exception {
			delete("data.dataDelete", map);
		}
		
}