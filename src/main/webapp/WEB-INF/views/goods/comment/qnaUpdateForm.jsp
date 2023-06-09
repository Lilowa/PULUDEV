<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>QNA 수정</title>
	<!-- <link rel="stylesheet" href="resources/css/ui.css" type="text/css" /> -->
  
    <!-- Bootstrap Core CSS -->
    <link href="/resources/sbadmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/sbadmin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/sbadmin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/sbadmin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<style>
	#QNA_CONTENTS {
		height: 150px;
	}
</style>

<script type="text/javascript">
	function fn_qnaUpdate(){
		var params = $("#qnaUpdateBtn").serialize();
		
		if (confirm("수정 하겠습니까?") == true) {
		$.ajax(
		{
			url : "<c:url value='/qnaUpdate.pulu'/>",
			data : params,
			type : "post",
			success : function(xh)
					{	
						opener.parent.location.reload();
						window.close();
					}
		});
		}
	}
	
	/****** 줄바꿈 ***********/
	$(document).ready(function(){
 		let str = document.getElementById("QNA_CONTENTS").value;
		str = str.toString().replaceAll("<br/>", "\r\n");
		str = str.toString().replaceAll("</br>", "\r\n");
		document.getElementById("QNA_CONTENTS").value = str;
	})
</script>

<body onload="">
 <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
					<h1 class="page-header">QNA 수정</h1>
				
					<form role="form" action="qnaUpdate.pulu" id="qnaUpdateBtn" name="qnaUpdateBtn" method="post">
						<input type="hidden" id="QNA_GOODS_NUM" name="QNA_GOODS_NUM" value="${qnaMap.QNA_GOODS_NUM}"/>
						<input type="hidden" id="QNA_NUM" name="QNA_NUM" value="${qnaMap.QNA_NUM}"/>
					
						<div class="form-group">
							<label>아이디</label> 
								<input class="form-control" type="text" value="${qnaMap.QNA_ID }" name="QNA_ID" readonly>
						</div>
						<div class="form-group">
							<label>제목</label> 
								<input class="form-control" type="text" value="${qnaMap.QNA_SUBJECT }" name="QNA_SUBJECT" readonly>
						</div>
						<div class="form-group">
							<label>내용</label> 
								<textarea class="form-control" name="QNA_CONTENTS" id="QNA_CONTENTS" style="">${qnaMap.QNA_CONTENTS }</textarea> 
						</div>
						
						<button type="button" class="btn btn-primary" style="background-color: #006F3E;" onclick="window.close();">닫기</button>
						<input type="button" class="btn btn-primary" style="background-color: #006F3E;" value="수정하기" onclick="fn_qnaUpdate()">
					
					</form></br></br></br>
				   </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
  
</body>
</html>
