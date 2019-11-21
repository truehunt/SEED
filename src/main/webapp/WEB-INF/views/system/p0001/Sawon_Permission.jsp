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
	
	$("#tree").dynatree({
		children: <c:out value="${treeStr}" escapeXml="false"/>,
		onActivate: TreenodeActivate
	});
    $("#tree").dynatree("getRoot").visit(function(node){
        node.expand(true);
    });
});

function TreenodeActivate(node) {
	selectedNode = node; 
	
    if (selectedNode==null || selectedNode.data.key==0) return;
    
    $.ajax({
    	url: "adUserList",
		type:"post", 
    	data: { deptno : selectedNode.data.key }    	
    }).success(function(result){
    			$("#userlist").html(result);
    			$("#deptno").val(selectedNode.data.key);
    			
    			//부서리스트를 불러온 후 성공하면, 체크박스 전체선택 이벤트가 활성화되도록함.
    			$("#checkall").click(function(){
    		        //클릭되었으면
    		        var arrayParam = new Array();
    		        
    		        if($("#checkall").prop("checked")){
    		            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
    		            $("input[name=chk]").prop("checked",true);
    		            arrayParam.push($(this).val());
    		            //클릭이 안되있으면
    		        }else{
    		            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
    		            $("input[name=chk]").prop("checked",false);
    		            arrayParam.pop($(this).val());
    		        }
    		        
    		        var arrayParam = $('input:checkbox[type=checkbox]:checked').map(function () {
    		            return this.value;
    		        }).get();
    		        
    		        $('#hiddenValue').val(arrayParam);
    		    });
    			
    			//부서리스트 불러온 후, 체크박스 개별 선택 이벤트
    			$("input[name=chk]").click(function(){
    				var arrayParam = new Array();
    				
    		        //개별선택 - 값 넣기
    		        if($("input[name=chk]").prop("checked")){
    		        	arrayParam.push($(this).val());
    		        }else{ //개별선택 - 값 빼기
    		        	arrayParam.pop($(this).val());
    		        }
    		       	
    		        var arrayParam = $('input:checkbox[type=checkbox]:checked').map(function () {
    		            return this.value;
    		        }).get();
    		        
    		        $('#hiddenValue').val(arrayParam);
    			});
    			
		}    		
    );
}

function fn_SawonPermissionsUpdate(){
	// if (!$("input[name=chk]").is(":checked"), "권한 변경을 할 사원을 선택해주세요!") return false;
	
		var PK_SAWON_CODE = $("#hiddenValue").val();
		var SAWON_VIEW_PERMISSION = $('input[name="userrole"]:checked').val();
		var FK_DEPT_CODE = $("#deptno").val();
		$.ajax({
			url: "adSawonPermissionsUpdate",
			type:"post", 
			data : {PK_SAWON_CODE : PK_SAWON_CODE,
				SAWON_VIEW_PERMISSION : SAWON_VIEW_PERMISSION,
				FK_DEPT_CODE : FK_DEPT_CODE
			}
		}).done(saveResult);
}

function saveResult(result){
	if (result==="") {
		alert("<s:message code="msg.err.usedID"/>");
	} else{
		$("#userlist").html(result);
		alert("<s:message code="msg.boardSave"/>");
	}	
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
					    <input type="hidden" name="hiddenValue" id="hiddenValue" value=""/>    
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
								<input type="hidden" name="deptno" id="deptno" value=""> 
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
		                    <button type="button" class="btn btn-primary" onclick="fn_SawonPermissionsUpdate()"><s:message code="common.btnSave"/></button>
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
