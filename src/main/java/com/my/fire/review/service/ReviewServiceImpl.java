package com.my.fire.review.service;

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
import com.my.fire.review.dao.ReviewDAO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	private static final Logger log = Logger.getLogger(ReviewServiceImpl.class);
	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;
	
	@Resource
	private FileUtils fileUtils;

	//리뷰 페이지
	@Override
	public List<Map<String, Object>> notice(Map<String, Object> map){
		// TODO Auto-generated method stub
		return reviewDAO.reviewPage(map);
	}
	
	//리뷰 작성
	@Override
	public void reviewUserWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = fileUtils.userProfile(map, request);
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> vo = list.get(i);
		reviewDAO.reviewUserWrite(vo);
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

	//리뷰 상세
	@Override
	public List<Map<String, Object>> reviewDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return reviewDAO.reviewDetail(map);
	}

	//리뷰 삭제
	@Override
	public void reviewDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.reviewDelete(map);
	}

	//리뷰 수정
	@Override
	public void reviewUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.reviewUpdate(map);
	}
	
	
}
