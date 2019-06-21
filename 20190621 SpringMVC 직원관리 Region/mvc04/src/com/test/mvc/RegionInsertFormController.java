/*=================================
 	RegionInsertFormController.java
 	- 사용자 정의 컨트롤러 클래스
 	- ?? 이 컨트롤러의 역할은 뭐지??
 	  RegionInsertForm으로 보내주는 ㄱ ㅓㄴ가?
 ==================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.ModelAndView;	// jar 파일로 ModelAndView 객체 생성 가능해짐. 
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법에 통해
//    사용자 정의 컨트롤러 클래스를 구성한다. 
public class RegionInsertFormController implements Controller
{
	private IRegionDAO dao;
	
	
	public void setDao(IRegionDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Region> regionList = new ArrayList<Region>();
		
		regionList = dao.list();
		
		mav.addObject("regionList", regionList);
		
		mav.setViewName("/WEB-INF/views/RegionInsertForm.jsp");
		
		return mav;

	}
	
}
