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
    private static final String filePath = "C:\\java fire\\src\\main\\webapp\\images\\UP\\";
    
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
    
    
    // 공지 파일 업로드_민재영
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

                list.add(listMap);
            }
        }
        return list;
    }
    
    // 공지수정 파일 업로드_민재영
    public static List<Map<String,Object>> noticeUpdate(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String notice_title = request.getParameter("NOTICE_TITLE");
         String notice_content = request.getParameter("NOTICE_CONTENT");
         String notice_index = request.getParameter("NOTICE_INDEX");     
         
        MultipartFile NOTICE_FILE_SIZE = null;
        String NOTICE_ORIGINAL = null;
        String originalFileExtension = null;
        String NOTICE_NEW_IMG = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         

         
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

                //업로드할 당시의 파일이름
                listMap.put("NOTICE_ORIGINAL", NOTICE_ORIGINAL);
                //저장할 파일 이름
                listMap.put("NOTICE_NEW_IMG", NOTICE_NEW_IMG);
                listMap.put("NOTICE_FILE_SIZE", NOTICE_FILE_SIZE.getSize());
                listMap.put("NOTICE_TITLE", notice_title);
                listMap.put("NOTICE_CONTENT", notice_content);
                listMap.put("NOTICE_INDEX", notice_index);
       
                
                list.add(listMap);
            }
        }
        return list;
    }
    
    // 이벤트 파일 업로드_정주영
    public static List<Map<String,Object>> eventUpload(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String event_title = request.getParameter("EVENT_TITLE");
         String event_content = request.getParameter("EVENT_CONTENT");
         
        MultipartFile EVENT_SIZE = null;
        String EVENT_IMG = null;
        String originalFileExtension = null;
        String EVENT_THUMB = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
        	EVENT_SIZE = multipartHttpServletRequest.getFile(iterator.next());
            if(EVENT_SIZE.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
            	EVENT_IMG = EVENT_SIZE.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = EVENT_IMG.substring(EVENT_IMG.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                EVENT_THUMB = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + EVENT_THUMB);
                EVENT_SIZE.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
                // listMap.put("BOARD_IDX", boardIdx);
                //업로드할 당시의 파일이름
                listMap.put("EVENT_IMG", EVENT_IMG);
                //저장할 파일 이름
                listMap.put("EVENT_THUMB", EVENT_THUMB);
                listMap.put("EVENT_SIZE", EVENT_SIZE.getSize());
                listMap.put("EVENT_TITLE", event_title);
                listMap.put("EVENT_CONTENT", event_content);

                list.add(listMap);
            }
        }
        return list;
    }
    
    // 이벤트 수정 파일 업로드_정주영
    public static List<Map<String,Object>> eventUpdate(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String event_title = request.getParameter("EVENT_TITLE");
         String event_content = request.getParameter("EVENT_CONTENT");
         String event_index = request.getParameter("EVENT_INDEX");     
         
        MultipartFile EVENT_SIZE = null;
        String EVENT_IMG = null;
        String originalFileExtension = null;
        String EVENT_THUMB = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
        
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
        	EVENT_SIZE = multipartHttpServletRequest.getFile(iterator.next());
            if(EVENT_SIZE.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
            	EVENT_IMG = EVENT_SIZE.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = EVENT_IMG.substring(EVENT_IMG.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                EVENT_THUMB = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + EVENT_THUMB);
                EVENT_SIZE.transferTo(file);
                 
                listMap = new HashMap<String,Object>();

                //업로드할 당시의 파일이름
                listMap.put("EVENT_IMG", EVENT_IMG);
                //저장할 파일 이름
                listMap.put("EVENT_THUMB", EVENT_THUMB);
                listMap.put("EVENT_SIZE", EVENT_SIZE.getSize());
                listMap.put("EVENT_TITLE", event_title);
                listMap.put("EVENT_CONTENT", event_content);
                listMap.put("EVENT_INDEX", event_index);
       
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
                listMap.put("USER_ORIGINAL", USER_ORIGINAL);
                //저장할 파일 이름
                listMap.put("USER_NEW_IMG", USER_NEW_IMG);
                listMap.put("USER_FILE_SIZE", USER_FILE_SIZE.getSize());
                listMap.put("USER_NIC", USER_NIC);
                listMap.put("USER_PW", USER_PW);
                listMap.put("USER_ID", USER_ID);

                
                list.add(listMap);
            }
        }
        return list;
    }


  //리뷰 사진 업로드_김형태
    public static List<Map<String,Object>> revieUpdate(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
        String USER_ID = request.getParameter("USER_ID");
        String REVIEW_TITLE = request.getParameter("REVIEW_TITLE");
        String REVIEW_CONTENT = request.getParameter("REVIEW_CONTENT");
        String DEL_GB = request.getParameter("DEL_GB");
        
        MultipartFile REVIEW_FILE_SIZE = null;
        String REVIEW_ORIGINAL = null;
        String originalFileExtension = null;
        String REVIEW_NEW_IMG = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
        	REVIEW_FILE_SIZE = multipartHttpServletRequest.getFile(iterator.next());
            if(REVIEW_FILE_SIZE.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
            	REVIEW_ORIGINAL = REVIEW_FILE_SIZE.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = REVIEW_ORIGINAL.substring(REVIEW_ORIGINAL.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                REVIEW_NEW_IMG = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + REVIEW_NEW_IMG);
                REVIEW_FILE_SIZE.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
                //업로드할 당시의 파일이름
                listMap.put("REVIEW_ORIGINAL", REVIEW_ORIGINAL);
                //저장할 파일 이름
                listMap.put("REVIEW_NEW_IMG", REVIEW_NEW_IMG);
                listMap.put("REVIEW_FILE_SIZE", REVIEW_FILE_SIZE.getSize());
                listMap.put("USER_ID", USER_ID);
                listMap.put("REVIEW_TITLE", REVIEW_TITLE);
                listMap.put("REVIEW_CONTENT", REVIEW_CONTENT);
                listMap.put("DEL_GB", DEL_GB);
         
                list.add(listMap);
            }
        }
        return list;
    }

    
    
