package com.my.fire.Notice.controller;

import java.text.SimpleDateFormat;
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

import com.my.fire.Notice.service.NoticeService;
import com.my.fire.common.CommandMap;

@Controller
public class NoticeController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name ="noticeService")
	NoticeService noticeService;
	
	
	// 공지사항페이지 접속
	@ResponseBody
	@RequestMapping(value = "/notice")
	public ModelAndView notice(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("notice");	
		return mv;
	}
		//페이징 처리
		@RequestMapping(value ="/notice/page")
		public ModelAndView noticePage(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = noticeService.notice(commandMap.getMap());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

			
			for(int i = 0; i< list.size(); i++) {
				Object no = list.get(i).get("NOTICE_DATE");
				String date = simpleDateFormat.format(no);
				//System.out.println(date);
				list.get(i).put("NOTICE_DATE",date);
			
			}
			
			
			
			mv.addObject("list", list);
			if(list.size() > 0) {
				mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}
	
			return mv;
			
		}
	// 공지사항 상세페이지 이동
	@RequestMapping("/notice/Detail")
	public ModelAndView noticeDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("noticeDetail");
		List<Map<String, Object>> NDetail = noticeService.noticeDetail(commandMap.getMap());
		mv.addObject("ndetail", NDetail);
		return mv;
	}	
		
		
	// 공지사항 작성페이지 이동.
	@ResponseBody
	@RequestMapping(value = "/notice/Go")
	public ModelAndView noticeGo(CommandMap commandMap, HttpServletResponse response,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String AMIN_TIM = (String)session.getValue("AMIN_TIM");
		//System.out.println(AMIN_TIM);
		if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
			 response.sendRedirect("/fire/notice"); 
		} else if(AMIN_TIM.equals("Y")) {
			ModelAndView mv = new ModelAndView("noticeGo");
			return mv;
		}
		return null;
	}
		// 공지사항 작성.
		@RequestMapping(value = "/notice/Go" , method = RequestMethod.POST)
		public ModelAndView noticeGoGo(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
			 if (log.isDebugEnabled()) {
		            log.debug(commandMap);
		        }
			noticeService.noticeGo(commandMap.getMap(), request);

			return mv;

		}


	
	//공지사항 수정페이지 이동
	@ResponseBody
	@RequestMapping(value = "/notice/Up" )
	public ModelAndView noticeUp(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String AMIN_TIM = (String)session.getValue("AMIN_TIM");
		if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
			 response.sendRedirect("/fire/notice"); 
		} else if(AMIN_TIM.equals("Y")) {
			ModelAndView mv = new ModelAndView("noticeUp");
			Object a = request.getParameter("NOTICE_INDEX");
			commandMap.put("NOTICE_INDEX", a);
			List<Map<String, Object>> NDetail = noticeService.noticeDetail(commandMap.getMap());
			//System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁ              "+NDetail);
			mv.addObject("NDetail",NDetail);
			return mv;
		}
		return null;
	}
	
	
		// 공지사항 수정
		@RequestMapping(value = "/notice/UpUp" , method = RequestMethod.POST)
		public ModelAndView noticeUpmodify(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
			 if (log.isDebugEnabled()) {
		            log.debug(commandMap);
		        }
			noticeService.noticeUp(commandMap.getMap(), request);

			return mv;

		}
		
		// 공지사항 삭제
		@ResponseBody
		@RequestMapping(value = "/notice/De" )
		public ModelAndView noticeDe(CommandMap commandMap,  HttpServletResponse response, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			String AMIN_TIM = (String)session.getValue("AMIN_TIM");
			if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
				 response.sendRedirect("/fire/notice"); 
			} else if(AMIN_TIM.equals("Y")) {
				ModelAndView mv = new ModelAndView("notice");
				noticeService.noticeDe(commandMap.getMap());
				return mv;
			}
			return null;
			
		}
	
}


