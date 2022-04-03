package com.my.fire.food;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.fire.common.util.FileUtils;

//이 솔 - FOOD
@Service("foodService")
public class FoodServiceImpl implements FoodService {

	//log
	private static final Logger log = Logger.getLogger(FoodServiceImpl.class);
		
	@Resource(name="foodDAO")
	private FoodDAO foodDao;
				
	@Resource
	private FileUtils fileUtils;
		
	//FOOD 페이지
	@Override
	public List<Map<String, Object>> food(Map<String, Object> map){
		// TODO Auto-generated method stub
		return foodDao.food(map);
	}
			
	//FOOD 상세 페이지
	@Override
	public List<Map<String, Object>> foodDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return foodDao.foodDetail(map);
	}
			
	//FOOD 작성
	@Override
	public void foodWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = fileUtils.foodUpload(map, request);
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> foodWrite = list.get(i);
			foodDao.foodWrite(foodWrite);
		}
				
	//log
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

	//FOOD 수정
	@Override
	public void foodUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = fileUtils.foodUpdate(map, request);
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> foodUpdate = list.get(i);
			foodDao.foodUpdate(foodUpdate);
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
	
	//FOOD 삭제
	@Override
	public void foodDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		foodDao.foodDelete(map);
	}
}