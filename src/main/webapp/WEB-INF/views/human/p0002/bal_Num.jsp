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
		//mySheet
		 initData.Cols = [
	         {Header:"NO",Type:"Seq", Align:"Center"},
	         {Header:"발령호수",Type:"Text", SaveName:"bal_NUM", Width:120, Align:"Center",Edit:0},
	         {Header:"제목", Type: "Text",SaveName:"bal_TITLE",Width:200,  Align: "Center", Edit:0},
			 {Header:"발령구분",Type:"Text",SaveName:"bal_DIV_CODE",Width:120, Align:"Center", Edit:0},
			 {Header:"발령일자",Type:"Date",SaveName:"bal_DATE",Width:120, Align:"Center", Edit:0},
			 {Header:"발령코드",Type:"Text",SaveName:"pk_BAL_CODE",Width:120, Align:"Center", Hidden:1}
	      ];
	}
	
	
	function Action_popup(code){
		switch(code) {
		case 'list':
			mySheet.DoSearch("${pageContext.request.contextPath}/human/p0002/ballyeong.do");
			break;
		}
	}
	
	function fn_Selected() {
		var ComboText = mySheet.GetCellValue(NRow, 'person_BC_DETAI_MNGEMENT_NAME'); // name
		mySheet.SetCellValue(M2_Row,'bal_DETAILS',ComboText);
		fn_EM_INFO(ComboText);
		
		mySheet.RemoveAll();
		container0 = $("#ib-container0").detach();
	}
	
	function mySheet_OnSelectCell(OldRow, OldCol, NewRow, NewCol,isDelete) {
		if(OldRow != NewRow) {NRow = NewRow;}
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
			 				<div class="row form-group">
				   				<div style="width:1%; float:left;">&nbsp</div>
								<div id='ib-container0_copy'></div>
								<div id='ib-container0'></div>
							</div>
						</div>
				
						<div class="modal-footer">
				            <button class="btn btn-outline btn-primary" onclick="fn_Selected()" data-dismiss="modal" id="close"><s:message code="common.btnOK"/></button>
						</div>
     </div>
</div>

