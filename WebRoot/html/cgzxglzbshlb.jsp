<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- 采购执行管理--采购下达列表页面，主要实现了对采购下达的某条订单的下达和查看操作，所有订单的分页查看，搜索查看，分状态查看等 -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title><script type="text/javascript" src="../frame/checksession.js"></script> 
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
	$(function(){
		var currentPage = 1;
		var gysname = "";
		var tn = "";
		var isClicked = false;
		var totalPage = 0;
		
		//初始化第一页
		$.ajax({
			dataType:'text',
			type:'get',
	        url: "../zbshlb",
	        data:'currentPage='+currentPage+'&gysname='+gysname+'&isGetTotalPage=0'+'&tn=' + tn,
	        success:function(result){
	        	$("#mytable").html(result);
	        },
	        error:function(XMLHttpRequest, textStatus, errorThrown){
	        }
		});
		
		//初始化总页数和当前页
		$.ajax({
			dataType:'text',
			type:'get',
	        url: "../zbshlb",
	        data:'currentPage='+currentPage+'&gysname='+gysname+'&isGetTotalPage=1'+'&tn=' + tn,
	        success:function(result){
	        	currentPage = 1;
	        	totalPage = result;
	        	$("#zys").text("共"+result+"页");
	        	$("#dqys").val(currentPage);
	        },
	        error:function(XMLHttpRequest, textStatus, errorThrown){
	        }
		});
		
		//下一页
		$("#nextpage").click(function(){
			if(currentPage < totalPage){
				currentPage += 1;
				$("#dqys").val(currentPage);
				//判定是否查询:否
				if(!isClicked){
					$.ajax({
						dataType:'text',
						type:'post',
				        url: "../zbshlb",
	       				data:'currentPage='+currentPage+'&gysname='+gysname+'&isGetTotalPage=0'+'&tn=' + tn,
				        success:function(result){
				        	$("#mytable").html(result);
				        },
				        error:function(){
				        }
					});
				}else{//是
					$.ajax({
						dataType:'text',
						type:'post',
				        url: "../zbshlb",
	       				data:'currentPage='+currentPage+'&gysname='+gysname+'&isGetTotalPage=0'+'&tn=' + tn,
				        success:function(result){
				        	$("#mytable").html(result);
				        },
				        error:function(){
				        }
					});
				}
			}
			if(currentPage == totalPage){
				$(this).click(function(){});
			}
				
		});
		//上一页
		$("#prepage").click(function(){
			if(currentPage > 2){
				currentPage -= 1;
				$("#dqys").val(currentPage);
				if(!isClicked){
					$.ajax({
						dataType:'text',
						type:'post',
				        url: "../zbshlb",
	        			data:'currentPage='+currentPage+'&gysname='+gysname+'&isGetTotalPage=0'+'&tn=' + tn,
				        success:function(result){
				        	$("#mytable").html(result);
				        },
				        error:function(){
				        }
					});
				}else{
					$.ajax({
						dataType:'text',
						type:'post',
				        url: "../zbshlb",
	       				data:'currentPage='+currentPage+'&gysname='+gysname+'&isGetTotalPage=0'+'&tn=' + tn,
				        success:function(result){
				        	$("#mytable").html(result);
				        },
				        error:function(){
				        }
					});
				}
				
			} 
			if(currentPage == 1){
				$(this).click(function(){});
			}
		});
		//确定跳转
		$("#qrtz").click(function(){
			if($("#dqys").val() < 1 || $("#dqys").val() > totalPage){
				alert("输入有误，请重新输入");
			}else{
				currentPage = $("#dqys").val()
				if(!isClicked){
					$.ajax({
						dataType : 'text',
						type : 'post',
						url : "../zbshlb",
						data:'currentPage='+currentPage+'&gysname='+gysname+'&isGetTotalPage=0'+'&tn=' + tn,
						success : function(result) {
							$("#mytable").html(result);
						},
						error : function() {}
					});
				}else{
					$.ajax({
						dataType:'text',
						type:'post',
				        url: "../zbshlb",
	       				data:'currentPage='+currentPage+'&gysname='+gysname+'&isGetTotalPage=0'+'&tn=' + tn,
				        success:function(result){
				        	$("#mytable").html(result);
				        },
				        error:function(){
				        }
					});
				}
			}
		});
		
		//查询按钮
		$("#searchInfo").click(function(){
			isClicked = true;
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
				url: "../zbshlb",
	       		data:'currentPage='+currentPage+'&gysname='+gysname+'&isGetTotalPage=0'+'&tn=' + tn,
				success:function(result){
					$("#mytable").html(result);
				},
				error:function(){
				}
			});
			
			//初始化总页数
			$.ajax({
				dataType:'text',
				type:'post',
				url: "../zbshlb",
	       		data:'currentPage='+currentPage+'&gysname='+gysname+'&isGetTotalPage=1'+'&tn=' + tn,
				success:function(result){
					currentPage = 1;
	        		totalPage = result;
	        		$("#zys").text("共"+result+"页");
	        		$("#dqys").val(currentPage);
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
					<div class = "grxxwz">中标审核</div>
					<div class = "xwz"></div>
					<div style = "font-family:宋体; margin-left:60px; margin-top:20px;">
						<div style = "float:left; margin-top:7px;">采购单号</div>
						<input style = "float:left; width:200px; margin-left:10px;" class="form-control" type = "text" id="tn" name="tn"/>
						<div style = "float:left; margin-top:7px; margin-left:30px;">供应商名称</div>
						<input style = "float:left; width:200px; margin-left:10px;" class="form-control" type = "text" id="gysname" name="gysname"/>
						<button style = "margin-left:30px;" class = "btn btn-default" id="searchInfo">查询</button>
					</div>
					<div id="mytable" style = " margin-top:100px; ">
						
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