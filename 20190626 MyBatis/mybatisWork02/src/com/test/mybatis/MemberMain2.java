package com.test.mybatis;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberMain2 {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/memberlist2.action", method = RequestMethod.GET)
	public String memberList(ModelMap model) {
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);

		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());

		return "/WEB-INF/views/MemberList2.jsp";
	}

	@RequestMapping(value = "/membershow21.action", method = RequestMethod.POST)
	public void memberShow21(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터 설정
		String mid = request.getParameter("mid");
		
		// DB 조회 via MyBatis
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		MemberDTO memberDTO = dao.one(mid);
		
		// Result Data 추출
		String midDb = memberDTO.getMid();
		String nameDb = memberDTO.getName();
		String telephoneDb = memberDTO.getTelephone();

		// XXX java.lang.String
		String result = "";
		result += "{";
		result += "   \"mid\" : \"" + midDb + "\"";
		result += " , \"name\" : \"" + nameDb + "\"";
		result += " , \"telephone\" : \"" + telephoneDb + "\"";
		result += "}";
		
		// 캐릭터셋 설정
		response.setCharacterEncoding("UTF-8");
		
		// HttpServletResponse의 writer를 얻어서 직접 문자열을 처리
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			writer.print(result);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/membershow22.action", method = RequestMethod.POST)
	public void memberShow22(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터 설정
		String mid = request.getParameter("mid");
		
		// DB 조회 via MyBatis
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		MemberDTO memberDTO = dao.one(mid);
		
		// Result Data 추출
		String midDb = memberDTO.getMid();
		String nameDb = memberDTO.getName();
		String telephoneDb = memberDTO.getTelephone();
		
		// XXX org.json.simple.JSONObject
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("mid", midDb);
		jsonObject.put("name", nameDb);
		jsonObject.put("telephone", telephoneDb);
		String result = jsonObject.toString();
		
		// 캐릭터셋 설정
		response.setCharacterEncoding("UTF-8");
		
		// HttpServletResponse의 writer를 얻어서 직접 문자열을 처리
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			writer.print(result);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/membermodify2.action", method = RequestMethod.GET)
	public String memberModify2(MemberDTO m) {
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.modify(m);
		
		return "redirect:memberlist2.action";
	}
}
