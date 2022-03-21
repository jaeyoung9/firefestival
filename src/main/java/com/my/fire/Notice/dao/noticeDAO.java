package com.my.fire.Notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

@Repository("noticeDAO")
public class noticeDAO extends AbstractDAO {
	
	// 조회
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeList(Map<String, Object>map) throws Exception{
		return (List<Map<String, Object>>) selectList("--",map);
	}
}
	