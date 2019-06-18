/*=========================================
 	#10. DepartmentDAO.java
 	- 데이터베이스 액션 처리 클래스.
 	- 부서 정보 입출력 / 수정 / 삭제 액션
 	- Connection 객체에 대한 의존성 주입
 	  → setter 메소드 정의.
 =========================================*/

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class DepartmentDAO implements IDepartmentDAO
{
	// 인터페이스 자료형을 속성으로 구성
	private DataSource dataSource;
	
	
	// setter 구성 
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 인터페이스 메소드 재정의 ---------------------------------------------------------------
	
	// 부서 전체 리스트 출력
	@Override
	public ArrayList<Department> list() throws SQLException
	{

		ArrayList<Department> result = new ArrayList<Department>();

		Connection conn = dataSource.getConnection();

		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{

			sql  = " SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK ";
			sql += " FROM DEPARTMENTVIEW                           ";
			sql += " ORDER BY DEPARTMENTID                         ";
		

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Department dto = null;
			
			while (rs.next())
			{
				dto = new Department();
				dto.setDepartmentId(rs.getString("DEPARTMENTID"));
				dto.setDepartmentName(rs.getString("DEPARTMENTNAME"));
				dto.setDelCheck(rs.getInt("DELCHECK"));

				result.add(dto);
			}

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		rs.close();
		pstmt.close();
		conn.close();
		//-- 수업시간에 conn.close() 삽입

		return result;
	}
	
	// 부서 데이터 등록(입력, 추가) 
	@Override
	public int add(Department department) throws SQLException
	{

		int result = 0;

		Connection conn = dataSource.getConnection();

		String sql = "";
		PreparedStatement pstmt = null;

		try
		{

			sql  = " INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) 	";
			sql += " VALUES (DEPARTMENTSEQ.NEXTVAL, ? )						";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, department.getDepartmentName());

			result = pstmt.executeUpdate();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 부서 데이터 제거(삭제)
	@Override
	public int remove(String departmentId) throws SQLException
	{
		int result = 0;

		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;

		try
		{

			sql  = " DELETE					";
			sql += " FROM DEPARTMENT		";
			sql += " WHERE DEPARTMENTID= ?	";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(departmentId));
			result = pstmt.executeUpdate();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		pstmt.close();
		conn.close();

		return result;
	}
	
	// 부서 데이터 변경 (수정) 
	@Override
	public int modify(Department department) throws SQLException
	{
		int result = 0;

		Connection conn = dataSource.getConnection();

		String sql = "";
		PreparedStatement pstmt = null;

		try
		{

			sql  = " UPDATE DEPARTMENT 		";
			sql += " SET DEPARTMENTNAME = ? ";
			sql += " WHERE DEPARTMENTID = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, department.getDepartmentName());
			pstmt.setInt(2, Integer.parseInt(department.getDepartmentId()));

			result = pstmt.executeUpdate();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}

}
