<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fengwuj.util.DBConnection" %>
<%@ page import="com.fengwuj.entity.*" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/maint1.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	var mySession = <%=session.getAttribute("user")%>;
	if(mySession == null){
		alert("您还未登录，请先进行登录！");
		window.location.href = "index.html";
	}
</script>


<%
	Connection connection = DBConnection.getConnection();
	String tn = request.getParameter("tn");
	String cgxxSql = "select * from cgxxtable where tn = ?";
	String mzyqSql = "select * from mzyqtable where tn = ?";
	String djczjlSql = "select * from djczjltable where tn = ?";
		
	ArrayList<Djczjl> dlist = new ArrayList<Djczjl>();

	PreparedStatement psmt = connection.prepareStatement(cgxxSql);
	psmt.setString(1, tn);
	ResultSet rs = psmt.executeQuery();
	
	//查询采购信息表,限一条数据
	Cgxx cgxx = new Cgxx();
	if (rs.next()) {
		//初始化采购信息的实体类
		cgxx.setId(rs.getInt("id"));
		cgxx.setBjjzrq(rs.getTimestamp("bjjzrq"));
		cgxx.setTn(rs.getString("tn"));
		cgxx.setSqdw(rs.getString("sqdw"));
		cgxx.setSqr(rs.getString("sqr"));
		cgxx.setQfr(rs.getString("qfr"));
		cgxx.setSqrq(rs.getDate("sqrq"));
		cgxx.setStarttime(rs.getDate("starttime"));
		cgxx.setFinishtime(rs.getDate("finishtime"));
		cgxx.setMz(rs.getString("mz"));
		cgxx.setCgsl(rs.getDouble("cgsl"));
		cgxx.setYsfs(rs.getString("ysfs"));
		cgxx.setJhdd(rs.getString("jhdd"));
		cgxx.setJsfs(rs.getString("jsfs"));
		cgxx.setYunshufs(rs.getString("yunshufs"));
		cgxx.setZgxj(rs.getString("zgxj"));
		cgxx.setZdxj(rs.getString("zdxj"));
		cgxx.setJsfkfs(rs.getString("jsfkfs"));
		cgxx.setBzjyq(rs.getString("bzjyq"));
	}
	
	//查询煤质要求表，限一条数据
	psmt = connection.prepareStatement(mzyqSql);
	psmt.setString(1, tn);
	rs = psmt.executeQuery();
	Mzyq mzyq = new Mzyq();
	if (rs.next()) {
		//初始化煤质要求的实体类
		mzyq.setId(rs.getInt("id"));
		mzyq.setTn(rs.getString("tn"));
		mzyq.setSdjfrl(rs.getDouble("sdjfrl"));
		mzyq.setSdjql(rs.getDouble("sdjql"));
		mzyq.setSdjqsf(rs.getDouble("sdjqsf"));
		mzyq.setSdjhf(rs.getDouble("sdjhf"));
		mzyq.setKgjsf(rs.getDouble("kgjsf"));
		mzyq.setKgjql(rs.getDouble("kgjql"));
		mzyq.setKgjhff(rs.getString("kgjhff"));
		mzyq.setGjgwfrl(rs.getString("gjgwfrl"));
		mzyq.setGjql(rs.getString("gjql"));
		mzyq.setGjwhdhff(rs.getDouble("gjwhdhff"));
		mzyq.setLd(rs.getDouble("ld"));
		mzyq.setHrd(rs.getDouble("hrd"));
		mzyq.setHskmxs(rs.getDouble("hskmxs"));
		mzyq.setBz(rs.getString("bz"));
		mzyq.setSdjhffstart(rs.getDouble("sdjhffstart"));
		mzyq.setSdjhffend(rs.getDouble("sdjhffend"));
	}
	
	//查询单据操作记录表，可多条数据
	psmt = connection.prepareStatement(djczjlSql);
	psmt.setString(1, tn);
	rs = psmt.executeQuery();
	while (rs.next()) {
		//初始化单据操作记录的实体类
		Djczjl djczjl = new Djczjl();
		djczjl.setId(rs.getInt("id"));
		djczjl.setCzry(rs.getString("czry"));
		djczjl.setDw(rs.getString("dw"));
		djczjl.setTn(rs.getString("tn"));
		djczjl.setCz(rs.getString("cz"));
		djczjl.setSpyj(rs.getString("spyj"));
		djczjl.setCzsj(rs.getTimestamp("czsj"));
		djczjl.setBzly(rs.getString("bzly"));
		dlist.add(djczjl);
	}
	
