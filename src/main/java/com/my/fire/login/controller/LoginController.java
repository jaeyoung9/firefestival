package com.my.fire.login.controller;

import java.io.PrintWriter;
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
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.common.CommandMap;
import com.my.fire.login.service.LoginService;

//로그인 Controller_김형태
@Controller
public class LoginController {


	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "loginService")
	private LoginService loginService;

	//로그인폼
	   @RequestMapping(value = "/loginForm")
	    public String loginForm(HttpServletRequest request) throws Exception {

	        HttpSession session = request.getSession();
	        String getId = (String) session.getValue("USER_ID");
	        if (getId == null) {
	            return "loginForm";
	        }
	        return "main";
	    }

	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	   public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
	      ModelAndView mav = new ModelAndView("login");
	      HttpSession session = request.getSession();
	      String message="";
	      String url="";
	      Map<String,Object> result = loginService.loginMemberCk(commandMap.getMap());
	      if(result == null || result.get("DEL_GB").equals("Y")) { // 아이디가 있는지 or 삭제된 아이디인지 확인
	         message="해당 아이디가 존재하지 않습니다.";
	      } else { 
	    	  if(result.get("USER_PW").equals(commandMap.get("USER_PW"))) { // 비밀번호가 같다면
	    		  session.setAttribute("USER_ID", commandMap.get("USER_ID"));
	    		  session.setAttribute("AMIN_TIM", result.get("AMIN_TIM"));
	    	  } else {//비밀번호가 일치하지 않을 때
	    		  message="비밀번호가 맞지 않습니다.";
	    	  }
	      }
	      mav.addObject("message", message);
	      return mav;
	}
	//로그아웃
	@RequestMapping(value="/logout")
	   public void logout(HttpServletRequest request,HttpServletResponse response,CommandMap commandMap) throws Exception {
	      HttpSession session = request.getSession(false);
	      if (session != null)
	         session.invalidate();
	      
	      response.setCharacterEncoding("UTF-8");
		  response.setContentType("text/html; charset=utf-8");
		  PrintWriter out = response.getWriter();
		  out.println("<script>alert('로그아웃됐습니다.'); location.href='"+request.getContextPath()+"/main';</script>");
		 
		  out.flush();
	   }
	//아이디 찾기 폼
	 @RequestMapping(value = "/loginForm/findId") // 아이디&비밀번호 찾기 폼을 보여주는 메소드
	   public ModelAndView findId(CommandMap commandMap) throws Exception {
	      ModelAndView mv = new ModelAndView("findId");
	      return mv;
	   }
	 //아이디 찾기 결과
	 @RequestMapping(value = "/findIdResult", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
	   public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
	         ModelAndView mv = new ModelAndView("findIdResult");
	         List<Map<String, Object>> list = loginService.findId(commandMap.getMap());
	         mv.addObject("list", list);
	         return mv;
	      }
	 //비밀번호 찾기 폼
	 @RequestMapping(value = "/loginForm/findPw")
		public ModelAndView findPw(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("findPw");
		    return mv;
		}
	 //비밀번호 찾기 결과
	 @RequestMapping(value = "/findPwResult", method = RequestMethod.POST) // 입력한 정보에 맞춰서 비밀번호를 찾아주는 거
	   public ModelAndView findPwResult(CommandMap commandMap) throws Exception {
	         ModelAndView mv = new ModelAndView("findPwResult");
	         List<Map<String, Object>> list = loginService.findPw(commandMap.getMap());
	         mv.addObject("list", list);
	         return mv;
	      }
}
