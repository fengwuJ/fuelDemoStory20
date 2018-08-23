package com.fengwuj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fengwuj.Dao.Dao;
import com.fengwuj.entity.Zbsh;
import com.fengwuj.entity.Zzjgxd;
import com.fengwuj.factory.Factory;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;


public class Cgzxglzbshlb extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置编码
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		
		//接收前端数据
		int isGetTotalPage = Integer.parseInt(req.getParameter("isGetTotalPage"));
		int currentPage = Integer.parseInt(req.getParameter("currentPage"));
		String gysname = req.getParameter("gysname");
		String tn = req.getParameter("tn");
		//从数据库访问数据并存储到list集合
		Dao dao = Factory.createMysqlDao();
		//获取总页数
		if (isGetTotalPage == 1) {
			int totalPage = 1;
			if(("".equals(gysname)) && ("".equals(tn))){
				totalPage = dao.getZbshlbTotalPage();
			}
			if(!("".equals(tn))){
				totalPage = 1;
			}
			if (!("".equals(gysname)) && ("".equals(tn))) {
				totalPage = dao.getZbshlbTotalPage(gysname);
			}
			printWriter.print(totalPage);
		}else{
			ArrayList<Zbsh> list = dao.selectZbshList(currentPage,gysname,tn);
			printWriter.print("<table style = \"margin-left:60px; margin-top:20px; text-align:center; width:900px;\" class=\"table table-striped\">");
			printWriter.print("<tr><th style = \"text-align:center;\">序号</th><th style = \"text-align:center;\">单据单号</th><th style = \"text-align:center;\">煤种</th> <th style = \"text-align:center;\">数量(万吨)</th> <th style = \"text-align:center;\">收到基低位发热量</th><th style = \"text-align:center;\">状态</th> <th style = \"text-align:center;\">操作</th></tr>");
			//输出每一行数据
			if(list.size() == 0){
				printWriter.print("<tr><td>很抱歉，没有找到相关数据</td></tr>");
			}else{
				for (int i = 0; i < list.size(); i++) {
					printWriter.print("<tr>");
					printWriter.print("<td>"+ ((currentPage-1)*2+1+i) + "</td>");    //序号
					printWriter.print("<td>"+list.get(i).getTn()+"</td>");	//单据编号
					printWriter.print("<td>"+list.get(i).getCoalType()+"</td>");	//煤种
					printWriter.print("<td>"+list.get(i).getNumber()+"</td>");	//采购数量（万吨）
					printWriter.print("<td>"+list.get(i).getFrl()+"</td>");	//收到基低位发热量
					printWriter.print("<td>"+list.get(i).getStatus()+"</td>");	//状态
					printWriter.print("<td>"+list.get(i).getCz()+"</td>");	//操作
					printWriter.print("</tr>");
				}
			}
			//输出table结束标签
			printWriter.print("</table>");
		}
		
		
	}
}
