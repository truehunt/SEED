<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

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
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">

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
	<script src="${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>    

<script>

function fn_formSubmit(){
	if ( ! chkInputValue("#CLASSNO", "<s:message code="common.classno"/>")) return false;
	if ( ! chkInputValue("#CODECD", "<s:message code="common.codecd"/>")) return false;
	if ( ! chkInputValue("#CODENM", "<s:message code="common.codenm"/>")) return false;
	
	$("#form1").submit();
} 
</script>
    
</head>

<body>

    <div id="wrapper">

        <div id="page-wrapper" style="margin: 0px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-gear fa-fw"></i> <s:message code="common.codecd"/></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <div class="row">
            	<form id="form1" name="form1" role="form" action="adCodeSave" method="post" onsubmit="return fn_formSubmit();" >
            		<input type="hidden" name="codeFormType" value="<c:out value="${codeFormType}"/>">
					<div class="panel panel-default">
	                    <div class="panel-body">
	                    	<div class="row form-group">
	                            <label class="col-lg-2"><s:message code="common.classno"/></label>
	                            <div class="col-lg-1">
	                            	<input type="text" class="form-control" id="CLASSNO" name="CLASSNO" maxlength="10" 
	                            	value="<c:out value="${codeInfo.CLASSNO}"/>" <c:if test="${codeFormType=='U'}">readonly</c:if>>
	                            </div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-2"><s:message code="common.codecd"/></label>
	                            <div class="col-lg-1">
	                            	<input type="text" class="form-control" id="CODECD" name="CODECD" maxlength="10" 
	                            	value="<c:out value="${codeInfo.CODECD}"/>" <c:if test="${codeFormType=='U'}">readonly</c:if>>
	                            </div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-2"><s:message code="common.codenm"/></label>
	                            <div class="col-lg-5">
	                            	<input type="text" class="form-control" id="CODENM" name="CODENM" maxlength="30" value="<c:out value="${codeInfo.CODENM}"/>">
	                            </div>
	                        </div>
	                    </div>
	                </div>
			        <button class="btn btn-outline btn-primary"><s:message code="common.btnSave"/></button>
				</form>	
                
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</body>

</html>
