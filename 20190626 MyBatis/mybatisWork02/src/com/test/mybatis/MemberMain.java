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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// DB의 액션처리가 목적 - DAO 메소드 (아직 정의하지 않았음)
// DAO 는 mybatis 활용에서 업무처리할 수 있도록 하려고 함. 사전에 등록되어 있어야 한다.
// SpringContainer 에서 활용하려면 dispatch-servlet 에서 매핑해주어야 한다. 
// SqlSessionFactoryBean 으로 지정해주었던 것처럼?
// Controller 에서 mybatis 를 활용하려면 SqlSession 이 필요하다. 
// → MemberMain 을 구성하고 난 후, Member.xml 을 구성하면 된다?
@Controller 
public class MemberMain
{
	// interface 형태의 SqlSession 을 setter() 를 써주었지만 @Autowired 를 쓰면서 자동으로 주입된다. 
	// → setter() 정의할 필요없음. mybatis에서 객체의존성(자동) 주입-!!! 
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/memberlist.action", method = RequestMethod.GET )
	public String memberList(ModelMap model)
	{
		// ??? 는 IMemberDAO 가 감싸고 있는 영역?!
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		//--??
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		return "/WEB-INF/views/MemberList.jsp";
	}
	
	@RequestMapping(value = "/memberinset.action", method = RequestMethod.POST )
	public String memberInsert(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.add(m);
				
		return "redirect:memberlist.action";
	}
	
	@RequestMapping(value = "/memberdelete.action", method = RequestMethod.GET )
	public String memberDelete(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.remove(m);
		
		return "redirect:memberlist.action";
	}
	
	@RequestMapping(value = "/membermodify.action", method = RequestMethod.POST)
	public String memberModify(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.modify(m);
		
		
		return "redirect:memberlist.action";
	}
}
