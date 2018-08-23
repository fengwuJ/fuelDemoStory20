<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- 采购执行管理--采购下达列表页面，主要实现了对采购下达的某条订单的下达和查看操作，所有订单的分页查看，搜索查看，分状态查看等 -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../frame/checksession.js"></script>

<link rel = "stylesheet" type = "text/css" href = "../frame/bootstrap.min.css"/>
<script src = "../frame/jquery.min.js"></script>
<script src = "../frame/bootstrap.min.js"></script>
				
<!-- <script type="text/javascript">
	getsession();
</script> -->
<style>
/* 右侧位置*/
.ycwz {
	float: left;
	width: 960px;
	height: 700px;
}

/* 个人信息位置 */
.grxxwz {
	font-size: 26px;
	width: 200px; font-family : 宋体; color : #FFFAFA; background-color :
	#87CEFA; margin-bottom : 10px; text-align : center;
	margin-top: 20px;
	font-family: 宋体;
	color: #FFFAFA;
	background-color: #87CEFA;
	margin-bottom: 10px;
	text-align: center;
}

/* 线位置 */
.xwz {
	height: 1px;
	border: none;
	border-top: 1px solid #D3D3D3;
	margin-left: 60px;
}
/* 设置总体布局 */
.frame {
	margin:0 auto;
	width:1200px;
	background-image:linear-gradient(#FFF0F5,#FFFFF0);
}
/* 设置下层布局 */
.bottom {
	width: 1200px;
	height: 600px;
}
/* 设置下层右侧布局 */
#right {
	float: left;
	width: 960px;
	height: 600px;
}
</style>
<script type="text/javascript">
	//初始化函数
	$(function(){
		var cpage = 1;			//记录当前页
		var totalpage = 0;		//初始化总页数
		var status = "全部";	//初始化查询的订单条件
		var isCheck = false;	//记录是否点击查询按钮
		var gysname = "";
		var tn = "";
		//页面加载后，执行该方法访问所有订单中第一页的订单记录
		$.ajax({
			dataType:'text',
			type:'post',
	        url: "../cgxdlb",
	        data:'currentPage='+cpage+'&status='+status,
	        success:function(result){
	        	$("#mytable").html(result);
	        },
	        error:function(){
	        }
		});
		
		//初始化总的页数
		$.ajax({
			dataType:'text',
			type:'post',
	        url: "../cgxdlbGetPage",
	        data:"status=全部",
	        success:function(result){
	        	totalpage = result;
	        	$("#zys").text("共"+result+"页");
	        	$("#dqys").val(cpage);
	        },
	        error:function(){
	        }
		});
		
		//下一页
		$("#nextpage").click(function(){
			if(cpage < totalpage){
				cpage += 1;
				$("#dqys").val(cpage);
				if(!isCheck){
					$.ajax({
						dataType:'text',
						type:'post',
				        url: "../cgxdlb",
				        data:'currentPage='+cpage+'&status='+status,
				        success:function(result){
				        	$("#mytable").html(result);
				        },
				        error:function(){
				        }
					});
				}else{
					$.ajax({
						dataType:'text',
						type:'get',
				        url: "../sscgxdlb",
				        data:'currentPage='+cpage+'&status='+status+'&tn='+tn+'&gysname='+gysname,
				        success:function(result){
				        	
				        	$("#mytable").html(result);
				        },
				        error:function(){
				        }
					});
				}
			}
			if(cpage == totalpage){
				$(this).click(function(){});
			}
				
		});
		
		//上一页
		$("#prepage").click(function(){
			if(cpage > 2){
				cpage -= 1;
				$("#dqys").val(cpage);
				if(!isCheck){
					$.ajax({
						dataType:'text',
						type:'post',
				        url: "../cgxdlb",
				        data:'currentPage='+cpage+'&status='+status,
				        success:function(result){
				        	alert(result);
				        	$("#mytable").html(result);
				        },
				        error:function(){
				        }
					});
				}else{
					$.ajax({
						dataType:'text',
						type:'post',
				        url: "../sscgxdlb",
				        data:'currentPage='+cpage+'&status='+status+'&tn='+tn+'&gysname='+gysname,
				        success:function(result){
				        
				        	$("#mytable").html(result);
				        },
				        error:function(){
				        }
					});
				}
				
			} 
			if(cpage == 1){
				$(this).click(function(){});
			}
		});

		//用户输入页码，点击跳转的方法
		$("#qrtz").click(function(){
			if($("#dqys").val() < 1 || $("#dqys").val() > totalpage){
				alert("输入有误，请重新输入");
			}else{
				cpage = $("#dqys").val()
				if(!isCheck){
					$.ajax({
						dataType : 'text',
						type : 'post',
						url : "../cgxdlb",
						data : 'currentPage=' + $("#dqys").val() + '&status=' + status,
						success : function(result) {
							$("#mytable").html(result);
						},
						error : function() {}
					});
				}else{
					$.ajax({
						dataType:'text',
						type:'post',
				        url: "../sscgxdlb",
				        data:'currentPage='+$("#dqys").val()+'&status='+status+'&tn='+tn+'&gysname='+gysname,
				        success:function(result){
				        	$("#mytable").html(result);
				        },
				        error:function(){
				        }
					});
				}
			}
		});
		
		//点击查询按钮查询相关订单
		$("#searchInfo").click(function(){
			isCheck = true;
			tn = $("#tn").val();
			gysname = $("#gysname").val();
			if(tn.length == 0 && gysname.length == 0){
				alert("请输入至少一条数据");
				return false;
			}
			//查询数据
			$.ajax({
			dataType:'text',
			type:'post',
	        url: "../sscgxdlb",
	        data:'currentPage=1&status='+status+'&tn='+tn+'&gysname='+gysname,
	        success:function(result){
	        	
	        	$("#mytable").html(result);
	        },
	        error:function(){
	        }
		});
		
		//初始化总的页数
		$.ajax({
			dataType:'text',
			type:'post',
	        url: "../sscgxdlbPages",
	        data:'gysname='+gysname,
	        success:function(result){
	        	totalpage = result;
	        	$("#zys").text("共"+result+"页");
	        	$("#dqys").val(1);
	        },
	        error:function(){
	        }
		});
		});
		
		//
		$("input[name=options]").change(function(){
			status = this.value;
			isCheck = false;
			//查询对应订单状态数据
			$.ajax({
				dataType:'text',
				type:'post',
		        url: "../cgxdlb",
		        data:'currentPage='+cpage+'&status='+status,
		        success:function(result){
		        	$("#mytable").html(result);
		        },
		        error:function(){
		        }
			});
			
			//查询对应订单状态的总页数
			$.ajax({
				dataType:'text',
				type:'post',
		        url: "../cgxdlbGetPage",
		        data:"status=" + status,
		        success:function(result){
		        	totalpage = result;
		        	$("#zys").text("共"+result+"页");
		        	cpage = 1;
		        	$("#dqys").val(cpage);
		        },
		        error:function(){
		        }
			});
		});
	});
