package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StudentController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/studentlist.action", method=RequestMethod.GET)
	public String studentList(Model model)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.stuList());
		
		return "/WEB-INF/views/StudentList.jsp";
	}
	
	@RequestMapping(value="/studentinsertform.action", method=RequestMethod.GET)
	public String studentInsertForm()
	{
		return "/WEB-INF/views/StudentInsertForm.jsp";
	}
	
	@RequestMapping(value="/studentinsert.action", method=RequestMethod.GET)
	public String studentInsert(StudentDTO s)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		int result = dao.stuAdd(s);
		System.out.println(result == 1 ? result + "건 성공" : "실패");
		
		return "redirect:studentlist.action";
	}
}
