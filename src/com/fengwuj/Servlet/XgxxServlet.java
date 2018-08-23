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
import com.mysql.cj.Session;

public class XgxxServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String xm = req.getParameter("xm");
		String dw = req.getParameter("dw");
		String bm = req.getParameter("bm");
		String dh = req.getParameter("dh");
		String js = req.getParameter("js");
		
		
		String sql = "update user set xm = ?,dw = ?,bm = ?,dh = ?,js = ?";
		Connection connection = null;
		PreparedStatement psmt = null;
		PrintWriter printWriter = resp.getWriter();
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			
			psmt.setString(1,xm);
			psmt.setString(2,dw);
			psmt.setString(3,bm);
			psmt.setString(4,dh);
			psmt.setString(5,js);
			
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