</script>

</head>
<body>
<div class="frame">
	<jsp:include page="top.html"></jsp:include>
	<div class="bottom">
		<jsp:include page="left.html"></jsp:include>
		<div id="right">
				<div class = "ycwz">
					<div class = "grxxwz">采购下达列表</div>
					<div class = "xwz"></div>
					<div style = "font-family:宋体; margin-left:60px; margin-top:20px;">
								采购单状态
								<input type = "radio" value = "全部" name="options" checked="checked"/>全部
								<input type = "radio" value = "未下达" name="options"/>未下达
								<input type = "radio" value = "已下达" name="options"/>已下达
								<input type = "radio" value = "已发布" name="options"/>已发布
								<input type = "radio" value = "已驳回" name="options"/>已驳回
								<input type = "radio" value = "已作废" name="options"/>已作废
					</div>
					<div style = "font-family:宋体; margin-left:60px; margin-top:20px;">
						<div style = "float:left; margin-top:7px;">采购单号</div>
						<input style = "float:left; width:200px; margin-left:10px;" class="form-control" type = "text" id="tn" name="tn"/>
						<div style = "float:left; margin-top:7px; margin-left:10px;">供应商名称</div>
						<input style = "float:left; width:200px; margin-left:10px;" class="form-control" type = "text" id="gysname" name="gysname"/>
						<button style = "margin-left:17px;" class = "btn btn-default" id="searchInfo">查询</button>
					</div>
					<div id="mytable">
						<!-- <table style = "margin-left:60px; margin-top:20px; text-align:center; width:900px;" class="table table-striped">					
					     	<tr>				     		
					       		<th style = "text-align:center;">序号</th> 
					       		<th style = "text-align:center;">单据单号</th> 
					       		<th style = "text-align:center;">煤种</th> 
					       		<th style = "text-align:center;">采购数量(万吨)</th> 
					       		<th style = "text-align:center;">收到基低位发热量</th> 
					       		<th style = "text-align:center;">下达日期</th>   
					       		<th style = "text-align:center;">订单状态</th> 
					       		<th style = "text-align:center;">操作</th> 
					        </tr>
						</table> -->
					</div>
					
					<div style = "font-family:宋体; margin-left:300px;">
						<nav>
						  <ul class="pagination">
						    <li>
						      <a href="#" aria-label="Previous" id="prepage">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li>
						      <a href="#" aria-label="Next" id="nextpage">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						    <li><a href="javascript:void(0);" id="zys">共页</a></li>
						    <li><a href="javascript:void(0);">第&nbsp;<input id="dqys" style="height: 15px;width: 20px;" id="dqys" value=""/>&nbsp;页</a></li>
						    <li><a href="javascript:void(0);" id="qrtz">确认</a></li>
						  </ul>
						</nav>						
					</div>
				</div>	
			</div>
		</div>
		</div>
	</div>
</div>
</body>
</html>
