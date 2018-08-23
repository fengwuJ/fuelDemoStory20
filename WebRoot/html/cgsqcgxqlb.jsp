<%@page import="java.awt.List"%>
<%@page import="com.fengwuj.factory.Factory"%>
<%@page import="com.fengwuj.Dao.Dao"%>
<%@page import="com.fengwuj.entity.Cgsq"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>采购需求列表</title>
<script type="text/javascript" src="../frame/checksession.js"></script>
<link rel = "stylesheet" type = "text/css" href = "../css/cgsqcgxqlb.css" />
<link rel = "stylesheet" type = "text/css" href = "../frame/bootstrap.min.css"/>
<script src = "../frame/jquery.min.js"></script>
<script src = "../frame/bootstrap.min.js"></script>
				
<script type="text/javascript">
	getsession();
</script>
<%
	int totalPage = 0;
	String tempstat = request.getParameter("status");
	String mpage = request.getParameter("currentPage");
	String tn = request.getParameter("tn");
	String dcmc = request.getParameter("dcmc");
	ArrayList<Cgsq> cgxqList = null;
	int currentPage = 1;
	int status = 0;
	if(tn == null && dcmc == null){
		if(mpage == null){%>
			<script type="text/javascript">window.location.href="cgsqcgxqlb.jsp?currentPage=1&status=0"</script>
	  <%}else{
	  		currentPage = Integer.parseInt(mpage);
			int startRow = 2*(currentPage-1);
			status = Integer.parseInt(tempstat);
			Dao dao = Factory.createMysqlDao();
			cgxqList = dao.selectCgxqList(status,startRow);
			totalPage = dao.selectCgxqPage(status);
	  	}
	}else if(tn.length() > 0 && dcmc.length() > 0){
		Dao dao = Factory.createMysqlDao();
		cgxqList = dao.selectCgxqListByTandD(tn, dcmc);
		totalPage = 1;
	}else if(tn.length() > 0 && dcmc.length() == 0){
		Dao dao = Factory.createMysqlDao();
		cgxqList = dao.selectCgxqListByTn(tn);
		totalPage = 1;
	}else if(tn.length() == 0 && dcmc.length() > 0){
		currentPage = Integer.parseInt(mpage);
		int startRow = 2*(currentPage-1);
		Dao dao = Factory.createMysqlDao();
		cgxqList = dao.selectCgxqListByDcmc(dcmc,startRow);
		totalPage = dao.selectCgxqPage(dcmc);
	}
%>



<script type="text/javascript">
	var status = <%=status%>;
	$(function(){
		$("input[name=options]").change(function(){
				if(this.value == 0){
					window.location.href="cgsqcgxqlb.jsp?currentPage=1&status=0";
				}
				if(this.value == 1){
					window.location.href="cgsqcgxqlb.jsp?currentPage=1&status=1";
				}
				if(this.value == 2){
					window.location.href="cgsqcgxqlb.jsp?currentPage=1&status=2";
				}
			});
	});
</script>
				
				
				
