package com.my.fire.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.common.CommandMap;


@Controller
public class mainController {

	
	
	@RequestMapping("/main")
	public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String USER_ID = (String)session.getValue("USER_ID");
		ModelAndView mv = new ModelAndView("main");
		session.setAttribute("USER_ID", USER_ID);
		return mv;
	}
	
}
