package com.test.mvc;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.logging.Logger;

import javax.sql.DataSource;

public class Main
{

	public static void main(String[] args) throws SQLException
	{
		DataSource ds = new DataSource()
		{				
			@Override
			public Connection getConnection(String username, String password) throws SQLException
			{
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Connection getConnection() throws SQLException
			{
				Connection conn = null;
				try
				{
					String url = "jdbc:oracle:thin:@localhost:1521:xe";
					String user = "scott";
					String pwd = "tiger";
					
					Class.forName("oracle.jdbc.driver.OracleDriver");
					
					conn = DriverManager.getConnection(url, user, pwd);
					
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
				
				return conn;
			}

			@Override
			public PrintWriter getLogWriter() throws SQLException
			{
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public int getLoginTimeout() throws SQLException
			{
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public Logger getParentLogger() throws SQLFeatureNotSupportedException
			{
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public void setLogWriter(PrintWriter out) throws SQLException
			{
				// TODO Auto-generated method stub
				
			}

			@Override
			public void setLoginTimeout(int seconds) throws SQLException
			{
				// TODO Auto-generated method stub
				
			}

			@Override
			public boolean isWrapperFor(Class<?> iface) throws SQLException
			{
				// TODO Auto-generated method stub
				return false;
			}

			@Override
			public <T> T unwrap(Class<T> iface) throws SQLException
			{
				// TODO Auto-generated method stub
				return null;
			}
		};
		
		
		EmployeeDAO edao = new EmployeeDAO();
		
		edao.setDataSource(ds);
		
		System.out.println("EmployeeDAO-----------------------------------------------------------");
		
		System.out.println("list size = " + edao.list().size());
		System.out.println("regionList size = " + edao.regionList().size());
		System.out.println("departmentList size = "+ edao.departmentList().size());
		System.out.println("positionList size = " + edao.positionList().size());
		System.out.println("getMinBasicPay = " + edao.getMinBasicPay("1"));
		
		Employee emp = new Employee();
		emp.setName("전훈의");
		emp.setSsn("9307261122334");
		emp.setSsn1("930726");
		emp.setSsn2("1122334");
		emp.setBirthday("1993-07-26");
		emp.setLunar(0);
		emp.setTelephone("010-7777-7777");
		emp.setDepartmentId("1");
		emp.setPositionId("1");
		emp.setRegionId("1");
		emp.setBasicPay(7777777);
		emp.setExtraPay(1);
		
		//System.out.println("(주의,한번만 실행할 것)employeeAdd = " + edao.employeeAdd(emp));
		
		System.out.println("searchId = " + edao.searchId("1").getName());
		System.out.println("login = " + edao.login("3", "1122334"));
		System.out.println("admin login = " + edao.loginAdmin("1", "1234567"));
		
		/*
		System.out.println("DepartmentDAO-----------------------------------------------------------");
		
		DepartmentDAO ddao = new DepartmentDAO();
		
		ddao.setDataSource(ds);
		
		System.out.println("Dept list size = " + ddao.list().size());
		
		Department department = new Department();
		
		department.setDepartmentName("운영부");
		
		//System.out.println("(주의,한번만 실행할 것)Dept add = " + ddao.add(department));
		
		//System.out.println("Dept remove test = " + ddao.remove(dept아이디));
		
		department.setDepartmentId("4");
		department.setDepartmentName("기획부");
		
		System.out.println("Dept modify test = " + ddao.modify(department));
		
		
		System.out.println("RegionDAO-----------------------------------------------------------");
		
		RegionDAO rdao = new RegionDAO();
		
		rdao.setDataSource(ds);
		
		System.out.println("Reg list size = " + rdao.list().size());
		
		Region region = new Region();
		
		region.setRegionName("창원");
		
		//System.out.println("(주의,한번만 실행할 것)Reg add = " + rdao.add(region));
		
		//System.out.println("Reg remove = " + rdao.remove(삭제할 아이디));
		
		region.setRegionId("5");
		
		region.setRegionName("부산");
		
		//System.out.println("Reg modify = " + rdao.modify(region));
		
		*/
		
		
		

	}

}






