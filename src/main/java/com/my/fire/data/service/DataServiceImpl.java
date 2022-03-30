package com.my.fire.data.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.fire.data.dao.DataDAO;
import com.my.fire.common.util.FileUtils;

// 조영준 - data
@Service("dataService")
public class DataServiceImpl implements DataService {

	// log
	private static final Logger log = Logger.getLogger(DataServiceImpl.class);
	
	@Resource(name="dataDAO")
	private DataDAO dataDao;
	
	@Resource
	private FileUtils fileUtils;
	
		//자료실 페이지
		@Override
		public List<Map<String, Object>> data(Map<String, Object> map){
			// TODO Auto-generated method stub
			return dataDao.data(map);
		}
		
		//자료실 상세페이지
				@Override
				public List<Map<String, Object>> dataDetail(Map<String, Object> map) {
					// TODO Auto-generated method stub
					return dataDao.dataDetail(map);
				}
				
		//자료실 작성
		@Override
		public void dataWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
			List<Map<String, Object>> list = fileUtils.dataUpload(map, request);
			for(int i = 0; i < list.size(); i++) {
				Map<String, Object> dataWrite = list.get(i);

				dataDao.dataWrite(dataWrite);
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

		// 자료실 수정
		@Override
		public void dataUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
			// TODO Auto-generated method stub
			List<Map<String, Object>> list = fileUtils.dataUpdate(map, request);
			for(int i = 0; i < list.size(); i++) {
				Map<String, Object> dataUpdate = list.get(i);
			
			dataDao.dataUpdate(dataUpdate);
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


		// 자료실 삭제
		@Override
		public void dataDelete(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			dataDao.dataDelete(map);
		}
		
}