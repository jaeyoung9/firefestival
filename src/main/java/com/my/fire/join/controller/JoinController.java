package com.my.fire.join.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.common.CommandMap;
import com.my.fire.join.service.JoinService;

//회원가입 Controller_김형태
@Controller
public class JoinController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "joinService")
	private JoinService joinService;
	
	//회원가입
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public ModelAndView joinForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("joinForm");
		return mv;
	}
	// 회원가입 폼
	@RequestMapping(value = "/joinForm", method = RequestMethod.POST)
    public String registerPOST(String id) throws Exception {
        int idResult = joinService.joinIdCk(id);

        try {
            if (idResult == 1) {
                return "joinForm";
            } else if (idResult == 0) {
                joinService.joinIdCk(id);
                return "redirect:loginForm";
            }
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return "redirect:/";
    }
	
	//회원가입완료
	@ResponseBody
	@RequestMapping(value = "/joinOk", method =RequestMethod.GET)
	public ModelAndView noticeGo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("loginForm");
		return mv;
	}
	@RequestMapping(value = "/joinOk", method = RequestMethod.POST)
	public ModelAndView joinOk(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		if (log.isDebugEnabled()) {
            log.debug(commandMap);
        }
		joinService.joinOk(commandMap.getMap(), request);
		
		return mv;
	}

	//id 중복 체크
	@RequestMapping(value = "/joinIdCk", method = RequestMethod.POST)
	@ResponseBody
	public int joinIdCk(String id) throws Exception {
		int result = joinService.joinIdCk(id);
		return result;
	}
}
