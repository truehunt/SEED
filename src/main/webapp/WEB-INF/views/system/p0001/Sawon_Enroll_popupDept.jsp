<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

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
	fn_groupNew();
});
function TreenodeActivate(node) {
	selectedNode = node;
	
    if (selectedNode==null || selectedNode.data.key==0) return;
    $.ajax({
    	url: "adDepartmentRead",
    	cache: false,
    	data: { deptno : selectedNode.data.key }    	
    }).done(receiveData);
}

function receiveData(data){
    $("#deptno").val(data.pk_DEPT_CODE);
    $("#deptnm").val(data.dept_NAME);
}

function fn_groupNew(){
    $("#deptno").val("");
    $("#deptnm").val("");
}

function fn_DeptSelected() {
	
	var deptno = $("#deptno").val();
	var deptnm = $("#deptnm").val();
	
	fn_selectDept(deptno, deptnm);
}



</script>    
            
<div class="modal-dialog modal-md" role="document">
  <div class="modal-content">
		  				<div class="modal-header">
		                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                    <h4 class="modal-title" id="myModalLabel">부서선택</h4>
		                </div>
                
                		<div class="modal-body">
				            <!-- /.row -->
				                    <div style="max-height:400px;" >
								    	<div id="tree">
										</div>
									</div>
			            		
			            				<div class="row form-group">
							            		<label class="col-lg-3" >부서코드</label>
								            		<div class="col-lg-9" >
														<input name="deptno" id="deptno" value=""> 
													</div>
										</div>
						            	<div class="row form-group">
							            		<label class="col-lg-3" >부서명</label>
									            	<div class="col-lg-9" >
										 				<input name="deptnm" id="deptnm" value="">
								            		</div>
										</div>
										</div>
				
						<div class="modal-footer">
				            	<button class="btn btn-outline btn-primary" onclick="fn_DeptSelected()" data-dismiss="modal" id="close"><s:message code="common.btnOK"/></button>
						</div>
     </div>
</div>
    <!-- /.row -->
