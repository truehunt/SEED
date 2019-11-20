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
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/js/dynatree/ui.dynatree.css" rel="stylesheet"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/dynatree/jquery.dynatree.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>    
	
<script>
var selectedNode = null;

$(function(){
	$("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $('#userlist > tbody > tr > td > input[name=chk]').prop("checked",true);
            // $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $('#userlist > tbody > tr > td > input[name=chk]').prop("checked", false);
            // $("input[name=chk]").prop("checked",false);
        }
    })
	
	$("#tree").dynatree({
		children: <c:out value="${treeStr}" escapeXml="false"/>,
		onActivate: TreenodeActivate
	});
    $("#tree").dynatree("getRoot").visit(function(node){
        node.expand(true);
    });
    $("#photofile").change(function(){
    	readImage(this);
    });
});

    function readImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#previewImg").attr("src", e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
function TreenodeActivate(node) {
	selectedNode = node; 
	
    if (selectedNode==null || selectedNode.data.key==0) return;
    
    $.ajax({
    	url: "adUserList",
		type:"post", 
    	data: { deptno : selectedNode.data.key }    	
    }).success(function(result){
    			$("#userlist").html(result);
		}    		
    );
}

$(document).ready(function(){
    //최상단 체크박스 클릭
    
})

function fn_addUser(){
    if (selectedNode==null || selectedNode.data.key==0) {
    	alert("<s:message code="msg.err.selectDept"/>");
    	return;
    }
	$("#deptno").val("");	
	$("#userno").val("");	
	$("#userid").val("");
    $("#userid").attr("readonly",false);
	$("#usernm").val("");
	$("#userpw").val("");
	$("#userpw2").val("");
	$('input:radio[name="userrole"][value="U"]').prop("checked", true);
	$("#pwDiv").show("");
	$("#photofile").val("");
    $("#previewImg").attr("src","");
	
	$("#myModal").modal("show");	
}

function fn_addUserSave(){
	if ( ! chkInputValue("#userid", "<s:message code="common.id"/>")) return false;
	if ( ! chkInputValue("#usernm", "<s:message code="common.name"/>")) return false;
	if ( $("#userno").val() === ""){
		if ( ! chkInputValue("#userpw", "<s:message code="common.password"/>")) return false;
		if ( ! chkInputValue("#userpw2", "<s:message code="common.passwordRe"/>")) return false;
		if ( $("#userpw").val() !== $("#userpw2").val()){
			alert("<s:message code="msg.err.noMatchPW"/>");
			return false;
		}
	}
	
	var file = $("input[type=file]")[0].files[0];
	if (file) {
		var formData = new FormData();
		formData.append("userno", $("#userno").val());
		formData.append("deptno", selectedNode.data.key);
		formData.append("userid", $("#userid").val());
		formData.append("usernm", $("#usernm").val());
		formData.append("userpw", $("#userpw").val());
		formData.append("userrole", $("#userrole").val());
		formData.append("photofile", file); 
		$.ajax({
			url: "adUserSave",
		    contentType: false,
		    processData: false,		
			type:"post", 
			data : formData,
		}).done(saveResult);
	} else{
		$("#deptno").val(selectedNode.data.key);	
		var formData = $("#form1").serialize();
		$.ajax({
			url: "adUserSave",
			type:"post", 
			data : formData,
		}).done(saveResult);
	}
	$("#myModal").modal("hide");	
}

function saveResult(result){
	if (result==="") {
		alert("<s:message code="msg.err.usedID"/>");
	} else{
		$("#userlist").html(result);
		alert("<s:message code="msg.boardSave"/>");
	}	
}

function fn_chkUserid(){
	if ( ! chkInputValue("#userid", "<s:message code="common.id"/>")) return false;
	$.ajax({
		url: "chkUserid", 
		type:"post", 
		data : {userid: $("#userid").val()},
		success: function(result){
			if (result) {
				alert("<s:message code="msg.usedID"/>");
			} else{
				alert("<s:message code="msg.NoUsedID"/>");
			}
		}
	})		
}

function fn_UserRead(userno){
	$.ajax({
		url: "adUserRead", 
		type:"post", 
		data : {userno:userno},
		success: function(result){
			$("#deptno").val(result.deptno);	
			$("#userno").val(result.userno);
			$("#userid").val(result.userid);	
		    $("#userid").attr("readonly",true);
			$("#usernm").val(result.usernm);
			$('input:radio[name="userrole"][value="' + result.userrole + '"]').prop("checked", true);
			$("#pwDiv").hide("");
			$("#photofile").val("");
			if (result.photo){
		    	$("#previewImg").attr("src","fileDownload?downname="+result.photo);
			} else {
		    	$("#previewImg").attr("src","");
			}

			$("#myModal").modal("show");	
		}
	})		
}

function fn_UserDelete(userno){
    if(!confirm("<s:message code="ask.Delete"/>")) return;

	$.ajax({
		url: "adUserDelete", 
		type:"post", 
		data : {userno:userno, deptno:selectedNode.data.key},
		success: function(result){
			$("#userlist").html(result);
			alert("<s:message code="msg.boardDelete"/>");
		}
	})		
}

</script>    
</head>

<body>

    <div id="wrapper">
		
        <div id="page-wrapper" style="margin: 0px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-user fa-fw"></i> <s:message code="main.enroll5"/></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <div class="row">
            	<!-- 부서리스트 -->
            	<div class="col-lg-3" >
	            	<div class="panel panel-default" >
	            		<div class="panel-heading">
	                            <s:message code="common.deptList"/>
	                    </div>
	                    <div style="max-height:400px; overflow:auto;" >
					    	<div id="tree">
							</div>
						</div>
					</div>
                </div> 
                <!-- 유저리스트 -->
            	<div class="col-lg-6" >
	            	<div class="panel panel-default" >
	            		<div class="panel-heading">
	            			<s:message code="common.userList"/>
	                    </div>
	                    <div class="panel-body" id="userlist">
					    </div>    
					</div>
				</div>
				<!-- 권한설정 부분 -->
				<div class="col-lg-3" >
					<div class="panel panel-default" >
	            		<div class="panel-heading">
	            			권한설정
	                    </div>
	                    <div class="modal-body">
		                	<form id="form1" name="form1">
								<input type="hidden" name="userno" id="userno"> 
								<input type="hidden" name="deptno" id="deptno"> 
		                    	<div class="row form-group">
		                            <div class="col-lg-1"></div>
		                            <label class="col-lg-2">권한</label>
		                            <div class="col-lg-8 checkbox-inline">
										 	<label><input name="userrole" id="userrole" type="radio" checked="checked" value="C">사원</label>
										 	<label><input name="userrole" id="userrole" type="radio" value="B">부서장</label>
										 	<label><input name="userrole" id="userrole" type="radio" value="A">관리자</label>
		                            </div>
		                        </div>
		                	</form>        
					    </div>
					    <div class="modal-footer">
		                    <button type="button" class="btn btn-primary" onclick="fn_addUserSave()"><s:message code="common.btnSave"/></button>
		                </div>    
					</div>
				</div>	
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
</body>

</html>
