package com.fengwuj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fengwuj.Dao.Dao;
import com.fengwuj.entity.Zzjgxd;
import com.fengwuj.factory.Factory;

public class CgxdlbServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//设置编码
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		
		//接收前端数据
		String status = req.getParameter("status");
		int currentPage = Integer.parseInt(req.getParameter("currentPage"));
		
		//从数据库访问数据并存储到list集合
		Dao dao = Factory.createMysqlDao();
		ArrayList<Zzjgxd> list = dao.selectZbxdList(status, currentPage);
		
		//向前端输出表头和相关样式
		printWriter.print("<table style = \"margin-left:60px; margin-top:20px; text-align:center; width:900px;\" class=\"table table-striped\">");
		printWriter.print("<tr><th style = \"text-align:center;\">序号</th><th style = \"text-align:center;\">单据单号</th><th style = \"text-align:center;\">煤种</th> <th style = \"text-align:center;\">采购数量(万吨)</th> <th style = \"text-align:center;\">收到基低位发热量</th> <th style = \"text-align:center;\">下达日期</th>   <th style = \"text-align:center;\">订单状态</th> <th style = \"text-align:center;\">操作</th></tr>");
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
				if(list.get(i).getXdrq() == null){
					printWriter.print("<td></td>");
				}else {
					printWriter.print("<td>"+list.get(i).getXdrq()+"</td>");	//下达日期
				}
				printWriter.print("<td>"+list.get(i).getStatus()+"</td>");	//订单状态
				printWriter.print("<td>"+list.get(i).getCz()+"</td>");	//操作
				printWriter.print("</tr>");
			}
		}
		//输出table结束标签
		printWriter.print("</table>");
		
//		<table style = "margin-left:60px; margin-top:20px; text-align:center; width:900px;" class="table table-striped">					
//     	<tr>				     		
//       		<th style = "text-align:center;">序号</th> 
//       		<th style = "text-align:center;">单据单号</th> 
//       		<th style = "text-align:center;">煤种</th> 
//       		<th style = "text-align:center;">采购数量(万吨)</th> 
//       		<th style = "text-align:center;">收到基低位发热量</th> 
//       		<th style = "text-align:center;">下达日期</th>   
//       		<th style = "text-align:center;">订单状态</th> 
//       		<th style = "text-align:center;">操作</th> 
//        </tr>
//	</table>
		
	}
	
}
