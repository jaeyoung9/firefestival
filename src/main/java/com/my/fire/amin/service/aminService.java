package com.my.fire.amin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface aminService {

	// member
		List<Map<String, Object>> member(Map<String, Object> map) ;
	// search
		List<Map<String, Object>> search(Map<String, Object> map) ;
		
		void memberup(Map<String, Object> map) throws Exception;
}
