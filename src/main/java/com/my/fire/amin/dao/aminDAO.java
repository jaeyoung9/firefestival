package com.my.fire.amin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.my.fire.common.dao.AbstractDAO;

@Repository("aminDAO")
public class aminDAO extends AbstractDAO  {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> member(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectPagingList("amin.member", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> search(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectPagingList("amin.search", map);
	}
	
	
}
