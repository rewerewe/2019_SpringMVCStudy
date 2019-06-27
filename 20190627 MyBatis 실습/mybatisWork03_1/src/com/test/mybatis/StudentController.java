package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class StudentController
{
	@Autowired
	private SqlSession sqlSession;
	
	public String studentlist(Model model)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		model.addAttribute("list", dao.stuList());
		
		return "/WEB-INF/views/StudentList.jsp";
	}
}
