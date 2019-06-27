/*======================
 	ISampleDAo.java
 	- 인터페이스
 =======================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IGradeDAO
{
	public ArrayList<GradeDTO> gradeList();
	public int gradeAdd(GradeDTO g);
}
