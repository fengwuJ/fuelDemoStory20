package com.fengwuj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fengwuj.Dao.Dao;
import com.fengwuj.factory.Factory;

public class SscgxdlbPagesServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String gysname = req.getParameter("gysname");
		
		Dao dao = Factory.createMysqlDao();
		
		int totalPage = dao.ssCgxdlbPages(gysname);
		PrintWriter printWriter = resp.getWriter();
		printWriter.print(totalPage);
	}
}
