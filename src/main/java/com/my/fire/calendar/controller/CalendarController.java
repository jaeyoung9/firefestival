package com.my.fire.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.fire.calendar.service.CalendarService;
import com.my.fire.common.CommandMap;

@Controller
public class CalendarController {
	
//	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="calendarService")
	CalendarService calendarService;
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/event/calendar", method = RequestMethod.GET)
	public List<Map<String, Object>> selectCalendar(CommandMap commandMap, HttpServletRequest request) throws Exception{
		List<Map<String, Object>> list = calendarService.selectCalendar(commandMap.getMap());
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();
		
		for(int i = 0; i<list.size(); i++) {
			hash.put("title", list.get(i).get("EVENT_TITLE"));
			hash.put("start", list.get(i).get("EVENT_START"));
			hash.put("end", list.get(i).get("EVENT_END"));
			
			jsonObj = new JSONObject();
			jsonObj.putAll(hash);
			jsonArr.add(jsonObj);
			
			System.out.println(jsonArr);
		}
		return jsonArr;
	}
	
}
