package com.my.fire.event.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.fire.event.dao.EventDAO;
import com.my.fire.common.util.FileUtils;

//정주영 - event
@Service("eventService")
public class EventServiceImpl implements EventService {

	// log
	private static final Logger log = Logger.getLogger(EventServiceImpl.class);
	
	@Resource(name="eventDAO")
	private EventDAO eventDao;
	
	@Resource
	private FileUtils fileUtils;
	
		//이벤트 페이지
		@Override
		public List<Map<String, Object>> event(Map<String, Object> map){
			// TODO Auto-generated method stub
			return eventDao.event(map);
		}
		
		//이벤트 상세페이지
		@Override
		public List<Map<String, Object>> eventDetail(Map<String, Object> map) {
			// TODO Auto-generated method stub
			return eventDao.eventDetail(map);
		}
		
		//이벤트 작성
		@Override
		public void eventWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
			List<Map<String, Object>> list = fileUtils.eventUpload(map, request);
			for(int i = 0; i < list.size(); i++) {
				Map<String, Object> eventWrite = list.get(i);

				eventDao.eventWrite(eventWrite);
			}
			
					// log
					MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
					Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
					MultipartFile multipartFile = null;
					while (iterator.hasNext()) {
						multipartFile = multipartHttpServletRequest.getFile(iterator.next());
						if (multipartFile.isEmpty() == false) {
							log.debug("---------- file start ----------");
							log.debug("name : " + multipartFile.getName());
							log.debug("filename : " + multipartFile.getOriginalFilename());
							log.debug("size : " + multipartFile.getSize());
							log.debug("---------- file end ----------\n");
						}
					}
		}

		// 이벤트 수정
		@Override
		public void eventUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
			// TODO Auto-generated method stub
			List<Map<String, Object>> list = fileUtils.eventUpdate(map, request);
			for(int i = 0; i < list.size(); i++) {
				Map<String, Object> eventUpdate = list.get(i);
			
			eventDao.eventUpdate(eventUpdate);
		}
			
			// log
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
			MultipartFile multipartFile = null;
			while (iterator.hasNext()) {
				multipartFile = multipartHttpServletRequest.getFile(iterator.next());
				if (multipartFile.isEmpty() == false) {
					log.debug("---------- file start ----------");
					log.debug("name : " + multipartFile.getName());
					log.debug("filename : " + multipartFile.getOriginalFilename());
					log.debug("size : " + multipartFile.getSize());
					log.debug("---------- file end ----------\n");
				}
			}
		}


		// 이벤트 삭제
		@Override
		public void eventDelete(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			eventDao.eventDelete(map);
		}
		
}