/*=============================
 	IMemberDAO.java
 	- 인터페이스 
 =============================*/
package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IMemberDAO
{
	// 회원 정보 추가 메소드 선언
	public int add(MemberDTO member) throws SQLException;
	//-- 정의하는 메소드에서 예외 추가할 수 없으므로, 인터페이스에서 예외 처리 해준다. 
	
	// 전체 인원 수 확인 메소드 선언 (어떤 조건에 의한 조회가 아님)
	public int count();
	
	// 회원 목록 확인 메소드 선언  
	public ArrayList<MemberDTO> list() throws SQLException;
}
