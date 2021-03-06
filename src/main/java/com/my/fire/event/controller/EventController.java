package com.my.fire.event.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.event.service.EventService;
import com.my.fire.common.CommandMap;

//정주영 - event
@Controller
public class EventController {

		Logger log = Logger.getLogger(this.getClass());
	
		@Resource(name ="eventService")
		EventService eventService;
	
		// 진행중 이벤트 페이지
		@ResponseBody
		@RequestMapping(value = "/event")
		public ModelAndView event(CommandMap commandMap,HttpServletRequest reqeust) throws Exception {
			ModelAndView mv = new ModelAndView("event");
			return mv;
		}
	
		// 종료된 이벤트 페이지
		@ResponseBody
		@RequestMapping(value = "/event/End")
		public ModelAndView eventEnd(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("eventEnd");	
			return mv;
		}
	
		// 진행중 이벤트 페이징 처리
		@RequestMapping(value ="/event/Page")
		public ModelAndView eventPage(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = eventService.event(commandMap.getMap());
			mv.addObject("list", list);
			if(list.size() > 0) {
				mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}
			return mv;
		}
		
		// 종료된 이벤트 페이징 처리
		@RequestMapping(value ="/event/End/Page")
		public ModelAndView eventPage1(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = eventService.eventEnd(commandMap.getMap());
			mv.addObject("list", list);
			if(list.size() > 0) {
				mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}
			return mv;
		}
		
		// 이벤트 신청
		@RequestMapping(value = "/event/Apply")
		public ModelAndView eventApply(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("eventDetail");
			List<Map<String, Object>> eventApply = eventService.eventApply(commandMap.getMap());		
			mv.addObject("eventApply", eventApply);
			return mv;
		}
		
		
		// 이벤트 신청 내역
		@RequestMapping(value = "/event/applyList")		  
		@ResponseBody
		public ModelAndView applyList(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("eventApplyList");
			List<Map<String, Object>> applyList = eventService.applyList(commandMap.getMap());
			mv.addObject("applyList", applyList); 
			return mv;
		}		 
		
		 /*
		// 이벤트 신청 내역 페이징
		@ResponseBody
		@RequestMapping(value = "/event/applyList")
		public ModelAndView applyList(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("eventApplyList");	
			return mv;
		}
		
		// 이벤트 신청 내역 페이징 처리
		@RequestMapping(value ="/event/applyList/Page")
		public ModelAndView applyPage(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = eventService.applyList(commandMap.getMap());
			mv.addObject("list", list);
			if(list.size() > 0) {
				mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}
			return mv;
		}
		*/

		// 이벤트 당첨 여부 수정
		@RequestMapping(value = "/event/Win", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView win(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("eventApplyList");
			eventService.win(commandMap.getMap());
			List<Map<String, Object>> applyList = eventService.applyList(commandMap.getMap());
			mv.addObject("applyList", applyList);
			return mv;
		}

		// 이벤트 작성페이지
		@ResponseBody
		@RequestMapping(value = "/event/Write")
		public ModelAndView eventWrite(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			String AMIN_TIM = (String)session.getValue("AMIN_TIM");
			//System.out.println(AMIN_TIM);
			if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
				 response.sendRedirect("/fire/main");
			} else if(AMIN_TIM.equals("Y")) {
				ModelAndView mv = new ModelAndView("eventWrite");
				return mv;
			}
			return null;
		}
		
		// 이벤트 작성
		@ResponseBody
		@RequestMapping(value = "/event/WWrite", method = RequestMethod.POST)
		public ModelAndView eventW(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("event");
			 if (log.isDebugEnabled()) {
				 log.debug(commandMap);
		     }
			eventService.eventWrite(commandMap.getMap(), request);
			System.out.println(commandMap);
			return mv;
		}
		
		// 이벤트 상세페이지
		@RequestMapping("/event/Detail")
		public ModelAndView eventDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("eventDetail");
			commandMap.put("EVENT_INDEX", request.getParameter("EVENT_INDEX"));
			List<Map<String, Object>> EDetail = eventService.eventDetail(commandMap.getMap());
			mv.addObject("edetail", EDetail);
			System.out.println(commandMap.getMap());
	
			return mv;
		}
		
		// 이벤트 수정페이지
		@ResponseBody
		@RequestMapping(value = "/event/Update" )
		public ModelAndView eventUpdate(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			String AMIN_TIM = (String)session.getValue("AMIN_TIM");
			if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
				 response.sendRedirect("/fire/main");
			} else if(AMIN_TIM.equals("Y")) {
				ModelAndView mv = new ModelAndView("eventUpdate");
				Object e = request.getParameter("EVENT_INDEX");
				commandMap.put("EVENT_INDEX", e);
				List<Map<String, Object>> EDetail = eventService.eventDetail(commandMap.getMap());
				//System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁ              "+EDetail);
				mv.addObject("EDetail",EDetail);
				return mv;
			}
			return null;
		}
		
		// 이벤트 수정
		@ResponseBody
		@RequestMapping(value = "/event/UUpdate" , method = RequestMethod.POST)
		public ModelAndView eventU(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("event");
				if (log.isDebugEnabled()) {
			           log.debug(commandMap);
			       }
			eventService.eventUpdate(commandMap.getMap(), request);

			return mv;

		}
			
		// 이벤트 삭제
		@ResponseBody
		@RequestMapping(value = "/event/Delete" )
		public ModelAndView eventDelete(CommandMap commandMap,  HttpServletResponse response, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			String AMIN_TIM = (String)session.getValue("AMIN_TIM");
			if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
				 response.sendRedirect("/fire/event"); 
			} else if(AMIN_TIM.equals("Y")) {
				ModelAndView mv = new ModelAndView("event");
				eventService.eventDelete(commandMap.getMap());
				return mv;
			}
			return null;
		}
		
}