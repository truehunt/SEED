<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
function fn_formSubmit(){
	if ( ! chkInputValue("#PK_SAWON_CODE", "<s:message code="common.id"/>")) return false;
	if ( ! chkInputValue("#SAWON_PASSWORD", "<s:message code="common.password"/>")) return false;
	
	$("#form1").submit();
}

function fn_FindPassword(){
	$("#myModal").modal("show");
}

function fn_chkUserid(){
	if ( ! chkInputValue("#PK_SAWON_CODE2", "사번")) return false;
	if ( ! chkInputValue("#SAWON_EMAIL", "이메일주소")) return false;
	var email = $("#SAWON_EMAIL").val();
	if ( ! isValidEmail(email)) return alert("올바른 이메일 형식이 아닙니다.");
	
	$.ajax({
		url: "findPw", 
		type:"post", 
		data : {
				PK_SAWON_CODE: $("#PK_SAWON_CODE2").val(),
				SAWON_EMAIL: $("#SAWON_EMAIL").val()
		},
		success: function(result){
			alert(result);
		}

	})		
}

isValidEmail = function (email) { 
	
	if (email.lastIndexOf(' ') > 0) {
		return false;
	}

	var regText = /^([\.0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,3}$/;
	return regText.test(email);
}



</script>

</head>

<body>

	<div align=center><img src="/SEED/resources/image/SEED.png" style="position:absoulte; margin-top:150px; margin-left: auto; margin-right: auto;"/></div>

    <div class="container2">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><s:message code="login.login"/></h3>
                         <a href="${pageContext.request.contextPath }/changeLanguage?lang=ko">한국어</a>
					  	 <a href="${pageContext.request.contextPath }/changeLanguage?lang=en">English</a> 
                    </div>
                    <div class="panel-body">
                        <form role="form" action="memberLoginChk" method="post" id="form1" name="form1">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="<s:message code="login.id"/>" name="PK_SAWON_CODE" id="PK_SAWON_CODE" type="text" autofocus value="<c:out value="${PK_SAWON_CODE}"/>">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="<s:message code="login.pw"/>" name="SAWON_PASSWORD" id="SAWON_PASSWORD" type="password" value="" onkeydown="if(event.keyCode == 13) { fn_formSubmit();}">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Y"  <c:if test='${PK_SAWON_CODE != null && PK_SAWON_CODE != ""}'>checked</c:if>><s:message code="login.check"/>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        
                                    </label>
                                </div>
                                <div class="password">
                                    	<a href="#" onclick="fn_FindPassword()"><s:message code="login.findpw"/></a>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="#" class="btn btn-lg btn-success btn-block" onclick="fn_formSubmit()"><s:message code="login.btn"/></a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"><s:message code="login.findpw"/></h4>
                </div>
                <div class="modal-body">
                
		                    	<div class="row form-group">
		                    		<div class="col-lg-1"></div>
		                            <label class="col-lg-2"><s:message code="login.id"/></label>
		                            <div class="col-lg-5">
		                            	<input type="text" class="form-control" id="PK_SAWON_CODE2" name="PK_SAWON_CODE2" placeholder="<s:message code="login.id"/>" maxlength="20">
		                            </div>
		                            <div class="col-lg-4">
					                    <button id="btn-signup" type="submit" class="btn btn-warning" onclick="fn_chkUserid()"><s:message code="login.email"/></button>
		                            </div>
		                        </div>
		                        
								<div class="row form-group">		                            
		                            <div class="col-lg-1"></div>
		                            <label class="col-lg-2"><s:message code="login.emailform"/></label>
		                            <div class="col-lg-8">
		                            	<input type="text" class="form-control" id="SAWON_EMAIL" name="SAWON_EMAIL" placeholder="<s:message code="login.emailform"/>" maxlength="50">
		                            </div>
	                            </div>
                                
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close"><s:message code="common.btnClose"/></button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    
</body>

</html>