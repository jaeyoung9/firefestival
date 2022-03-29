package com.my.fire.intro.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.fire.common.util.FileUtils;
import com.my.fire.intro.dao.IntroDAO;

@Service("introService")
public class IntroServiceImpl implements IntroService {

	/*
	 * private static final Logger log = Logger.getLogger(FileServiceImpl.class);
	 */ 
	
	@Resource(name = "introDAO")
	private IntroDAO introDAO;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	
	@Override
	public List<Map<String, Object>> intro(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return introDAO.intro(map);
	}
	@Override
	public List<Map<String, Object>> intro2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return introDAO.intro2(map);
	}

	@Override
	public void introUpload(Map<String, Object> map, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = fileUtils.introUpload(map, request);
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> vo = list.get(i);
			introDAO.introUpload(vo);
		}

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		
	}
	@Override
	public void introUp1(Map<String, Object> map, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = fileUtils.introUpload(map, request);
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> vo = list.get(i);
			introDAO.introUp1(vo);
		}

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		
	}
}

/*
 * while (iterator.hasNext()) { multipartFile =
 * multipartHttpServletRequest.getFile(iterator.next()); if
 * (multipartFile.isEmpty() == false) {
 * log.debug("---------- file start ----------"); log.debug("name : " +
 * multipartFile.getName()); log.debug("filename : " +
 * multipartFile.getOriginalFilename()); log.debug("size : " +
 * multipartFile.getSize()); log.debug("---------- file end ----------\n"); } }
 */
