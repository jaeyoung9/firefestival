package com.my.fire.Notice.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.Notice.service.NoticeService;
import com.my.fire.common.CommandMap;

@Controller
public class NoticeController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name ="noticeService")
	NoticeService noticeService;
	
	
	// 공지 페이지
	@ResponseBody
	@RequestMapping(value = "/notice")
	public ModelAndView notice(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("notice");	
		return mv;
	}
		// 페이징 처리
		@RequestMapping(value ="/notice/page")
		public ModelAndView noticePage(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = noticeService.notice(commandMap.getMap());
			mv.addObject("list", list);
			if(list.size() > 0) {
				mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}
			return mv;
		}
		
	// 공지사항 작성페이지
	@ResponseBody
	@RequestMapping(value = "/notice/Go")
	public ModelAndView noticeGo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("noticeGo");
		return mv;
	}
		// 공지사항 작성
		@RequestMapping(value = "/notice/Go" , method = RequestMethod.POST)
		public ModelAndView noticeGoGo(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
			 if (log.isDebugEnabled()) {
		            log.debug(commandMap);
		        }
			noticeService.noticeGo(commandMap.getMap(), request);

			return mv;

		}

	
}
