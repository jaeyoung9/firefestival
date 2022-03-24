package com.my.fire.Notice.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.fire.Notice.dao.NoticeDAO;
import com.my.fire.common.util.FileUtils;



//민재영 - notice
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	private static final Logger log = Logger.getLogger(NoticeServiceImpl.class);
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDao;
	
	@Resource
	private FileUtils fileUtils;

	
	//공지페이지
	@Override
	public List<Map<String, Object>> notice(Map<String, Object> map){
		// TODO Auto-generated method stub
		return noticeDao.notice(map);
	}
	
	//공지 상세페이지
	@Override
	public List<Map<String, Object>> noticeDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeDao.noticeDetail(map);
	}
	
	
	
	
	
	//공지 작성
	@Override
	public void noticeGo(Map<String, Object> map, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = fileUtils.noticeUpload(map, request);
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> noticeGo = list.get(i);

			noticeDao.noticeGo(noticeGo);
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

	//공지 수정dd
	@Override
	public void noticeUp(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = fileUtils.noticeUpdate(map, request);
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> noticeUp = list.get(i);

			noticeDao.noticeUp(noticeUp);
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

	//공지 삭제dd
	@Override
	public void noticeDe(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		noticeDao.noticeDe(map);
	}


	
	
}
