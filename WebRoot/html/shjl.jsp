<%@page import="com.fengwuj.entity.Djczjl"%>
<%@page import="com.fengwuj.factory.Factory"%>
<%@page import="com.fengwuj.Dao.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	/* 设置总体布局 */
	.frame {
		margin:0 auto;
		width:1200px;
		}

	
	/* 设置下层布局 */
	.bottom {
		width:1200px;
		height:600px;
	}
	/* 设置下层右侧布局 */
	.right {
		float:left;
		width:960px;
		height:600px;
	}	
	/* 信息修改 */
	.xxxg {
		font-size:30px;
		width:200px;
		font-family:宋体;
		color:#FFFAFA;
		background-color:#87CEFA;
		margin-bottom:10px;
		text-align:center;
		margin-top:20px;
	}
	.line {
		height:1px;
		border:none;
		border-top:5px solid #87CEFA;
		margin-top:-10px;
	}
	.table {
		border-collapse: collapse;
		text-align:center;
		margin-top:10px;
		margin-left:5px;
	}
	.table tr td {
		border:1px solid #0094ff;
	}
	.input {
		text-align:center;
		border:none;
		width:156px;
	}
.button2 {
	padding: 0px;
	text-align: center;
	float: left;
	width: 80px;
	background-image: linear-gradient(#F0F8FF, #F0F8FF);
	border: 1px solid rgba(0, 0, 0, 0);
	border-radius: 0px;
	box-shadow: 0 1px white inset;
	text-shadow: 0 0px 0px black;
	color: black;
	font-weight: bold;
	margin-right: 20px;
	font-family: 宋体;
}
div#juzhong {
	padding-left: 450px;
	margin-top: 200px;
}
</style>
<script type="text/javascript" src="../frame/jquery.min.js"></script>
<script type="text/javascript" src="../frame/checksession.js"></script>
<script type="text/javascript">
	getsession();
</script>

<%
	String tn = request.getParameter("tn");
	Dao dao = Factory.createMysqlDao();
	ArrayList<Djczjl> list = dao.selectShjl(tn);
%>
</head>


<body>
<div class="frame">
		<jsp:include page="top.html"></jsp:include>
		<div class="bottom">
			<jsp:include page="left.html"></jsp:include>
			<div class="right">
				<div class = "xxxg">审核记录</div>
				<div class = "line"></div>
				<div>
					<table class="table">
						<tr>
							<td class="td">序号</td>
							<td class="td">操作人员</td>
							<td class="td">单位</td>
							<td class="td">操作</td>
							<td class="td">审批意见</td>
							<td class="td">操作时间</td>
						</tr>
	
						<%for(int i = 0; i < list.size(); i++){
											Djczjl djczjl = list.get(i);%>
						<tr>
							<td><input class="input" type="text" value="<%=i+1%>"
								readonly="readonly"></input></td>
							<td><input class="input" type="text"
								value="<%=djczjl.getCzry() %>" readonly="readonly"></input></td>
							<td><input class="input" type="text"
								value="<%=djczjl.getDw() %>" readonly="readonly"></input></td>
							<td><input class="input" type="text"
								value="<%=djczjl.getCz() %>" readonly="readonly"></input></td>
							<td><input class="input" type="text"
								value="<%=djczjl.getSpyj() %>" readonly="readonly"></input></td>
							<td><input class="input" type="text"
								value="<%=djczjl.getCzsj() %>" readonly="readonly"></input></td>
						</tr>
						<%}%>
					</table>
					<div id="juzhong">
							<button class="button2" onclick="window.location.href='cgxqck.jsp?tn=<%=tn%>'">返回</button>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>