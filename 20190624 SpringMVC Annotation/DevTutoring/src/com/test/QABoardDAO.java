package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;


public class QABoardDAO {

	private Connection conn;

	// 조회수 증가
	public int clickHitCount(int num) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			sql  = " UPDATE QABOARD				";
			sql += " SET HITCOUNT = HITCOUNT+1	";
			sql += " WHERE NUM = ?				";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 질문 게시글 출력
	public List<QABoardDTO> list()
	{
		List<QABoardDTO> result = new ArrayList<QABoardDTO>();
		
		PreparedStatement pstmt = null;
		String sql="";
		
		try
		{
			sql  = "";
			sql += "";
			sql += "";
			sql += "";
			sql += "";
			
			pstmt = conn.prepareStatement(sql);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}

}
