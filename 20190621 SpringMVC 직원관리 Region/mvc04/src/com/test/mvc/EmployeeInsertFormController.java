/*====================================
 	EmployeeInsertFormController.java
 	- 사용자 정의 컨트롤러 클래스
 	- 직원 정보 입력 액션 수행 후.. employeelist.action 재요청 안내
 	- DAO 객체에 대한 의존성 주입(DI)를 위한 준비 
 	  → 인터페이스 형태의 자료형을 속성으로 구성
 	  → setter 메소드 준비
 =====================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView; // jar 파일로 ModelAndView 객체 생성 가능해짐. 
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법에 통해
//    사용자 정의 컨트롤러 클래스를 구성한다. 
public class EmployeeInsertFormController implements Controller
{
	private IEmployeeDAO dao;

	public void setDao(IEmployeeDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드

		ModelAndView mav = new ModelAndView();

		ArrayList<Region> regionList = new ArrayList<Region>();
		ArrayList<Department> departmentList = new ArrayList<Department>();
		ArrayList<Position> positionList = new ArrayList<Position>();

		try
		{
			regionList = dao.regionList();
			departmentList = dao.departmentList();
			positionList = dao.positionList();

			mav.addObject("regionList", regionList);
			mav.addObject("departmentList", departmentList);
			mav.addObject("positionList", positionList);

			mav.setViewName("/WEB-INF/views/EmployeeInsertForm.jsp");

		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return mav;

	}
}
