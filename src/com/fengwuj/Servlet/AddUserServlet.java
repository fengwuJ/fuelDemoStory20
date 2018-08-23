package com.fengwuj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fengwuj.util.DBConnection;

public class AddUserServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dw = req.getParameter("dw");
		String js = req.getParameter("js");
		String bm = req.getParameter("bm");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String xm = req.getParameter("xm");
		String dh = req.getParameter("dh");
		
		
		
		String sql = "insert into user(dw,js,bm,username,password,xm,dh) values(?,?,?,?,?,?,?)";
		Connection connection = null;
		PreparedStatement psmt = null;
		PrintWriter printWriter = resp.getWriter();
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			
			psmt.setString(1,dw);
			psmt.setString(2,js);
			psmt.setString(3,bm);
			psmt.setString(4,username);
			psmt.setString(5,password);
			psmt.setString(6,xm);
			psmt.setString(7,dh);
			
			int i = psmt.executeUpdate();
			
			
			if (i >= 0) {
				printWriter.print("success");
			}else {
				printWriter.print("fail");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
