package com.my.fire.amin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.my.fire.amin.dao.aminDAO;


@Service("aminService")
public class aminServiceImpl  implements aminService{

	@Resource(name="aminDAO")
	private aminDAO aminDAO;
	
	@Override
	public List<Map<String, Object>> member(Map<String, Object> map) {
		return aminDAO.member(map);
	}

	@Override
	public List<Map<String, Object>> search(Map<String, Object> map) {
		return aminDAO.search(map);
	}

	@Override
	public void memberup(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		aminDAO.memberup(map);
		
	}

	
}
