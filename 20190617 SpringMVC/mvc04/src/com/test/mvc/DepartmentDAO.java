package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class DepartmentDAO implements IDepartmentDAO {
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public ArrayList<Department> list() throws SQLException {

		ArrayList<Department> result = new ArrayList<Department>();

		Connection conn = dataSource.getConnection();

		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			sql = "SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Department dto = new Department();
				dto.setDepartmentId(rs.getString("DEPARTMENTID"));
				dto.setDepartmentName(rs.getString("DEPARTMENTNAME"));

				result.add(dto);
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		rs.close();
		pstmt.close();

		return result;
	}

	@Override
	public int add(Department department) throws SQLException {
		
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try {
			
			sql = "INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, ? )";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, department.getDepartmentName());
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int remove(String departmentId) throws SQLException {
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "";
		PreparedStatement pstmt = null;
		
		try {
			 
			sql  = " DELETE					";
			sql += " FROM DEPARTMENT		";
			sql += " WHERE DEPARTMENTID= ?	";
			
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		pstmt.close();
		
		return result;
	}

	@Override
	public int modify(Department department) throws SQLException {
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try {
			
			sql = "UPDATE DEPARTMENT SET DEPARTMENTNAME = ? WHERE DEPARTMENTID = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, department.getDepartmentName());
			pstmt.setString(2, department.getDepartmentId());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