// 인트로_김성법
    public static List<Map<String,Object>> introUpload(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String MAIN_TITLE = request.getParameter("MAIN_TITLE");
         String MAIN_CONTENT = request.getParameter("MAIN_CONTENT");
         String MAIN_KATE = request.getParameter("MAIN_KATE");
              
        MultipartFile MAIN_FILE_SIZE = null;
        String MAIN_IMG = null;
        String originalFileExtension = null;
        String MAIN_ORIGINAL = null;
        
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
        	MAIN_FILE_SIZE = multipartHttpServletRequest.getFile(iterator.next());
            if(MAIN_FILE_SIZE.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
            	MAIN_ORIGINAL = MAIN_FILE_SIZE.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = MAIN_ORIGINAL.substring(MAIN_ORIGINAL.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                MAIN_IMG = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + MAIN_IMG);
                MAIN_FILE_SIZE.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
                //업로드할 당시의 파일이름
                listMap.put("MAIN_ORIGINAL", MAIN_ORIGINAL);
                //저장할 파일 이름
                listMap.put("MAIN_IMG", MAIN_IMG);
                listMap.put("MAIN_FILE_SIZE", MAIN_FILE_SIZE.getSize());
                listMap.put("MAIN_TITLE", MAIN_TITLE);
                listMap.put("MAIN_CONTENT", MAIN_CONTENT);
                listMap.put("MAIN_KATE", MAIN_KATE);

                
                list.add(listMap);
            }
        }
        return list;
    }
    
    
    //FOOD 파일 업로드_이 솔
    public static List<Map<String,Object>> foodUpload(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String food_content = request.getParameter("FOOD_CONTENT");
         
        MultipartFile FOOD_SIZE = null;
        String FOOD_IMG = null;
        String originalFileExtension = null;
        String FOOD_THUMB = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
        	FOOD_SIZE = multipartHttpServletRequest.getFile(iterator.next());
            if(FOOD_SIZE.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
            	FOOD_IMG = FOOD_SIZE.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = FOOD_IMG.substring(FOOD_IMG.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                FOOD_THUMB = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + FOOD_THUMB);
                FOOD_SIZE.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
                // listMap.put("BOARD_IDX", boardIdx);
                //업로드할 당시의 파일이름
                listMap.put("FOOD_IMG", FOOD_IMG);
                //저장할 파일 이름
                listMap.put("FOOD_THUMB", FOOD_THUMB);
                listMap.put("FOOD_SIZE", FOOD_SIZE.getSize());
                listMap.put("FOOD_CONTENT", food_content);

                list.add(listMap);
            }
        }
        return list;
    }
    
    //FOOD 수정 파일 업로드_이 솔
    public static List<Map<String,Object>> foodUpdate(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String food_content = request.getParameter("FOOD_CONTENT");
         String food_index = request.getParameter("FOOD_INDEX");     
         
        MultipartFile FOOD_SIZE = null;
        String FOOD_IMG = null;
        String originalFileExtension = null;
        String FOOD_THUMB = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
        
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
        	FOOD_SIZE = multipartHttpServletRequest.getFile(iterator.next());
            if(FOOD_SIZE.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
            	FOOD_IMG = FOOD_SIZE.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = FOOD_IMG.substring(FOOD_IMG.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                FOOD_THUMB = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + FOOD_THUMB);
                FOOD_SIZE.transferTo(file);
                 
                listMap = new HashMap<String,Object>();

                //업로드할 당시의 파일이름
                listMap.put("FOOD_IMG", FOOD_IMG);
                //저장할 파일 이름
                listMap.put("FOOD_THUMB", FOOD_THUMB);
                listMap.put("FOOD_SIZE", FOOD_SIZE.getSize());
                listMap.put("FOOD_CONTENT", food_content);
                listMap.put("FOOD_INDEX", food_index);
       
                list.add(listMap);
            }
        }
        return list;
    }
}