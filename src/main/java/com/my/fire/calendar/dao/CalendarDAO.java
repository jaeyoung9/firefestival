package com.my.fire.calendar.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.fire.common.dao.AbstractDAO;


@Repository("calendarDAO")
public class CalendarDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCalendar(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("calendar.selectCalendar", map);
	}

}
