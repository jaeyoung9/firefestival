package com.my.fire.food;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

//이 솔 - FOOD
public interface FoodService {

	// FOOD 페이지
	List<Map<String, Object>> food(Map<String, Object> map);

	// FOOD 상세 페이지
	List<Map<String, Object>> foodDetail(Map<String, Object> map);
	
	// FOOD 작성
	void foodWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// FOOD 수정
	void foodUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// FOOD 삭제
	void foodDelete(Map<String, Object> map) throws Exception;
			
}