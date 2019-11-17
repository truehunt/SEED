<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><s:message code="common.pageTitle"/></title>
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

     <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>    
<script>

$(function(){
	<c:if test="${save eq 'OK'}">
		alert("저장되었습니다.");
	</c:if>
	
    $("#photofile").change(function(){
    	readImage(this);
    });
});

function readImage(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#previewImg').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function fn_formSubmit(){ // 저장 및 업데이트
	// if ( ! chkInputValue("#usernm", "<s:message code="common.name"/>")) return false;
	
	$("#form1").submit();
} 
function fn_formSubmit2(IMAGENO){ // 삭제
	if (confirm("삭제 하시겠습니까?(삭제시 복구되지 않습니다!!!)")) {
		$.ajax({
	        url: "signImageDelete",
	        type:"POST", 
	        data: { IMAGENO : IMAGENO,
	        	},
			success: function(result){
				alert(result);
			}
	    })
		
	}
}

</script>    
</head>

<body>

    <div id="wrapper">
		
        <div id="page-wrapper" style="margin: 0px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-edit fa-fw"></i> <s:message code="main.signImage"/></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <div class="row">
            	<div class="col-lg-7">
					<form id="form1" name="form1" role="form" action="imageSave" method="post" enctype="multipart/form-data"  >
                   		<div class="row form-group">
                           <div class="col-lg-1"></div>
                           <label class="col-lg-2">유의사항</label>
                           <div class="col-lg-5">
                           		이미지 권장 크기는 가로*세로<br>
                           		확장자는 ~<br>
                           		이미지명은~
                           </div>
                       	</div>
                   		<div class="row form-group">
                           <div class="col-lg-1"></div>
                           <div class="col-lg-2"><label>결재이미지</label></div>
                           <div class="col-sm-3">
                           	<img id="previewImg" style="width:100%; height: 120px; max-width: 100px;" src="fileDownload?downname=<c:out value="${signImageInfo.photo}"/>">
                           </div>
                           <div class="col-lg-5">
							<input type="file" name="photofile" id="photofile" accept='image/*'/>
                           </div>
                       	</div>  
					</form>
				</div>	  
				            
            </div>
            <button type="button" class="btn btn-primary" onclick="fn_formSubmit()"><s:message code="common.btnSave"/></button>
            <button type="button" class="btn btn-primary" onclick="fn_formSubmit2(<c:out value="${signImageInfo.IMAGENO}"/>)"><s:message code="common.btnDelete"/></button>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
</body>

</html>
