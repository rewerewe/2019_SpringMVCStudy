/*====================
 	MemeberMain.java
 	- 컨트롤러
 =====================*/

package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
// Spring container 에 의해 SqlSession 을 주입받아야 한다. 
// annotation 중 auto-wired 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
public class StudentController

{
	// SqlSession 을 활용하여 마이바티스 객체 의존성(자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	
	// 매개변수를 정의하는 과정에서 매개변수 목록에 적혀있는 
	// 클래스의 객체 정보는 스프링이 제공한다.
	
	// 사용자의 요청주소와 메소드를 매핑하는 과정 필요
	// @RequestMapping(value="요청주소", method=전송방식)
	// 이때, 전송방식은 submit 액션인 경우만 POST
	// 나머지 모든 전송방식은 GET 으로 처리한다. 
	
	@RequestMapping(value="/studentlist.action", method=RequestMethod.GET)
	public String studentList(Model model)
	{
		String result = null;
		
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		result = "/WEB-INF/views/StudentList.jsp";
		
		return result;
	}
	
	public String studentInsertForm()
	{
		String result = null;
				
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		result = "/WEB-INF/views/StudentInserForm.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/studentinsert.action", method = RequestMethod.POST)
	public String studentInsert(StudentDTO student)
	{
		String result = null;
		
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.add(student);
		
		return result;
	}
	
	@RequestMapping(value="/gradelist.action",method = RequestMethod.POST)
	public String gradeList(Model model)
	{
		String result = null;
		
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		result = "/WEB-INF/views/GradeList.jsp";
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
