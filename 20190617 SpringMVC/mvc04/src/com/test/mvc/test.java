package com.test.mvc;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.ArrayList;
import java.util.logging.Logger;

import javax.sql.DataSource;

public class test
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
				
		ArrayList<Employee> emp = edao.list();
		
		for(Employee e : emp)
		{
			System.out.println(e.getEmployeeId());
		}

	}
}
