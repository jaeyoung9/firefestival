package com.my.fire.food;

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

// 이 솔 - FOOD
@Controller
public class FoodController {

	Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name ="foodService")
	FoodService foodService;
	
	// 먹거리 페이지
	@ResponseBody
	@RequestMapping(value = "/food")
	public ModelAndView food(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("food");	
		return mv;
	}
	
	// 먹거리 페이징 처리
	@RequestMapping(value ="/food/page")
	public ModelAndView foodPage(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = foodService.food(commandMap.getMap());
		mv.addObject("list", list);
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
		
	// 푸드트럭 페이지
	@ResponseBody
	@RequestMapping(value = "/truck")
	public ModelAndView truck(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("truck");	
		return mv;
	}
	
	// 푸드트럭 페이징 처리
	@RequestMapping(value ="/truck/page")
	public ModelAndView truckPage(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = foodService.truck(commandMap.getMap());
		mv.addObject("list", list);
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
			
	// FOOD 작성 페이지
	@ResponseBody
	@RequestMapping(value = "/food/Write")
	public ModelAndView foodWrite(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String AMIN_TIM = (String)session.getValue("AMIN_TIM");
		//System.out.println(AMIN_TIM);
		if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
			 response.sendRedirect("/fire/main");
		} else if(AMIN_TIM.equals("Y")) {
			ModelAndView mv = new ModelAndView("foodWrite");
			return mv;
		}
		return null;
	}
			
	// FOOD 작성
	@ResponseBody
	@RequestMapping(value = "/food/WWrite", method = RequestMethod.POST)
	public ModelAndView foodW(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("food");
		 if (log.isDebugEnabled()) {
			 log.debug(commandMap);
	     }
		foodService.foodWrite(commandMap.getMap(), request);
		System.out.println(commandMap);
		return mv;
	}
			
	// 먹거리 상세 페이지
	@RequestMapping("/food/Detail")
	public ModelAndView foodDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("foodDetail");
		commandMap.put("FOOD_INDEX", request.getParameter("FOOD_INDEX"));
		String s = request.getParameter("FOOD_INDEX");
		List<Map<String, Object>> FDetail = foodService.foodDetail(commandMap.getMap());
		mv.addObject("fdetail", FDetail);
		mv.addObject("s", s);
		System.out.println(commandMap.getMap());

		return mv;
	}
	
	// 푸드트럭 상세 페이지
	@RequestMapping("/truck/Detail")
	public ModelAndView truckDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("truckDetail");
		commandMap.put("FOOD_INDEX", request.getParameter("FOOD_INDEX"));
		String s = request.getParameter("FOOD_INDEX");
		List<Map<String, Object>> FDetail = foodService.truckDetail(commandMap.getMap());
		mv.addObject("fdetail", FDetail);
		mv.addObject("s", s);
		System.out.println(commandMap.getMap());

		return mv;
	}
			
	// FOOD 수정 페이지
	@ResponseBody
	@RequestMapping(value = "/food/Update" )
	public ModelAndView foodUpdate(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String AMIN_TIM = (String)session.getValue("AMIN_TIM");
		if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
			 response.sendRedirect("/fire/main");
		} else if(AMIN_TIM.equals("Y")) {
			ModelAndView mv = new ModelAndView("foodUpdate");
			Object e = request.getParameter("FOOD_INDEX");
			commandMap.put("FOOD_INDEX", e);
			List<Map<String, Object>> FDetail = foodService.foodDetail(commandMap.getMap());
			mv.addObject("FDetail",FDetail);
			return mv;
		}
		return null;
	}
			
	// FOOD 수정
	@ResponseBody
	@RequestMapping(value = "/food/UUpdate" , method = RequestMethod.POST)
	public ModelAndView foodU(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("food");
			if (log.isDebugEnabled()) {
		           log.debug(commandMap);
		       }
		foodService.foodUpdate(commandMap.getMap(), request);
		return mv;
	}
				
	// FOOD 삭제
	@ResponseBody
	@RequestMapping(value = "/food/Delete" )
	public ModelAndView foodDelete(CommandMap commandMap,  HttpServletResponse response, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String AMIN_TIM = (String)session.getValue("AMIN_TIM");
		if(session.getAttribute("AMIN_TIM") == null || AMIN_TIM.equals("") || AMIN_TIM.equals("N")){
			 response.sendRedirect("/fire/food"); 
		} else if(AMIN_TIM.equals("Y")) {
			ModelAndView mv = new ModelAndView("food");
			foodService.foodDelete(commandMap.getMap());
			return mv;
		}
		return null;
	}
}