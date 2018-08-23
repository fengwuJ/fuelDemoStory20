package com.fengwuj.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection
{
    private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
    private final static String URL = "jdbc:mysql://localhost:3306/mydb?characterEncoding=utf-8&useSSL=true";
    private final static String USER = "root";
    private final static String PASSWORD = "root";
    
   static{
	   try {
		    Class.forName(DRIVER);
			System.out.println("成功加载驱动");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
    
    public static Connection getConnection() throws SQLException
    {
    	return  DriverManager.getConnection(URL,USER,PASSWORD);
		
    }
    
}
