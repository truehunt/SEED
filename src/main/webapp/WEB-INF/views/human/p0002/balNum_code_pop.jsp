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
		//mySheet3
		initData.Cols = [
  			{Header:"발령호수",Type:"Text", SaveName:"bal_NUM", Width:80, Align:"Center",Edit:0},
  			{Header:"발령구분", Type: "Text",SaveName:"bal_DIV_CODE",Width:120,  Align: "Center",Edit:0},
  			{Header:"발령일", Type: "Text",SaveName:"bal_DATE",Width:120,  Align: "Center",Edit:0},
  			{Header:"발령제목", Type: "Text",SaveName:"bal_TITLE",Width:120,  Align: "Center",Edit:0, Hidden:1}
  		];
	}
	
	
	function Action_popup(code){
		switch(code) {
		case 'list_sawon':
			mySheet3.DoSearch("${pageContext.request.contextPath}/human/p0002/Sawon_BalNum.do");
			break;
		}
	}
	
	function fn_Selected() {
		ballyeong_Num = mySheet3.GetCellValue(NRow, 'bal_NUM');
		selected = mySheet3.GetCellValue(NRow, 'bal_DIV_CODE');
		// 발령호수, 발령구분을 ajax로 보내서 조회
		selectDIV(ballyeong_Num, selected);
		$('#bal_NUMBER').val(ballyeong_Num);
		
		mySheet3.RemoveAll();
		container2 = $("#ib-container2").detach();
	}
	
	function mySheet3_OnSelectCell(OldRow, OldCol, NewRow, NewCol,isDelete) {
		if(OldRow != NewRow) {NRow = NewRow;}
		
	} 
	
	
	// 조회조건 
	function bal_Condition() {
		var SiteList = $('#SiteList').val();
		if(SiteList == 1){
			var param = "bal_NUM=" + document.getElementById("Condition").value;
		}else if(SiteList == 2){
			var param = "bal_DIV_CODE=" + document.getElementById("Condition").value;
		}else if(SiteList == 3){
			var param = "bal_DATE=" + document.getElementById("Condition").value;
		}
		mySheet3.DoSearch("${pageContext.request.contextPath}/human/p0002/Sawon_BalNum.do", param);
	};
   
</script>

<div class="modal-dialog modal-md" role="document">
  <div class="modal-content">
		  				<div class="modal-header">
		                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                    <h4 class="modal-title" id="myModalLabel">발령선택</h4>
		                </div>
		                
                		<div class="modal-body">
                		 <!-- /.row -->
							<form class="form-inline_3">
								<label for="SiteList">조회조건</label>
								<select id="SiteList">
			        		 		<option value="" selected>전체</option>
			        		 		<option value="1">발령호수</option>
			        		 		<option value="2">발령구분</option>
			        		 		<option value="3">발령일</option>
			     		 		</select> &ensp; 
           
				      			<input type="text" id="Condition">
							</form>
			 				<div class="row form-group">
				   				<div style="width:5%; float:left;">&nbsp</div>
								<div id='ib-container2_copy'></div>
								<div id='ib-container2'></div>
							</div>
						</div>
				
						<div class="modal-footer">
							<button class="btn btn-outline btn-primary" onclick="bal_Condition()"><s:message code="common.btnSearch"/></button>
				            <button class="btn btn-outline btn-primary" onclick="fn_Selected()" data-dismiss="modal" id="close"><s:message code="common.btnOK"/></button>
						</div>
     </div>
</div>

