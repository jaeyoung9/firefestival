package com.my.fire.intro.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;

@Repository("introDAO")
public class IntroDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> intro(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("intro.intro", map);
	}

	public void introUpload(Map<String, Object> map) {
		insert("intro.introWrite", map);
	}

}
