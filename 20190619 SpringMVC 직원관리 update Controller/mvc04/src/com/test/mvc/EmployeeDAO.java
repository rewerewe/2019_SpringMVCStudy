package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class EmployeeDAO implements IEmployeeDAO
{

	private DataSource dataSource;
	
	

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public ArrayList<Employee> list() throws SQLException
	{
		ArrayList<Employee> result = new ArrayList<Employee>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql =  " SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME				    ";
			sql += "  	  , TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME	";
			sql	+= "  	  , REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY						";
			sql += " FROM EMPLOYEEVIEW														    ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				Employee dto = new Employee();
				dto.setEmployeeId(rs.getString("EMPLOYEEID"));
				dto.setName(rs.getString("NAME"));
				dto.setSsn1(rs.getString("SSN"));
				dto.setBirthday(rs.getString("BIRTHDAY"));
				dto.setLunar(rs.getInt("LUNAR"));
				dto.setLunarName(rs.getString("LUNARNAME"));
				dto.setTelephone(rs.getString("TELEPHONE"));
				dto.setDepartmentId(rs.getString("DEPARTMENTID"));
				dto.setDepartmentName(rs.getString("DEPARTMENTNAME"));
				dto.setPositionId(rs.getString("POSITIONID"));
				dto.setPositionName(rs.getString("POSITIONNAME"));
				dto.setRegionId(rs.getString("REGIONID"));
				dto.setRegionName(rs.getString("REGIONNAME"));
				dto.setBasicPay(rs.getInt("BASICPAY"));
				dto.setExtraPay(rs.getInt("EXTRAPAY"));
				dto.setPay(rs.getInt("PAY"));
				
				result.add(dto);	
			}
		
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}

	@Override
	public ArrayList<Region> regionList() throws SQLException
	{
		ArrayList<Region> result = new ArrayList<Region>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql  = " SELECT REGIONID, REGIONNAME ";
			sql	+= " FROM REGION 				 ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				Region dto = new Region();
				dto.setRegionId(rs.getString("REGIONID"));
				dto.setRegionName(rs.getString("REGIONNAME"));
				
				result.add(dto);
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}

	@Override
	public ArrayList<Department> departmentList() throws SQLException
	{
		ArrayList<Department> result = new ArrayList<Department>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql  = " SELECT DEPARTMENTID, DEPARTMENTNAME ";
			sql += " FROM DEPARTMENT 					 ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				Department dto = new Department();
				dto.setDepartmentId(rs.getString("DEPARTMENTID"));
				dto.setDepartmentName(rs.getString("DEPARTMENTNAME"));
				
				result.add(dto);
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		rs.close();
		pstmt.close();
	
		return result;
	}

	@Override
	public ArrayList<Position> positionList() throws SQLException
	{
		ArrayList<Position> result = new ArrayList<Position>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql  = " SELECT POSITIONID, POSITIONNAME, MINBASICPAY ";
			sql += " FROM POSITION 								  ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				Position dto = new Position();
				dto.setPositionId(rs.getString("POSITIONID"));
				dto.setPositionName(rs.getString("POSITIONNAME"));
				dto.setMinBasicPay(rs.getInt("MINBASICPAY"));
				
				result.add(dto);
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}

	@Override
	public int getMinBasicPay(String positionId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql  = " SELECT MINBASICPAY  ";
			sql += " FROM POSITION 		 ";
			sql += " WHERE POSITIONID= ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, positionId);
			
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				result = rs.getInt(1);
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}

	@Override
	public int employeeAdd(Employee employee) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql  = "INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR													 ";
			sql += "                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY) ";
			sql += "VALUES (EMPLOYEESEQ.NEXTVAL, ? , ? , CRYPTPACK.ENCRYPT(? , ?), TO_DATE( ? , 'YYYY-MM-DD'), ?";
			sql += "      , ?, ?, ?, ?, ?, ? )";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, employee.getName() );
			pstmt.setString(2, employee.getSsn1() );
			pstmt.setString(3, employee.getSsn2() );
			pstmt.setString(4, employee.getSsn2() );
			//System.out.println(employee.getSsn2());
			pstmt.setString(5, employee.getBirthday() );
			pstmt.setInt(6, employee.getLunar() );
			pstmt.setString(7, employee.getTelephone() );
			pstmt.setString(8, employee.getDepartmentId());
			//System.out.println("DAO : " + employee.getDepartmentId());
			pstmt.setString(9, employee.getPositionId() );
			//System.out.println("DAO" + employee.getRegionId());
			pstmt.setString(10, employee.getRegionId() );
			pstmt.setInt(11, employee.getBasicPay() );
			pstmt.setInt(12, employee.getExtraPay() );
			
					
			result = pstmt.executeUpdate();
						
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		pstmt.close();
		
		return result;
	}

	@Override
	public int remove(String employeeId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql  = " DELETE 			 ";
			sql += " FROM EMPLOYEE 		 ";
			sql += " WHERE EMPLOYEEID= ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, employeeId);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		pstmt.close();
		
		return result;
	}

	@Override
	public int modify(Employee employee) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			
			sql  = " UPDATE EMPLOYEE								 ";
			sql += " SET NAME= ? 						 			 ";
			sql += "   , BIRTHDAY=TO_DATE( ? , 'YYYY-MM-DD')		 ";
			sql += "   , LUNAR=	?									 ";
			sql += "   , TELEPHONE=	?								 ";
			sql += "   , DEPARTMENTID= ?  							 ";
			sql += "   , POSITIONID= ?								 ";
			sql += "   , REGIONID= ?								 ";
			sql += "   , BASICPAY= ?    		    			     ";
			sql += "   , EXTRAPAY= ?        						 ";
			sql += "   , SSN1= ? 								 	 ";
			sql += "   , SSN2=CRYPTPACK.ENCRYPT( ? , ? )			 ";
			sql += "   , GRADE= ?									 ";
			sql += " WHERE EMPLOYEEID= ?							 ";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, employee.getName() );
			pstmt.setString(2, employee.getBirthday() );
			pstmt.setInt(3, employee.getLunar() );
			pstmt.setString(4, employee.getTelephone() );
			pstmt.setString(5, employee.getDepartmentId() );
			pstmt.setString(6, employee.getPositionId() );
			pstmt.setString(7, employee.getRegionId() );
			pstmt.setInt(8, employee.getBasicPay() );
			pstmt.setInt(9, employee.getExtraPay() );
			pstmt.setString(10, employee.getSsn1() );
			pstmt.setString(11, employee.getSsn2() );
			pstmt.setString(12, employee.getSsn2() );
			pstmt.setInt(13, employee.getGrade() );
			pstmt.setString(14, employee.getEmployeeId() );			
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		pstmt.close();
		
		return result;
	}

	@Override
	public Employee searchId(String employeeId) throws SQLException
	{
		Employee result = new Employee();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql =  " SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME				    ";
			sql += "  	  , TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME	";
			sql	+= "  	  , REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY						";
			sql += " FROM EMPLOYEEVIEW														    ";
			sql += " WHERE EMPLOYEEID = ?													    ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, employeeId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				result.setEmployeeId(rs.getString("EMPLOYEEID"));
				result.setName(rs.getString("NAME"));
				result.setSsn1(rs.getString("SSN"));
				result.setBirthday(rs.getString("BIRTHDAY"));
				result.setLunar(rs.getInt("LUNAR"));
				result.setLunarName(rs.getString("LUNARNAME"));
				result.setTelephone(rs.getString("TELEPHONE"));
				result.setDepartmentId(rs.getString("DEPARTMENTID"));
				result.setDepartmentName(rs.getString("DEPARTMENTNAME"));
				result.setPositionId(rs.getString("POSITIONID"));
				result.setPositionName(rs.getString("POSITIONNAME"));
				result.setRegionId(rs.getString("REGIONID"));
				result.setRegionName(rs.getString("REGIONNAME"));
				result.setBasicPay(rs.getInt("BASICPAY"));
				result.setExtraPay(rs.getInt("EXTRAPAY"));
				result.setPay(rs.getInt("PAY"));
	
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}

	@Override
	public String login(String id, String pw) throws SQLException
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql  = " SELECT NAME 							";
			sql += " FROM EMPLOYEE 							";
			sql += " WHERE EMPLOYEEID= ? 					";
			sql += "   AND SSN2 = CRYPTPACK.ENCRYPT( ?, ? )	";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, pw);
			
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				result = rs.getString(1);
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public String loginAdmin(String id, String pw) throws SQLException
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql  = " SELECT NAME						  	";
			sql += " FROM EMPLOYEE							";
			sql += " WHERE EMPLOYEEID= ? 					";
			sql += "  AND SSN2 = CRYPTPACK.ENCRYPT( ? , ?)	";
			sql += "  AND GRADE = 0 						";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, pw);
			
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				result = rs.getString(1);
			}
			
 			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}

}
