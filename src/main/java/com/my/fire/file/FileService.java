package com.my.fire.file;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FileService {
    
    public void insertgoodsimg(Map<String, Object> map, HttpServletRequest request) throws Exception;
    public void insertgoodsthumb(Map<String, Object> map, HttpServletRequest request) throws Exception;
    public void insertnotice(Map<String, Object> map, HttpServletRequest request) throws Exception;
    public void insertevent(Map<String, Object> map, HttpServletRequest request) throws Exception;
    public void insertfood(Map<String, Object> map, HttpServletRequest request) throws Exception;

}