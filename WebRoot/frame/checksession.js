function getsession(){
	$.ajax({
		type:"get",
		url:"../getsession",
		dataType:"text",
		success : function(result) {
			if(result == "null"){
				alert("您还未登录，请先进行登录！");
				window.location.href = "index.html";
			}
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
        	// 状态码
            alert(XMLHttpRequest.status);
            // 状态
            alert(XMLHttpRequest.readyState);
            // 错误信息   
            alert(textStatus);
        }
	});
}

