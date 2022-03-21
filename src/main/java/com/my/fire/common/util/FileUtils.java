package com.my.fire.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
    private static final String filePath = "C:\\java fire\\fire\\src\\main\\webapp\\images\\";
    
    public static boolean deleteFile(String storedFileName) {
        File file = new File(filePath + storedFileName);
        
        //upload가 있는지 확인
        //있을때만 작업한다
        if(file.exists()){
            if(file.delete()) {
                return true;
            }
        }
        return false;
    }
    
    
    // 공지 파일 업로드.
    public static List<Map<String,Object>> noticeUpload(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String notice_title = request.getParameter("NOTICE_TITLE");
         String notice_content = request.getParameter("NOTICE_CONTENT");
              
        MultipartFile NOTICE_FILE_SIZE = null;
        String NOTICE_ORIGINAL = null;
        String originalFileExtension = null;
        String NOTICE_NEW_IMG = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         
//        String boardIdx = (String)map.get("IDX");
         
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
        	NOTICE_FILE_SIZE = multipartHttpServletRequest.getFile(iterator.next());
            if(NOTICE_FILE_SIZE.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
            	NOTICE_ORIGINAL = NOTICE_FILE_SIZE.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = NOTICE_ORIGINAL.substring(NOTICE_ORIGINAL.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                NOTICE_NEW_IMG = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + NOTICE_NEW_IMG);
                NOTICE_FILE_SIZE.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
//                listMap.put("BOARD_IDX", boardIdx);
                //업로드할 당시의 파일이름
                listMap.put("NOTICE_ORIGINAL", NOTICE_ORIGINAL);
                //저장할 파일 이름
                listMap.put("NOTICE_NEW_IMG", NOTICE_NEW_IMG);
                listMap.put("NOTICE_FILE_SIZE", NOTICE_FILE_SIZE.getSize());
                listMap.put("NOTICE_TITLE", notice_title);
                listMap.put("NOTICE_CONTENT", notice_content);
                
              //  listMap.put("GOODS_PRICE", goods_price);
              //  listMap.put("GOODS_CONTENT", goods_content);
                
                list.add(listMap);
            }
        }
        return list;
    }
    
    
    //회원가입 프로필 사진 업로드_김형태
    public static List<Map<String,Object>> userProfile(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String USER_NIC = request.getParameter("USER_NIC");
         String USER_PW = request.getParameter("USER_PW");
         String USER_ID = request.getParameter("USER_ID");
              
        MultipartFile USER_FILE_SIZE = null;
        String USER_ORIGINAL = null;
        String originalFileExtension = null;
        String USER_NEW_IMG = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
        	USER_FILE_SIZE = multipartHttpServletRequest.getFile(iterator.next());
            if(USER_FILE_SIZE.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
            	USER_ORIGINAL = USER_FILE_SIZE.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = USER_ORIGINAL.substring(USER_ORIGINAL.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                USER_NEW_IMG = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + USER_NEW_IMG);
                USER_FILE_SIZE.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
                //업로드할 당시의 파일이름
                listMap.put("NOTICE_ORIGINAL", USER_ORIGINAL);
                //저장할 파일 이름
                listMap.put("NOTICE_NEW_IMG", USER_NEW_IMG);
                listMap.put("NOTICE_FILE_SIZE", USER_FILE_SIZE.getSize());
                listMap.put("USER_NIC", USER_NIC);
                listMap.put("USER_PW", USER_PW);
                listMap.put("USER_ID", USER_ID);

                
                list.add(listMap);
            }
        }
        return list;
    }


    
}