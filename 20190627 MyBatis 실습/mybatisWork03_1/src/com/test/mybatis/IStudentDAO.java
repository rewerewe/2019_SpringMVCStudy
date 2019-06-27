/*======================
 	ISampleDAo.java
 	- 인터페이스
 =======================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IStudentDAO
{
	public ArrayList<StudentDTO> stuList();
	public int stuAdd(StudentDTO s);
}
