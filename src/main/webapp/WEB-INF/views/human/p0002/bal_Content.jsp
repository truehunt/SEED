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
		//mySheet4
		initData.Cols = [
			{Header:"NO",Type:"Seq", Align:"Center"},
  			{Header:"코드",Type:"Text", SaveName:"pk_PERSON_BC_DETAI_CODE_NUM", Width:80, Align:"Center",Edit:0},
  			{Header:"발령내역명", Type: "Text",SaveName:"person_BC_DETAI_MNGEMENT_NAME",Width:120,  Align: "Center",Edit:0},
  		];
	}
	
	
	function Action_popup(code){
		switch(code) {
		case 'bal_Content':
			mySheet4.DoSearch("${pageContext.request.contextPath}/human/p0002/BalContent.do");
			break;
		}
	}
	
	function fn_Selected() {
		var ComboText = mySheet4.GetCellValue(NRow, 'person_BC_DETAI_MNGEMENT_NAME'); // name
		mySheet2.SetCellValue(M2_Row,'bal_DETAILS',ComboText);
		fn_EM_INFO(ComboText);
		
		mySheet4.RemoveAll();
		container3 = $("#ib-container3").detach();
	}
	
	function mySheet4_OnSelectCell(OldRow, OldCol, NewRow, NewCol,isDelete) {
		if(OldRow != NewRow) {NRow = NewRow;}
	} 
	
	
</script>

<div class="modal-dialog modal-sm" role="document">
  <div class="modal-content">
		  				<div class="modal-header">
		                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                    <h4 class="modal-title" id="myModalLabel">부서선택</h4>
		                </div>
		                
                		<div class="modal-body">
                		 <!-- /.row -->
			 				<div class="row form-group">
				   				<div style="width:5%; float:left;">&nbsp</div>
								<div id='ib-container3_copy'></div>
								<div id='ib-container3'></div>
							</div>
						</div>
				
						<div class="modal-footer">
				            <button class="btn btn-outline btn-primary" onclick="fn_Selected()" data-dismiss="modal" id="close"><s:message code="common.btnOK"/></button>
						</div>
     </div>
</div>

