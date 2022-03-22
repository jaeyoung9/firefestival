//package com.my.fire.review.controller;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.my.fire.common.CommandMap;
//import com.my.fire.review.service.ReviewService;
//
//@Controller
//public class ReviewController {
//
//	Logger log = Logger.getLogger(this.getClass());
//	
//	@Resource(name="reviewService")
//	ReviewService reviewService;
//	
//	// 리뷰 페이지
//	@ResponseBody
//	@RequestMapping(value = "/reviewPage")
//	public ModelAndView notice(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("reviewPage");	
//		return mv;
//	}
//	// 페이징 처리
//	@RequestMapping(value ="/reviewPage/page")
//	public ModelAndView noticePage(CommandMap commandMap) throws Exception{
//		ModelAndView mv = new ModelAndView("jsonView");
//		List<Map<String, Object>> list = reviewService.notice(commandMap.getMap());
//		mv.addObject("list", list);
//		if(list.size() > 0) {
//			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
//		} else {
//			mv.addObject("TOTAL", 0);
//		}
//		return mv;
//	}
//	
//	// 리뷰 작성 페이지
//	@ResponseBody
//	@RequestMapping(value = "/reviewWrite")
//	public ModelAndView noticeGo(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("reviewUserWrite");
//		return mv;
//	}
//	
//	// 리뷰 작성 페이지 이동
//	@RequestMapping(value = "/reviewWrite")
//	public ModelAndView reviewWritePage(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("reviewWrite");
//	//	List<Map<String, Object>> reviewWritePage = reviewService.reviewUserWrite(commandMap.getMap());
//		HttpSession session = request.getSession();// 세션 값 불러오고
//		String USER_ID = (String) session.getValue("USER_ID");// 값을 String 저장하고
//	//	mv.addObject("reviewWritePage", reviewWritePage);
//		session.setAttribute("USER_ID", USER_ID);// 세션정보를 user_id 에 담아 jsp로 리턴
//			
//		return mv;
//	}
//	
//	// 리뷰 작성
//	@RequestMapping(value = "/reviewUserWrite" , method = RequestMethod.POST)
//	public ModelAndView noticeGoGo(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("jsonView");
//			if (log.isDebugEnabled()) {
//				log.debug(commandMap);
//			}
//		reviewService.reviewUserWrite(commandMap.getMap(), request);
//		return mv;
//	}
//}
