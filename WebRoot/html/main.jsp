<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fengwuj.util.DBConnection" %>
<%@ page import="com.fengwuj.entity.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<script type="text/javascript" src="../frame/jquery.min.js"></script>

<script type="text/javascript">
	var mySession = <%=session.getAttribute("user")%>;
	if(mySession == null){
		alert("您还未登录，请先进行登录！");
		window.location.href = "index.html";
	}
</script>

<% 
	Connection connection = DBConnection.getConnection();
	//采购申请   cgsqtable
	//中标结果下达   zzjgxdtable
	//中标	   zzshtable
	//电厂申请	   dcsqshtable
	String cgsqSql = "select * from cgsqtable where cz = ?";
	String zzjgxdSql = "select * from zzjgxdtable where status = ?  limit 4";
	String zbshSql = "select * from zzshtable where cz = ? limit 4";
	String dcsqshSql = "select * from dcsqshtable limit 4";
	
	ArrayList<Cgsq> list1 = new ArrayList();
	ArrayList<Zzjgxd> list2 = new ArrayList();
	ArrayList<Zbsh> list3 = new ArrayList();
	ArrayList<Dcsqsh> list4 = new ArrayList();
	
	PreparedStatement psmt = connection.prepareStatement(cgsqSql);
	psmt.setString(1, "审核");
	ResultSet rs = psmt.executeQuery();
	while(rs.next()){
		Cgsq cgsq = new Cgsq();
		cgsq.setId(rs.getInt("id"));
		cgsq.setTn(rs.getString("tn"));
		cgsq.setTime(rs.getDate("time"));
		cgsq.setCoalType(rs.getString("coaltype"));
		cgsq.setNumber(rs.getDouble("number"));
		cgsq.setJsfs(rs.getString("jsfs"));
		cgsq.setFqr(rs.getString("fqr"));
		cgsq.setCz(rs.getString("cz"));
		cgsq.setStatus(rs.getString("status"));
		cgsq.setSprq(rs.getDate("sprq"));
		cgsq.setRkz(rs.getDouble("rkz"));
		list1.add(cgsq);
	}
	
	psmt = connection.prepareStatement(zzjgxdSql);
	psmt.setString(1, "未下达");
	rs = psmt.executeQuery();
	while(rs.next()){
		Zzjgxd zzjgxd = new Zzjgxd();
		zzjgxd.setId(rs.getInt("id"));
		zzjgxd.setTn(rs.getString("tn"));
		zzjgxd.setTime(rs.getDate("time"));
		zzjgxd.setCoalType(rs.getString("coaltype"));
		zzjgxd.setNumber(rs.getDouble("number"));
		zzjgxd.setYsfs(rs.getString("ysfs"));
		zzjgxd.setFrl(rs.getString("frl"));
		zzjgxd.setCz(rs.getString("cz"));
		zzjgxd.setXdrq(rs.getDate("xdrq"));
		zzjgxd.setStatus(rs.getString("status"));
		zzjgxd.setGysname(rs.getString("gysname"));
		list2.add(zzjgxd);
	}
	
	psmt = connection.prepareStatement(zbshSql);
	psmt.setString(1, "审核");
	rs = psmt.executeQuery();
	while(rs.next()){
		Zbsh zzsh = new Zbsh();
		zzsh.setId(rs.getInt("id"));
		zzsh.setTn(rs.getString("tn"));
		zzsh.setTime(rs.getDate("time"));
		zzsh.setCoalType(rs.getString("coaltype"));
		zzsh.setNumber(rs.getDouble("number"));
		zzsh.setYsfs(rs.getString("ysfs"));
		zzsh.setFrl(rs.getString("frl"));
		zzsh.setCz(rs.getString("cz"));
		zzsh.setStatus(rs.getString("status"));
		zzsh.setStatus(rs.getString("gysname"));
		list3.add(zzsh);
	}
	
	psmt = connection.prepareStatement(dcsqshSql);
	rs = psmt.executeQuery();
	while(rs.next()){
		Dcsqsh dcsqsh = new Dcsqsh();
		dcsqsh.setId(rs.getInt("id"));
		dcsqsh.setGysName(rs.getString("gysname"));
		dcsqsh.setTime(rs.getDate("time"));
		dcsqsh.setSqdw(rs.getString("sqdw"));
		dcsqsh.setSplx(rs.getString("splx"));
		dcsqsh.setCz(rs.getString("cz"));
		list4.add(dcsqsh);
	}
	
%>




