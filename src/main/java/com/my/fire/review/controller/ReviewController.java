package com.my.fire.review.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.common.CommandMap;
import com.my.fire.mypage.service.MyPageService;
import com.my.fire.review.service.ReviewService;

@Controller
public class ReviewController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewService")
	ReviewService reviewService;
	
	@Resource(name = "mypageService")
	private MyPageService mypageService;
	
	// 리뷰 페이지
	@ResponseBody
	@RequestMapping(value = "/review")
	public ModelAndView reviewPage(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("review");	
		return mv;
	}
	// 페이징 처리
	@RequestMapping(value ="/review/page")
	public ModelAndView reviewPageList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = reviewService.review(commandMap.getMap());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i = 0; i< list.size(); i++) {
			Object ob = list.get(i).get("REVIEW_DATE");
			String date = simpleDateFormat.format(ob);
			//System.out.println(date);
			list.get(i).put("REVIEW_DATE",date);
		
		}
		
		mv.addObject("list", list);
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	// 리뷰 작성 페이지
	@RequestMapping(value = "/reviewWritePage")
	@ResponseBody
	public ModelAndView reviewUserWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("reviewWritePage");
//		Map<String, Object> map = mypageService.myPage(commandMap.getMap());
		HttpSession session = request.getSession();// 세션 값 불러오고
		String USER_ID = (String) session.getValue("USER_ID");// 값을 String 저장하고		
		session.setAttribute("USER_ID", USER_ID);// 세션정보를 user_id 에 담아 jsp로 리턴
//		mv.addObject("map",map);
//		System.out.println(map);
		return mv;
	}
	
	
	// 리뷰 작성
	@RequestMapping(value = "/reviewWrite/Page", method = RequestMethod.POST)
	public ModelAndView reviewUserWriteGo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
			if (log.isDebugEnabled()) {
				log.debug(commandMap);
			}
		reviewService.reviewUserWrite(commandMap.getMap(), request);
		return mv;
	}
	
	// 리뷰 상세 페이지 이동
	@RequestMapping(value = "/reviewDetail")
	public ModelAndView reviewDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("reviewDetail");
			
		List<Map<String, Object>> reviewDetail = reviewService.reviewDetail(commandMap.getMap());
		mv.addObject("reviewDetail", reviewDetail);
			
		return mv;
	}
		
	// 리뷰 삭제
	@RequestMapping(value="/reviewDelete" )
	public ModelAndView reviewDelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("review");		
		HttpSession session = request.getSession();// 세션 값 불러오고
		String USER_ID = (String) session.getValue("USER_ID");// 값을 String 저장하고		
		session.setAttribute("USER_ID", USER_ID);// 세션정보를 user_id 에 담아 jsp로 리턴		
		
		reviewService.reviewDelete(commandMap.getMap());
		return mv;
	}
	
	//리뷰 수정
	@RequestMapping(value="/reviewUpdate")
	public ModelAndView reviewUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("reviewUpdate");
		
		HttpSession session = request.getSession();// 세션 값 불러오고
		String USER_ID = (String) session.getValue("USER_ID");// 값을 String 저장하고		
		session.setAttribute("USER_ID", USER_ID);// 세션정보를 user_id 에 담아 jsp로 리턴
		
		Map<String, Object> reviewUp = reviewService.reviewImpo(commandMap.getMap());
		mv.addObject("reviewUp", reviewUp);
		return mv;
	}
	
	// 리뷰 수정 완료
	@RequestMapping(value = "/reviewUpdate/up", method = RequestMethod.POST)
	public ModelAndView reviewUpdateOk(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
//		System.out.println(commandMap.get("USER_ID"));
		reviewService.reviewUpdate(commandMap.getMap(), request);
		return mv;
	}
}