%>

</head>
<body>
	<div id = "frame">
		
			<jsp:include page="top.html"></jsp:include>
			<div id = "bottom">
				<jsp:include page="left.html"></jsp:include>
				<div id = "right">
					<div>
						<div class = "di">采购信息</div>
						<div style="margin-top:-15px;"><hr/></div>
						<div>
							<table>									
								<tr>								
									<td>报价截至日期：<input class = "input"  type="text" value="<%=cgxx.getBjjzrq() %>" readonly="readonly" ></input></td>	
									<td><input class = "input"  type="text" value="" readonly="readonly" ></input></td>	
									<td><input class = "input"  type="text" value="" readonly="readonly" ></input></td>							
								</tr>	
															
								<tr>								
									<td>单据编号：<input class = "input"  type="text" value="<%=cgxx.getTn() %>" readonly="readonly" ></input></td>
									<td>申请单位：<input type="text" value="<%=cgxx.getSqdw() %>" readonly="readonly" ></input></td>
									<td>申请人：<input type="text" value="<%=cgxx.getSqr() %>" readonly="readonly" ></input></td>									
								</tr>		
														
								<tr>
									<td>煤种：<input class = "input"  type="text" value="<%=cgxx.getMz() %>" readonly="readonly" ></input></td>
									<td>采购数量：<input type="text" value="<%=cgxx.getCgsl() %>" readonly="readonly" ></input></td>
									<td>运输方式：<input type="text" value="<%=cgxx.getYunshufs() %>" readonly="readonly" ></input></td>															
								</tr>	
												
								<tr>								
									<td>签发人：<input class = "input"  type="text" value="<%=cgxx.getQfr() %>" readonly="readonly" ></input></td>
									<td>申请日期：<input type="text" value="<%=cgxx.getSqrq() %>" readonly="readonly" ></input></td>
									<td>交货时间：<%=cgxx.getStarttime() %> 至 <%=cgxx.getFinishtime() %></td>										
								</tr>	
										
								<tr>								
									<td>交货地点：<input class = "input"  type="text" value="<%=cgxx.getJhdd() %>" readonly="readonly" ></input></td>
									<td>结算方式：<input type="text" value="<%=cgxx.getJsfs() %>" readonly="readonly" ></input></td>
									<td>验收方式：<input type="text" value="<%=cgxx.getYsfs() %>" readonly="readonly" ></input></td>										
								</tr>	
								
								<tr>								
									<td>最高限价：<input class = "input"  type="text" value="<%=cgxx.getZgxj() %>" readonly="readonly" ></input></td>
									<td>最低限价：<input type="text" value="<%=cgxx.getZdxj() %>" readonly="readonly" ></input></td>		
									<td><input type="text" value="" readonly="readonly" ></input></td>							
								</tr>							
							</table>							
						</div>
						
						<div class = "di">媒质要求</div>
						<div style="margin-top:-15px;"><hr/></div>
						<div>
							<table>									
								<tr>								
									<td>收到基基准<input class = "input"  type="text" value="" readonly="readonly" ></input></td>	
									<td><input class = "input"  type="text" value="" readonly="readonly" ></input></td>	
									<td><input class = "input"  type="text" value="" readonly="readonly" ></input></td>							
								</tr>	
															
								<tr>								
									<td>收到基低位发热量：<input class = "input"  type="text" value="<%=mzyq.getSdjfrl() %>" readonly="readonly" ></input></td>
									<td>收到基全硫St,ar(%)<=：<input type="text" value="<%=mzyq.getSdjql() %>" readonly="readonly" ></input></td>
									<td>全水分Mt(%)<=：<input type="text" value="<%=mzyq.getSdjqsf() %>" readonly="readonly" ></input></td>									
								</tr>		
														
								<tr>
									<td>收到基灰分Aar(%)<=：<input class = "input"  type="text" value="<%=mzyq.getSdjhf() %>" readonly="readonly" ></input></td>
									<td colspan="1">收到基挥发分Var(%)：<%=mzyq.getSdjhffstart() %> 至 <%=mzyq.getSdjhffend() %></td>
									<td></td>															
								</tr>	
														
								<tr>								
									<td>空气干燥基基准<input class = "input"  type="text" value="" readonly="readonly" ></input></td>
									<td><input  type="text" value="" readonly="readonly" ></input></td>
									<td><input  type="text" value="" readonly="readonly" ></input></td>										
								</tr>	
								
								<tr>								
									<td>空干基水分Mad(%)<=：<input class = "input"  type="text" value="<%=mzyq.getKgjsf() %>" readonly="readonly" ></input></td>
									<td>空干基基全硫St,ar(%)<=：<input  type="text" value="<%=mzyq.getKgjql() %>" readonly="readonly" ></input></td>		
									<td>空干基挥发分Var(%)：<input  type="text" value="<%=mzyq.getKgjhff() %>" readonly="readonly" ></input></td>							
								</tr>		
								
								<tr>								
									<td>干燥基基准<input class = "input"  type="text" value="" readonly="readonly" ></input></td>
									<td><input  type="text" value="" readonly="readonly" ></input></td>		
									<td><input  type="text" value="" readonly="readonly" ></input></td>							
								</tr>	
								
								<tr>								
									<td>干基高位发热量：<input class = "input"  type="text" value="<%=mzyq.getGjgwfrl() %>" readonly="readonly" ></input></td>
									<td>干基全硫St,d(%)<=：<input type="text" value="<%=mzyq.getGjql() %>" readonly="readonly" ></input></td>		
									<td>干燥无灰基挥发分：<input type="text" value="<%=mzyq.getGjwhdhff() %>" readonly="readonly" ></input></td>							
								</tr>		
								
								<tr>								
									<td>粒度(mm)<=：<input class = "input"  type="text" value="<%=mzyq.getLd() %>" readonly="readonly" ></input></td>
									<td>灰熔点St(°C)>=：<input  type="text" value="<%=mzyq.getHrd() %>" readonly="readonly" ></input></td>		
									<td>哈式可磨系术(MGI)>=：<input type="text" value="<%=mzyq.getHskmxs() %>" readonly="readonly" ></input></td>							
								</tr>					
							</table>							
						</div>
						
						<div class = "di">单据操作记录</div>
						<div style="margin-top:-15px;"><hr/></div>
						<div>
							<table>		
								<tr>							
									<td class = "td">序号</td>
									<td class = "td">操作人员</td>
									<td class = "td">单位</td>
									<td class = "td">操作</td>
									<td class = "td">审批意见</td>
									<td class = "td">操作时间</td>
								</tr>	
												
								
									<%for(int i = 0; i < dlist.size(); i++){
										Djczjl djczjl = dlist.get(i);%>
										<tr>								
											<td><input class = "input"  type="text" value="<%=i+1%>" readonly="readonly" ></input></td>
											<td><input class = "input"  type="text" value="<%=djczjl.getCzry() %>" readonly="readonly" ></input></td>
											<td><input class = "input"  type="text" value="<%=djczjl.getDw() %>" readonly="readonly" ></input></td>
											<td><input class = "input"  type="text" value="<%=djczjl.getCz() %>" readonly="readonly" ></input></td>
											<td><input class = "input" type="text" value="<%=djczjl.getSpyj() %>" readonly="readonly" ></input></td>
											<td><input class = "input"  type="text" value="<%=djczjl.getCzsj() %>" readonly="readonly" ></input></td>								
										</tr>	
									<%}%>					
							</table>						
						</div>
						
						<div id = "juzhong">
							<button class="button2">审批通过</button>
							<button class="button2">审批驳回</button>
							<button class="button2">返回</button>
						</div>
				  	</div>
				</div>		
			</div>	
		</div>	
</body>
</html>