</head>
<body>
<div id="frame">
		<!--
		<div id="top">

			<div id="icon">
				<img src="../images/icon.png" />
			</div>

			<div id="title">
				<h1>分 公 司 业 务 管 理 中 心</h1>
			</div>

			<div id="navigation">
				<div id="navigation1">
					<button>首页中心</button>
					<button class="class">交易中心</button>
					<button class="class">咨询中心</button>
					<button class="class">服务中心</button>
				</div>
			</div>

		</div>

		<div id="bottom">

			<div id="left">
				<div id="navigation2">
					
					<button class="button1">事务中心</button>
					<button class="button1">采购申请管理</button>
					<button class="button1">采购执行管理</button>
					<button class="butto4n1">供应商管理</button>
					<button class="button1" id="zhglbtn" onclick="xgxx()">账号管理</button>
					
					<div><a href="zhglxgmm.jsp">修改密码</a></div>
					
				</div>
			</div>
	-->
	
	<jsp:include   page="top.html" flush="true"/>
	<div id="bottom">
	<jsp:include   page="left.html" flush="true"/>
			
			<div id="right">
				<div class="di">采购申请</div>
					<div style="margin-top:-15px;">
						<hr />
					</div>
					<div>
						<table id="table1">
							<tr class="title">
								<td>单据编号</td>
								<td>申请日期</td>
								<td>煤种</td>
								<td>数量</td>
								<td>结算方式</td>
								<td>发起人</td>
								<td>操作</td>
							</tr>
						<%
							Cgsq c = null;
							for(int i = 0; i < list1.size(); i++){
								c = list1.get(i);
								if(i % 2 == 0){%>
									<tr class="t1">
										<td><input name="tn" type="text"
											value="<%=c.getTn() %>" readonly="readonly"></input></td>
										<td><input  name="time" type="text"
											value="<%=c.getTime() %>" readonly="readonly"></input></td>
										<td><input  name="coaltype" type="text"
											value="<%=c.getCoalType() %>" readonly="readonly"></input></td>
										<td><input  name="number" type="text"
											value="<%=c.getNumber() %>" readonly="readonly"></input></td>
										<td><input  name="jsfs" type="text"
											value="<%=c.getJsfs() %>" readonly="readonly"></input></td>
										<td><input  name="fqr" type="text"
											value="<%=c.getFqr() %>" readonly="readonly"></input></td>
										<td><a href="maint1.jsp?tn=<%=c.getTn() %>"><%=c.getCz() %></a></td>
									</tr>
								<%}else{%>
									<tr>
										<td><input  name="tn" type="text"
											value="<%=c.getTn() %>" readonly="readonly"></input></td>
										<td><input  name="time" type="text"
											value="<%=c.getTime() %>" readonly="readonly""></input></td>
										<td><input   name="coaltype" type="text"
											value="<%=c.getCoalType() %>" readonly="readonly"></input></td>
										<td><input   name="number" type="text"
											value="<%=c.getNumber() %>" readonly="readonly"></input></td>
										<td><input   name="jsfs" type="text"
											value="<%=c.getJsfs() %>" readonly="readonly"></input></td>
										<td><input   name="fqr" type="text"
											value="<%=c.getFqr() %>" readonly="readonly"></input></td>
										<td><a href="maint1.jsp?tn=<%=c.getTn() %>"><%=c.getCz() %></a></td>
									</tr>
								<%}%>
							<%}%>
						</table>
					</div>

					<div class="di">中标结果下达</div>
					<div style="margin-top:-15px;">
						<hr />
					</div>
					<div>
						<table id="table2">
							<tr class="title">
								<td>单据编号</td>
								<td>申请日期</td>
								<td>煤种</td>
								<td>数量</td>
								<td>发热量</td>
								<td>运输方式</td>
								<td>操作</td>
							</tr>
							
							<%
								Zzjgxd z = null;
								for(int i = 0; i < list2.size(); i++){
									z = list2.get(i);
									if(i % 2 == 0){%>
										<tr class="t1">
											<td><input   name="tn" type="text"
												value="<%=z.getTn() %>" readonly="readonly"></input></td>
											<td><input   name="time" type="text"
												value="<%=z.getTime() %>" readonly="readonly"></input></td>
											<td><input   name="coaltype" type="text"
												value="<%=z.getCoalType() %>" readonly="readonly"></input></td>
											<td><input   name="number" type="text"
												value="<%=z.getNumber() %>" readonly="readonly"></input></td>
											<td><input   name="frl" type="text"
												value="<%=z.getFrl() %>" readonly="readonly"></input></td>
											<td><input   name="ysfs" type="text"
												value="<%=z.getYsfs()%>" readonly="readonly"></input></td>
											<td><a href="maint1.jsp?tn=<%=z.getTn() %>"><%=z.getCz() %></a></td>
										</tr>
									<%}else{%>
										<tr>
											<td><input   name="tn" type="text"
												value="<%=z.getTn() %>" readonly="readonly"></input></td>
											<td><input   name="time" type="text"
												value="<%=z.getTime() %>" readonly="readonly"></input></td>
											<td><input   name="coaltype" type="text"
												value="<%=z.getCoalType() %>" readonly="readonly"></input></td>
											<td><input   name="number" type="text"
												value="<%=z.getNumber() %>" readonly="readonly"></input></td>
											<td><input   name="frl" type="text"
												value="<%=z.getFrl() %>" readonly="readonly"></input></td>
											<td><input   name="ysfs" type="text"
												value="<%=z.getYsfs()%>" readonly="readonly"></input></td>
											<td><a href="maint1.jsp?tn=<%=z.getTn() %>"><%=z.getCz() %></a></td>
										</tr>
									<%}%>
								<%}
							%>
						</table>
					</div>

					<div class="di">中标审核</div>
					<div style="margin-top:-15px;">
						<hr />
					</div>
					<div>
						<table id="table3">
							<tr class="title">
								<td>单据编号</td>
								<td>申请日期</td>
								<td>煤种</td>
								<td>数量</td>
								<td>发热量</td>
								<td>运输方式</td>
								<td>操作</td>
							</tr>
							
							<%
								Zbsh zb = null;
								for(int i = 0; i < list3.size(); i++){
									zb = list3.get(i);
									if(i % 2 == 0){%>
										<tr class="t1">
											<td><input   name="tn" type="text"
												value="<%=zb.getTn() %>" readonly="readonly"></input></td>
											<td><input   name="time" type="text"
												value="<%=zb.getTime() %>" readonly="readonly"></input></td>
											<td><input   name="coaltype" type="text"
												value="<%=zb.getCoalType() %>" readonly="readonly"></input></td>
											<td><input   name="number" type="text"
												value="<%=zb.getNumber() %>" readonly="readonly"></input></td>
											<td><input   name="frl" type="text"
												value="<%=zb.getFrl() %>" readonly="readonly"></input></td>
											<td><input   name="ysfs" type="text"
												value="<%=zb.getYsfs()%>" readonly="readonly"></input></td>
											<td><a href="maint1.jsp?tn=<%=zb.getTn() %>"><%=zb.getCz() %></a></td>
										</tr>
									<%}else{%>
										<tr>
											<td><input   name="tn" type="text"
												value="<%=zb.getTn() %>" readonly="readonly"></input></td>
											<td><input   name="time" type="text"
												value="<%=zb.getTime() %>" readonly="readonly"></input></td>
											<td><input   name="coaltype" type="text"
												value="<%=zb.getCoalType() %>" readonly="readonly"></input></td>
											<td><input   name="number" type="text"
												value="<%=zb.getNumber() %>" readonly="readonly"></input></td>
											<td><input   name="frl" type="text"
												value="<%=zb.getFrl() %>" readonly="readonly"></input></td>
											<td><input   name="ysfs" type="text"
												value="<%=zb.getYsfs()%>" readonly="readonly"></input></td>
											<td><a href="maint1.jsp?tn=<%=zb.getTn() %>"><%=zb.getCz() %></a></td>
										</tr>
									<%}%>
								<%}
							%>
						</table>
					</div>

					<div class="di">电厂申请</div>
					<div style="margin-top:-15px;">
						<hr />
					</div>
					<div>
						<table id="table4">
							<tr class="title">
								<td>供应商名称</td>
								<td></td>
								<td></td>
								<td>申请日期</td>
								<td>申请单位</td>
								<td>审批类型</td>
								<td>操作</td>
							</tr>
							
							<%
								Dcsqsh dcsqsh = null;
								for(int i = 0; i < list4.size(); i++){
									dcsqsh = list4.get(i);
									if(i % 2 == 0){%>
										<tr class="t1">
											<td><input   name="gysname" type="text"
												value="<%=dcsqsh.getGysName() %>" readonly="readonly"></input></td>
											<td></td>
											<td></td>
											<td><input   name="time" type="text"
												value="<%=dcsqsh.getTime() %>" readonly="readonly"></input></td>
											<td><input    name="sqdw" type="text"
												value="<%=dcsqsh.getSqdw() %>" readonly="readonly"></input></td>
											<td><input   name="splx" type="text"
												value="<%=dcsqsh.getSplx() %>" readonly="readonly"></input></td>
											<td><a href="maint1.jsp?gysname=<%=dcsqsh.getGysName()%>"><%=dcsqsh.getCz() %></a></td>
										</tr>
									<%}else{%>
										<tr>
											<td><input   name="gysname" type="text"
												value="<%=dcsqsh.getGysName() %>" readonly="readonly"></input></td>
											<td></td>
											<td></td>
											<td><input   name="time" type="text"
												value="<%=dcsqsh.getTime() %>" readonly="readonly"></input></td>
											<td><input   name="sqdw" type="text"
												value="<%=dcsqsh.getSqdw() %>" readonly="readonly"></input></td>
											<td><input   name="splx" type="text"
												value="<%=dcsqsh.getSplx() %>" readonly="readonly"></input></td>
											<td><a href="maint1.jsp?gysname=<%=dcsqsh.getGysName()%>"><%=dcsqsh.getCz() %></a></td>
										</tr>
									<%}
								}
							%>
						</table>
					</div>
			</div>
	</div>
</div>
	
</body>
</html>