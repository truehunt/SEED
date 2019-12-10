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

    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/dynatree/jquery.dynatree.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>   

<script>
var selectedNode = null;
	function Loading(){
		initData = {};
		//mySheet5
		initData.Cols = [
  			{Header:"NO",Type:"Seq", Align:"Center"},
  			{Header:"사원코드",Type:"Text", SaveName:"pk_SAWON_CODE", Width:80, Align:"Center",Edit:1},
  			{Header:"사원명", Type: "Text",SaveName:"sawon_NAME",Width:120,  Align: "Center",Edit:1},
  			{Header:"부서명", Type: "Text",SaveName:"dept_NAME",Width:120,  Align: "Center",Edit:1},
  			{Header:"사업장명", Type: "Text",SaveName:"workplace_NAME",Width:120,  Align: "Center",Edit:1}
  		];
		
	}
	
   	function mySheet5_OnClick (Row, Col, Value, CellX, CellY, CellW, CellH, rowType){
   		sawon_code = mySheet5.GetCellValue(Row,'pk_SAWON_CODE');
   		sawon_name = mySheet5.GetCellValue(Row,'sawon_NAME');
   		sawon_dept = mySheet5.GetCellValue(Row,'dept_NAME');
   		sawon_workplace = mySheet5.GetCellValue(Row,'workplace_NAME');
   	}
   	
	function Action_popup(code){
		switch(code) {
		case 'list_sawon':
			mySheet5.DoSearch("${pageContext.request.contextPath}/human/p0002/Sawon.do");
			break;

		}
	}


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
    		url: "${pageContext.request.contextPath}/adDepartmentRead",
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
		container2 = $("#ib-container2").detach();
		fn_sawon(sawon_code, sawon_name, sawon_dept, sawon_workplace);
	}
	
	function search_sawon(){
		var deptno = "deptno=" + document.getElementById("deptno").value;
		mySheet5.DoSearch("${pageContext.request.contextPath}/human/p0002/Sawon.do", deptno);
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
			            		
			            	<div class="row form-group" style="solid;display:none;"> <!-- 숨김 -->
								<label class="col-lg-3" >부서코드</label>
									<div class="col-lg-9" >
										<input name="deptno" id="deptno" value=""> 
									</div>
							</div>
						    <div class="row form-group" style="solid;display:none;">
								<label class="col-lg-3" >부서명</label>
								<div class="col-lg-9" >
									<input name="deptnm" id="deptnm" value="">
								</div>
							</div>
			 				<div class="row form-group">
				   				<div style="width:5%; float:left;">&nbsp</div>
								<div id='ib-container2_copy'></div>
								<div id='ib-container2'></div>
							</div>
						</div>
				
						<div class="modal-footer">
							<button class="btn btn-outline btn-primary" onclick="search_sawon()"><s:message code="common.btnSearch"/></button>
				            <button class="btn btn-outline btn-primary" onclick="fn_DeptSelected()" data-dismiss="modal" id="close"><s:message code="common.btnOK"/></button>
						</div>
     </div>
</div>
