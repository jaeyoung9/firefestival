package com.my.fire.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.fire.common.CommandMap;


@Controller
public class mainController {

	Logger log = Logger.getLogger(this.getClass());

	
	// 메인페이지 접속,
	@RequestMapping("/main")
	public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String USER_ID = (String)session.getValue("USER_ID");
		ModelAndView mv = new ModelAndView("main");
		session.setAttribute("USER_ID", USER_ID);
		return mv;
	}
	
	// 아이디 추천
	public String idck(String new_id) {
	       
        String user = new_id.toLowerCase();// toLowerCase() 대문자소문자로 변신시켜줌.
               user = user.replaceAll("[^a-z0-9-_.]","");// 소문자 숫자 9 가 아닐경우 "" 공백을
               user = user.replaceAll("[.]{2}",".");// .이 2개이상일경우 .하나만
               user = user.replaceAll("^[.]|[.]$","");// 처음과 끝에 .이 찍히면 공백을 
        if(user.equals("")) {// 비교대상이 공백일경우 
            user += "a";
        }// a를 더해주고 
          if(user.length() >= 16){// 길이가 16이상 일경우 
              user = user.substring(0,15);// 길이를 0 ~ 15까지 제한을 걸고 
              user = user.replaceAll("^[.]|[.]$","");// 다시 처음과 끝에 .이 찍히면 공백을 
          }
            if(user.length() <= 2){ // 길이가 2개보다 작을경우
             while(user.length() < 3)// 3번보다 크면 
                 user +=user.charAt(user.length()-1); 
            }
     
        return user;
    }
	
	//문자열 압축 
	public int solution(String s) {
		int answer = s.length();
		
		for (int i=1; i <= s.length()/2; ++i) {
			int pos = 0;
			int len = s.length();
			
			for( ; pos + i <=s.length();) {
				String unit = s.substring(pos, pos + i); // 첫 값이 들어오고 
				pos += i;// pos하나를 증가 
				
				int cnt =  0;
				for( ; pos + i <= s.length();) {
					if(unit.equals(s.subSequence(pos,  pos +i))) { // 값가지고 와서 비교후 같으면 카운트 +1
						++cnt;
						pos += i;
					} else {
						break;
					}
				}
				if(cnt > 0) {
					len -= i * cnt;
					
					if (cnt < 9) len += 1;
					else if (cnt < 99) len += 2;
					else if (cnt < 999) len += 3;
					else len += 4;
				}
			}
			
			answer = Math.min(answer, len);
		}
		return answer;
	}
	
}
