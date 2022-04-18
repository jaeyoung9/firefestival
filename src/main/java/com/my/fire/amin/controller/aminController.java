package com.my.fire.amin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.amin.service.aminService;
import com.my.fire.common.CommandMap;

@Controller
public class aminController {
	
	static final long serialVersionUID = 1L;
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name ="aminService")
	aminService aminService;

	// 관리자페이지 접속.
	@RequestMapping("/amin")
	public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String AMIN_TIM = (String)session.getValue("AMIN_TIM");
		if(AMIN_TIM == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")) {
			ModelAndView mva = new ModelAndView("main");
			return mva;
			
		} else if(AMIN_TIM.equals("Y")){
			session.setAttribute("AMIN_TIM", AMIN_TIM);
			ModelAndView mv = new ModelAndView("amin");
			return mv;
		}else {
			ModelAndView mva = new ModelAndView("main");
			return mva;
		}
		
	}
	
	// 회원 관리.
	@ResponseBody
	@RequestMapping(value = "/member")
	public ModelAndView member(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String AMIN_TIM = (String)session.getValue("AMIN_TIM");
		if(AMIN_TIM == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")) {
			ModelAndView mva = new ModelAndView("main");
			return mva;
		} else if(AMIN_TIM.equals("Y")){
			session.setAttribute("AMIN_TIM", AMIN_TIM);
			ModelAndView mv = new ModelAndView("member");	
			return mv;
		}else {
			ModelAndView mva = new ModelAndView("main");
			return mva;
		}
		
	}
	// 회원 페이징처리.
	@RequestMapping("/member/page")
	public ModelAndView memberpage(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String AMIN_TIM = (String)session.getValue("AMIN_TIM");
	
		if(AMIN_TIM == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")) {
			ModelAndView mva = new ModelAndView("main");
			return mva;
			
		} else if(AMIN_TIM.equals("Y")){
			
			ModelAndView mv = new ModelAndView("jsonView");
			session.setAttribute("AMIN_TIM", AMIN_TIM);
			List<Map<String, Object>> list = aminService.member(commandMap.getMap());
		
			
			mv.addObject("list", list);
			if(list.size() > 0) {
				mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}
	
			return mv;
			
		}else {
			ModelAndView mva = new ModelAndView("main");
			return mva;
		}
		
	}
	
	//회원 검색
	@RequestMapping(value="/member/keyword")
	@ResponseBody
	public ModelAndView keyWord(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String AMIN_TIM = (String)session.getValue("AMIN_TIM");
		if(AMIN_TIM == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")) {
			ModelAndView mva = new ModelAndView("main");
			return mva;
		} else if(AMIN_TIM.equals("Y")){
			session.setAttribute("AMIN_TIM", AMIN_TIM);
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = aminService.search(commandMap.getMap());
			mv.addObject("list", list);
			return mv;
		}else {
			ModelAndView mva = new ModelAndView("main");
			return mva;
		}
	}

	//회원 수정
	@RequestMapping("/member/up")
	@ResponseBody
	public ModelAndView memberup(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String AMIN_TIM = (String)session.getValue("AMIN_TIM");
		if(AMIN_TIM == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")) {
			ModelAndView mva = new ModelAndView("main");
			return mva;
		} else if(AMIN_TIM.equals("Y")){
			session.setAttribute("AMIN_TIM", AMIN_TIM);
			ModelAndView mv = new ModelAndView("member");
			
			
			 if (commandMap.get("USER_BLIND") != null && commandMap.get("USER_EVENTAPPLY") == null && commandMap.get("AMIN_TIM") == null
					 && commandMap.get("DEL_GB") == null) {
				 
					commandMap.put("USER_BLIND", ((String)commandMap.get("USER_BLIND")).charAt(0));
					
				} else if (commandMap.get("USER_BLIND") == null && commandMap.get("USER_EVENTAPPLY") != null && commandMap.get("AMIN_TIM") == null 
						&& commandMap.get("DEL_GB") == null) {
					
					commandMap.put("USER_EVENTAPPLY", ((String)commandMap.get("USER_EVENTAPPLY")).charAt(0));
					
				} else if (commandMap.get("USER_BLIND") == null && commandMap.get("USER_EVENTAPPLY") == null && commandMap.get("AMIN_TIM") != null 
						&& commandMap.get("DEL_GB") == null) {
					
					commandMap.put("AMIN_TIM", ((String)commandMap.get("AMIN_TIM")).charAt(0));
					
				} else if (commandMap.get("USER_BLIND") == null && commandMap.get("USER_EVENTAPPLY") == null && commandMap.get("AMIN_TIM") == null 
						&& commandMap.get("DEL_GB") != null) {
					
					commandMap.put("DEL_GB", ((String)commandMap.get("DEL_GB")).charAt(0));
				}
				
			aminService.memberup(commandMap.getMap());
			return mv;
		}else {
			ModelAndView mva = new ModelAndView("main");
			return mva;
		}
	}
	
	
}
