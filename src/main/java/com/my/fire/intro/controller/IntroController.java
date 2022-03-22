package com.my.fire.intro.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.common.CommandMap;
import com.my.fire.intro.service.IntroService;

@Controller
public class IntroController {

	@Resource(name = "introService")
	private IntroService introService;

	@RequestMapping("/intro")
	public ModelAndView intro(CommandMap commandMap, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> intro = introService.intro(commandMap.getMap());
		ModelAndView mv = new ModelAndView("intro");
		mv.addObject("intro", intro);
		return mv;
	}

	@RequestMapping(value = "/intro/WritePage")
	public ModelAndView introWritePage(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("introWritePage");
		return mv;

	}

	@RequestMapping(value = "/introWrite", method = RequestMethod.POST)

	public ModelAndView introWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("jsonView");

		introService.introUpload(commandMap.getMap(), request);

		return mv;

	}
}
