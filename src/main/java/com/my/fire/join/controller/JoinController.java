package com.my.fire.join.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	@ResponseBody //json 방식이랑 object방식으로 값이 넘어가게하는거
	@RequestMapping(value = "/joinForm")
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
	@RequestMapping(value = "/joinOk")
	@ResponseBody
	public ModelAndView joinOk(CommandMap commandMap, MultipartHttpServletRequest multirequest) throws Exception {
		ModelAndView mv = new ModelAndView("loginForm");
		joinService.joinOk(commandMap.getMap(), multirequest);
		return mv;
	}
	
//	두개를 넣을 필요가 없었다. 디비에 아이디가 두개 저장됨. 
//	@RequestMapping(value = "/joinOk", method = RequestMethod.POST)
//	public ModelAndView joinOkOk(CommandMap commandMap, MultipartHttpServletRequest multirequest) throws Exception {
//		ModelAndView mv = new ModelAndView("loginForm");
//		if (log.isDebugEnabled()) {
//            log.debug(commandMap);
//      }
//		joinService.joinOk(commandMap.getMap(), request);
//		
//		return mv;
//	}

	//id 중복 체크
	@RequestMapping(value = "/joinIdCk", method = RequestMethod.POST)
	@ResponseBody
	public int joinIdCk(String id) throws Exception {
		int result = joinService.joinIdCk(id);
		return result;
	}
	
	//NIC 중복 체크
	@RequestMapping(value = "/joinNicCk", method = RequestMethod.POST)
	@ResponseBody
	public int joinNicCk(String nic) throws Exception {
		int result = joinService.joinNicCk(nic);
		return result;
	}
}
