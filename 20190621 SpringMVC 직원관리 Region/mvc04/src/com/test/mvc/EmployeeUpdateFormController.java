/*=================================================
 	EmployeeUpdateFormController.java
 	- 사용자 정의 컨트롤러 클래스
 	- 직원 데이터 수정 폼 요청에 대한 액션 처리
 	- DAO 객체에 대한 의존성 주입(DI)을 위한 준비
 	  → 인터페이스 형태의 자료형을 속성으로 구성
 	  → setter 메소드 준비 
 =================================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView; // jar 파일로 ModelAndView 객체 생성 가능해짐. 
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법에 통해
//    사용자 정의 컨트롤러 클래스를 구성한다. 
public class EmployeeUpdateFormController implements Controller
{
	// check~!!!
	// EmployeeInsertFormController 구성과는 다른 방식으로 처리-!!!
	private IEmployeeDAO employeeDAO;
	private IRegionDAO regionDAO;
	private IDepartmentDAO departmentDAO;
	private IPositionDAO positionDAO;

	
	public void setEmployeeDAO(IEmployeeDAO employeeDAO)
	{
		this.employeeDAO = employeeDAO;
	}

	public void setRegionDAO(IRegionDAO regionDAO)
	{
		this.regionDAO = regionDAO;
	}

	public void setDepartmentDAO(IDepartmentDAO departmentDAO)
	{
		this.departmentDAO = departmentDAO;
	}

	public void setPositionDAO(IPositionDAO positionDAO)
	{
		this.positionDAO = positionDAO;
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
			// 데이터 수신 (EmployeeList.jsp 페이지로부터... employeeId 수신)
			String employeeId = request.getParameter("employeeId");
			//System.out.println(employeeId);


			// (06-21 추가) 세션 처리과정 추가 ------------------------------------------------------------------ 
			
			// 일반사원으로 로그인 → 정보 수정 폼 페이지로 들어왔을 때 로그아웃 (employeeupdateform.action?employeeId=1 로 접속했을 때)
			HttpSession session = request.getSession();
			
			if ( session.getAttribute("admin")==null )
			{
				mav.setViewName("redirect:logout.action");
				return mav;
			}
			
			
			//  ------------------------------------------------------------------ (06-21 추가) 세션 처리과정 추가

			
			Employee employee = new Employee();

			employee = employeeDAO.searchId(employeeId);
			// System.out.println(employee.getName());

			regionList = regionDAO.list();
			departmentList = departmentDAO.list();
			positionList = positionDAO.list();

			mav.addObject("employee", employee);

			mav.addObject("regionList", regionList);
			mav.addObject("departmentList", departmentList);
			mav.addObject("positionList", positionList);

			mav.setViewName("/WEB-INF/views/EmployeeUpdateForm.jsp");

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return mav;

	}

}
