package com.my.fire.join.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.fire.common.util.FileUtils;
import com.my.fire.join.dao.JoinDAO;

//회원가입 ServiceImpl_김형태
@Service("joinService")
public class JoinServiceImpl implements JoinService {
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	//id 중복 체크
	@Override
	public int joinIdCk(String id) throws Exception {
		return joinDAO.joinIdCk(id);
	}
	
	//nic 중복 체크
	@Override
	public int joinNicCk(String nic) throws Exception {
		return joinDAO.joinNicCk(nic);
	}

	//회원가입 완료
	@Override
	public void joinOk(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = fileUtils.userProfile(map, request);
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> vo = list.get(i);
		joinDAO.joinOk(vo);
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
}
