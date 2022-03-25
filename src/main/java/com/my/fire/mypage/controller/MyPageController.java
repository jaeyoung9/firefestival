package com.my.fire.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.common.CommandMap;
import com.my.fire.mypage.service.MyPageService;

@Controller
public class MyPageController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "mypageService")
	private MyPageService mypageService;

	// 마이페이지 보기
	@RequestMapping(value = "/mypage")
	public ModelAndView mypage(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView mv = new ModelAndView("mypage");
		List<Map<String, Object>> list = mypageService.myreview(commandMap.getMap());
		List<Map<String, Object>> list1 = mypageService.myevent(commandMap.getMap());
		
		mv.addObject("list", list);
		mv.addObject("list1", list1);
		HttpSession session = request.getSession();
		String USER_ID = (String) session.getValue("USER_ID");
		session.setAttribute("USER_ID", USER_ID);
		System.out.println(list);
		return mv;
	}
	
	// 마이페이지 자기 리뷰
//	@RequestMapping(value = "/mypage/myreview")
//	public ModelAndView myreview(CommandMap commandMap,HttpServletRequest request) throws Exception{
//		ModelAndView mv = new ModelAndView("mypage");
//		commandMap.put("USER_ID", "qwe");
//		System.out.println(commandMap.getMap());
//		List<Map<String, Object>> list = mypageService.myreview(commandMap.getMap());
//		List<Map<String, Object>> list1 = mypageService.myevent(commandMap.getMap());
//		
//		mv.addObject("list", list);
//		mv.addObject("list1", list1);
//		System.out.println(list);
//		System.out.println(list1);
//		return mv;
//	}

	// 마이페이지 수정폼
	@RequestMapping(value = "/mypage/myUpdate", method = RequestMethod.GET)
	public ModelAndView myUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("myUpdate");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USER_ID");
		commandMap.put("USER_ID", id);

		Map<String, Object> map = mypageService.myPage(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// 마이페이지 수정완료
	@RequestMapping(value = "/mypage/myUpdateok", method = RequestMethod.POST)
	public ModelAndView myUpdateOk(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("mypage");
		mypageService.myUpdate(commandMap.getMap());
		return mv;
	}

	// 회원탈퇴
	@RequestMapping(value = "/mypage/withdraw")
	public ModelAndView withdraw(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/logout");

		HttpSession session = request.getSession();
		commandMap.put("USER_ID", session.getAttribute("USER_ID"));
		mypageService.withdraw(commandMap.getMap());

		return mv;
	}

	// 회원정보 수정 - 비밀번호 수정폼
	@RequestMapping(value = "/mypage/checkPwForm")
	public ModelAndView checkPwForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("checkPwForm");
		return mv;
	}

	// 회원정보 수정 비밀번호 확인
	@RequestMapping(value = "/mypage/checkPw", method = RequestMethod.POST)
	public ModelAndView checkPw(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("checkPw");
		HttpSession session = request.getSession(true);

		String message = "";

		Map<String, Object> result = mypageService.checkPw(commandMap.getMap());

		if (result == null) {
			message = "비밀번호가 일치하지 않습니다.";
		} else if (result.get("USER_PW").equals(commandMap.get("USER_PW"))) {
			session.setAttribute("USER_ID", result.get("USER_ID"));
		}
		mv.addObject("message", message);
		return mv;
	}

}
