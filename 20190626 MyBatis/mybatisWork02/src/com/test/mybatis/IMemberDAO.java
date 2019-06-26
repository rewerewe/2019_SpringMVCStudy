/*======================
 	IMemberDAo.java
 	- 인터페이스
 =======================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IMemberDAO
{
	public ArrayList<MemberDTO> list();
	public int count();
	public int add(MemberDTO dto);
	public int remove(MemberDTO dto);
	public int modify(MemberDTO dto);
}
