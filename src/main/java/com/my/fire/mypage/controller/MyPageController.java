package com.my.fire.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.common.CommandMap;
import com.my.fire.mypage.service.MyPageService;

@Controller
public class MyPageController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "mypageService")
	private MyPageService mypageService;
	
	@RequestMapping(value = "/mypage")
	public ModelAndView mypage(CommandMap commandMap,HttpServletResponse response, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("mypage");
//		HttpSession session = request.getSession();
//		String USER_ID = (String)session.getValue("USER_ID");
//		session.setAttribute("USER_ID", USER_ID);
		
		return mv;
	}
	
}
