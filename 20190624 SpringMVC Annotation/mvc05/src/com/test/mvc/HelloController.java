/*===========================================
 	HelloController.java
 	- 사용자 정의 컨트롤러 클래스
 	- 『@Controller』 어노테이션 등록
 	- 『@RequestMapping』 어노테이션 등록
 ===========================================*/

package com.test.mvc;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import org.springframework.web.servlet.ModelAndView;	// jar 파일로 ModelAndView 객체 생성 가능해짐. 

import org.springframework.stereotype.Controller;				// [CHECK-!!!!] Annotation 을 쓰게 되면, import 됨 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping; 	// [CHECK-!!!!] Annotation 을 쓰게 되면, import 됨 
// import org.springframework.web.servlet.mvc.Controller;

// ※ Annotation 표기법으로 만든 컨트롤러 객체 지정
@Controller
public class HelloController // implements Controller
{
	/*
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		
		return mav;

	}
	*/
	
	// ※ 액션 처리를 위한 메소드는 사용자 지정.
	/*
	@RequestMapping("URL매핑주소")
	public String 메소드이름(매개변수)
	{
		// ※ 비즈니스 로직 처리 (모델 활용)
		// ...
		return "뷰 이름.jsp";
	}
	*/
	
	// 메소드를 매개변수에... 필요로 하는 객체를 지정하면
	// 이것을 스프링에 전달해준다.
	@RequestMapping("/hello.action")
	public String hello(Model model)
	{
		// ※ 비즈니스 로직 처리 (모델 활용)
		// ...
		
		// 데이터 전달 명령
		model.addAttribute("hello", "Hello, SpringMVCAnnotation World!");
		// hello 에 value 를 전달하려고 매개변수로 model 을 받는 것.                                                                        
		
		return "/WEB-INF/views/Hello.jsp";
	}
	
}
