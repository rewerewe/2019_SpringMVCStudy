/*=========================================
 	#11. RegionDAO.java
 	- 데이터베이스 액션 처리 클래스.
 	- 지역 정보 입출력 / 수정 / 삭제 액션.
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




public class RegionDAO implements IRegionDAO
{
	private DataSource dataSource;
	
		
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 인터페이스 메소드 재정의 --------------------------------------------------------
	
	// 지역 리스트 전체 출력 
	@Override
	public ArrayList<Region> list() throws SQLException
	{

		ArrayList<Region> result = new ArrayList<Region>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql  = " SELECT REGIONID, REGIONNAME, DELCHECK ";
			sql += " FROM REGIONVIEW                       ";
			sql += " ORDER BY REGIONID                     ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Region dto = null;
			
			while(rs.next())
			{
				dto = new Region();
				dto.setRegionId(rs.getString("REGIONID"));
				dto.setRegionName(rs.getString("REGIONNAME"));
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
		
		return result;
	}
	
	// 지역 데이터 등록(추가)
	@Override
	public int add(Region region) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql  = " INSERT INTO REGION(REGIONID, REGIONNAME) ";
			sql += " VALUES (REGIONSEQ.NEXTVAL, ? )           ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, region.getRegionName());
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 지역 데이터 삭제(제거)
	@Override
	public int remove(String regionId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql  = " DELETE 			";
			sql += " FROM REGION 		";
			sql += " WHERE REGIONID = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(regionId));
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 지역 데이터 변경(수정)
	@Override
	public int modify(Region region) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql  = " UPDATE REGION 		";
			sql += " SET REGIONNAME= ? 	";
			sql += " WHERE REGIONID= ? 	";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, region.getRegionName());
			pstmt.setInt(2, Integer.parseInt(region.getRegionId()));
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		pstmt.close();
		conn.close();
		
		return result;
	}

}