</head>
<body>
<div class = "frame7">
			<div class = "top7">
				<jsp:include page="../html/top.html" flush="true"/>
			</div>
			
			<div class = "bottom7">
				<jsp:include page="../html/left.html" flush="true"/>
				<div class = "right7">
					<div class = "cgxqlb7">采购需求列表</div>
					<div class = "line7"></div>
						
						<div class = "div7">
						<!--
							采购单状态：<input class = "" name = "cgdzt" type = "radio" value = "" checked = "checked"/>全部
									<input class = "" name = "cgdzt" type = "radio" value = "" />待审核
									<input class = "" name = "cgdzt" type = "radio" value = "" />已发布
						-->
						
						<div class="btn-group" data-toggle="buttons">
					       <label  class="btn btn-info">
					           <input type="radio" name="options" value="0"/> 全部
					       </label>
					       <label  class="btn btn-info">
					           <input type="radio" name="options" value="1"/> 待审核
					       </label> 
					       <label  class="btn btn-info">
					           <input type="radio" name="options" value="2"/> 已发布
					       </label>
					    </div>
						</div>
						<div class = "div7">
							<h3><span class = "span7">单据编号：</span>
							<input class = "input7" name = "tn" type = "text" value = "" id="tn"/></h3>
							<h3><span class = "span7">电厂名称：</span>
							<input class = "input7" name = "dcmc" type = "text" value = "" id="dcmc"/></h3>
							
							<button class = "btn btn-default" id="selectByCond">查询</button>
						</div>
						
						<div class = "div7">
							<table class = "table">
								<tr>
									<th>序号</th>
									<th>单据编号</th>
									<th>煤种</th>
									<th>热卡值</th>
									<th>煤量(万吨)</th>
									<th>状态</th>
									<th>审批日期</th>
									<th>操作</th>
								</tr>
								
								<%
									if(cgxqList != null){
										if(cgxqList.size() == 0){%>
											<tr><td><div>很抱歉，没有搜索到该条数据</div></td></tr>
									  <%}else{
											for(int i = 0; i < cgxqList.size(); i++){
												Cgsq cgsq = cgxqList.get(i);%>
												<tr>
													<td><%=((currentPage-1)*2)+i+1 %></td>
													<td><%=cgsq.getTn() %></td>
													<td><%=cgsq.getCoalType() %></td>
													<td><%=cgsq.getRkz() %></td>
													<td><%=cgsq.getNumber() %></td>
													<td><%=cgsq.getStatus() %></td>
													<td><%=cgsq.getSprq()==null?"":cgsq.getSprq()%></td>
													<%
														if("查看".equals(cgsq.getCz())){%>
															<td><a href="cgxqck.jsp?tn=<%=cgsq.getTn()%>"><%=cgsq.getCz() %></a></a></td>
														<%}else{%>
															<td><a href="maint1.jsp?tn=<%=cgsq.getTn()%>"><%=cgsq.getCz() %></a></a></td>
														<%}
													%>
												</tr>
											<%}
										}
									}%>
							</table>	
						</div>
						
						<div class = "div77">
							<nav>
							  <ul class="pagination">
							    <li>
							      <a href="javascript:void(0)" aria-label="Previous" onclick="window.location.href='cgsqcgxqlb.jsp?currentPage='+<%=currentPage-1%>+'&status='+status;">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
							    <%
							    	if(cgxqList != null){
							    	for(int i = 0; i < totalPage; i++){%>
							    		<li><a href="javascript:void(0)" onclick="window.location.href='cgsqcgxqlb.jsp?currentPage='+<%=i+1%>+'&status='+status;"><%=i+1%></a></li>
							    	<%}
							    	}	
							    %>
							    <li>
							      <a href="javascript:void(0)" aria-label="Next" onclick="window.location.href='cgsqcgxqlb.jsp?currentPage='+<%=currentPage+1%>+'&status='+status;">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
							    <li><a href="#">共<%=cgxqList==null?"":totalPage%>页</a></li>
							    <li><a>第&nbsp;<input style="height: 15px;width: 20px;" id="mp" value="<%=currentPage%>"/>&nbsp;页</a></li>
							    <li><a href="javascript:void(0)" onclick="window.location.href='cgsqcgxqlb.jsp?currentPage='+ $('#mp').val() +'&status='+status;">确认</a></li>
							  </ul>			
							</nav>
							
						</div>	
				</div>	
			</div>
		</div>

	<script type="text/javascript">
		$(function(){
			$("#selectByCond").click(function(){
				var tn = $("#tn").val();
				var dcmc = $("#dcmc").val();
				if(tn.length == 0 && dcmc.length == 0){
					alert("请至少填写一个搜索内容");
				}else{
					window.location.href='cgsqcgxqlb.jsp?tn=' +tn+'&dcmc='+dcmc +'&currentPage=1';
				}
			});
			
		});
	</script>

</body>

</html>