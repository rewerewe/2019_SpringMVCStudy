/*=================================
 	HelloController.java
 	- 사용자 정의 컨트롤러 클래스
 ==================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.ModelAndView;	// jar 파일로 ModelAndView 객체 생성 가능해짐. 
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법에 통해
//    사용자 정의 컨트롤러 클래스를 구성한다. 
public class HelloController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		String message = "Hello, SpringMVC World~!!!2";
		
		// 1. servlet/jsp 방식
		// request.setAttribute("message", message);
		// request.getRequestDispatcher("/WEB-INF/views/Hello.jsp").forward(request, response);
		
		// 2. spring mvc의 ModelAndView방식
		mav.addObject("message", message);		// message 라는 키값으로 message Object 를 컨트롤 하겠다. request.setAtrribute 한 것과 같다.
		mav.setViewName("/WEB-INF/views/Hello.jsp");	// Hello.jsp 에 바로 접속할 수 없도록 WEB-INF 폴더에 생성할 예정. 
														// 실제 객체를 넘겨주는 게 아닌 setViewName 으로 View 이름으로 경로만 지정해주는 것. 
		return mav;
	}
	
}
