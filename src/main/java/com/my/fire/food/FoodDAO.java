package com.my.fire.food;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

// 이 솔 - FOOD
@Repository("foodDAO")
public class FoodDAO extends AbstractDAO {

	// 먹거리 페이지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> food(Map<String, Object> map) {
	return (List<Map<String, Object>>) selectPagingList("food.food", map);
	}
	
	// 푸드트럭 페이지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> truck(Map<String, Object> map) {
	return (List<Map<String, Object>>) selectPagingList("food.truck", map);
	}

	// FOOD 상세 페이지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> foodDetail(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("food.foodDetail", map);
	}

	// FOOD 작성 페이지
	@SuppressWarnings("unchecked")
	public void foodWrite(Map<String, Object> map) throws Exception {
		insert("food.foodWrite", map);
	}

	// FOOD 수정 페이지
	@SuppressWarnings("unchecked")
	public void foodUpdate(Map<String, Object> map) throws Exception {
		update("food.foodUpdate", map);
	}

	// FOOD 삭제
	@SuppressWarnings("unchecked")
	public void foodDelete(Map<String, Object> map) throws Exception {
		delete("food.foodDelete", map);
	}
}