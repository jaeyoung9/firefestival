package com.my.fire.Notice.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

			// SimpleDate. 날짜값 변환.
			for(int i = 0; i< list.size(); i++) {// size만큼 값을 빼내고 반복.
				Object no = list.get(i).get("NOTICE_DATE");// 데이터 값 꺼내다 옵젝에 저장.
				String date = simpleDateFormat.format(no);// 변환
				//System.out.println(date);
				list.get(i).put("NOTICE_DATE",date);// 값 수정
			
			}
			
			
			
			mv.addObject("list", list);
			if(list.size() > 0) {
				mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}
	
			return mv;
			
		}
		
	// 공지사항 작성페이지 접속
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

		
	// 공지상세페이지 접속
	@RequestMapping("/notice/Detail")
	public ModelAndView noticeDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("noticeDetail");
		List<Map<String, Object>> NDetail = noticeService.noticeDetail(commandMap.getMap());
		mv.addObject("ndetail", NDetail);
		return mv;
	}	
	
	
	// 공지사항 수정페이지 접속
	@ResponseBody
	@RequestMapping(value = "/notice/Up" )
	public ModelAndView noticeUp(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("noticeUp");
		List<Map<String, Object>> NDetail = noticeService.noticeDetail(commandMap.getMap());
		return mv;
	}
	
	
	
		// 공지사항 수정
		@RequestMapping(value = "/notice/Up" , method = RequestMethod.POST)
		public ModelAndView noticeUpUp(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
			 if (log.isDebugEnabled()) {
		            log.debug(commandMap);
		        }
			noticeService.noticeUp(commandMap.getMap(), request);

			return mv;

		}
	
}
