package com.my.fire.amin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.common.CommandMap;

@Controller
public class aminController {

	// 관리자페이지 접속,
	@RequestMapping("/amin")
	public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String AMIN_TIM = (String)session.getValue("AMIN_TIM");
		//System.out.println(AMIN_TIM);
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
}
