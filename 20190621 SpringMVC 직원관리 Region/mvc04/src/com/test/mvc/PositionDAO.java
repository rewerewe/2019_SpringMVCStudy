/*=========================================
 	#12. PositionDAO.java
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

public class PositionDAO implements IPositionDAO
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 직위 리스트 전체 조회
	@Override
	public ArrayList<Position> list() throws SQLException
	{
		ArrayList<Position> result = new ArrayList<Position>();

		Connection conn = dataSource.getConnection();

		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			sql  = " SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK ";
			sql += " FROM POSITIONVIEW 										";
			sql += " ORDER BY POSITIONID									";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next())
			{
				Position dto = new Position();
				dto.setPositionId(rs.getString("POSITIONID"));
				dto.setPositionName(rs.getString("POSITIONNAME"));
				dto.setMinBasicPay(rs.getInt("MINBASICPAY"));
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

	// 직위 데이터 등록 (입력, 추가)
	@Override
	public int add(Position position) throws SQLException
	{
		int result = 0;

		Connection conn = dataSource.getConnection();

		String sql = "";
		PreparedStatement pstmt = null;

		try
		{
			sql  = " INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) ";
			sql += " VALUES(POSITIONSEQ.NEXTVAL, ? , ?)							 ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, position.getPositionName());
			pstmt.setInt(2, position.getMinBasicPay());

			result = pstmt.executeUpdate();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		pstmt.close();
		conn.close();

		return result;
	}

	// 직위 데이터 삭제(제거)
	@Override
	public int remove(String position) throws SQLException
	{
		int result = 0;

		Connection conn = dataSource.getConnection();

		String sql = "";
		PreparedStatement pstmt = null;

		try
		{
			sql  = " DELETE 				";
			sql += " FROM POSITION 			";
			sql += " WHERE POSITIONID= ? 	";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(position));

			result = pstmt.executeUpdate();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		pstmt.close();
		conn.close();

		return result;
	}

	// 직위 데이터 수정(변경)
	@Override
	public int modify(Position position) throws SQLException
	{
		int result = 0;

		Connection conn = dataSource.getConnection();

		String sql = "";
		PreparedStatement pstmt = null;

		try
		{
			sql  = " UPDATE POSITION 					 ";
			sql += " SET POSITIONNAME= ?, MINBASICPAY= ? ";
			sql += " WHERE POSITIONID= ? 				 ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, position.getPositionName());
			pstmt.setInt(2, position.getMinBasicPay());
			pstmt.setInt(3, Integer.parseInt(position.getPositionId()));

			result = pstmt.executeUpdate();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}

}
