package com.my.fire.data.controller;

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

import com.my.fire.common.CommandMap;
import com.my.fire.data.service.DataService;

// 조영준 - data
@Controller
public class DataController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name ="dataService")
	DataService dataService;
	
		// 자료실 페이지
		@ResponseBody
		@RequestMapping(value = "/data")
		public ModelAndView data(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("data");	
			return mv;
		}
		// 페이징
		@RequestMapping(value ="/data/page")
		public ModelAndView dataPage(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = dataService.data(commandMap.getMap());
			mv.addObject("list", list);
			if(list.size() > 0) {
				mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}
			return mv;
		}
		
		// 자료실 작성페이지
		@ResponseBody
		@RequestMapping(value = "/data/Write")
		public ModelAndView dataWrite(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			String AMIN_TIM = (String)session.getValue("AMIN_TIM");
			
			if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
				 response.sendRedirect("/fire/main");
			} else if(AMIN_TIM.equals("Y")) {
				ModelAndView mv = new ModelAndView("dataWrite");
				return mv;
			}
			return null;
		}
		
		// 자료실 작성
		@RequestMapping(value = "/data/WriteGo", method = RequestMethod.POST)
		public ModelAndView dataW(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
			 if (log.isDebugEnabled()) {
				 log.debug(commandMap);
		     }
			 System.out.println(commandMap.getMap());
			dataService.dataWrite(commandMap.getMap(), request);
			return mv;
		}
		
		// 자료실 상세페이지
				@RequestMapping("/data/Detail")
				public ModelAndView dataDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
					ModelAndView mv = new ModelAndView("dataDetail");
					List<Map<String, Object>> DDetail = dataService.dataDetail(commandMap.getMap());
					mv.addObject("ddetail", DDetail);
					return mv;
				}
		// 자료실 수정페이지
		@ResponseBody
		@RequestMapping(value = "/data/Update" )
		public ModelAndView dataUpdate(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			String AMIN_TIM = (String)session.getValue("AMIN_TIM");
			if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
				 response.sendRedirect("/fire/data"); 
			} else if(AMIN_TIM.equals("Y")) {
				ModelAndView mv = new ModelAndView("dataUpdate");
				Object e = request.getParameter("DATA_INDEX");
				commandMap.put("DATA_INDEX", e);
				List<Map<String, Object>> DDetail = dataService.dataDetail(commandMap.getMap());
				mv.addObject("DDetail",DDetail);
				return mv;
			}
			return null;
		}
		
		// 자료실 수정
		@RequestMapping(value = "/data/UpUpdate" , method = RequestMethod.POST)
		public ModelAndView dataU(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
				if (log.isDebugEnabled()) {
			           log.debug(commandMap);
			       }
			dataService.dataUpdate(commandMap.getMap(), request);

			return mv;

		}
			
		// 자료실 삭제
		@ResponseBody
		@RequestMapping(value = "/data/Delete" )
		public ModelAndView dataDelete(CommandMap commandMap,  HttpServletResponse response, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			String AMIN_TIM = (String)session.getValue("AMIN_TIM");
			if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
				 response.sendRedirect("/fire/data"); 
			} else if(AMIN_TIM.equals("Y")) {
				ModelAndView mv = new ModelAndView("data");
			    dataService.dataDelete(commandMap.getMap());
				return mv;
			}
			return null;
		}
		
}