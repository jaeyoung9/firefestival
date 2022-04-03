package com.my.fire.calendar.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.my.fire.calendar.dao.CalendarDAO;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {
	
	@Resource(name="calendarDAO")
	private CalendarDAO calendarDAO;
	
	@Override
	public List<Map<String, Object>> selectCalendar(Map<String, Object> map) throws Exception{
		return calendarDAO.selectCalendar(map);
	}

}
