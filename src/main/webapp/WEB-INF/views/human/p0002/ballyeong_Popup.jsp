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
	function Loading(){
		ballyeong_Check_NUMBER = 0;
		initData = {};
		//mySheet4
		initData.Cols = [
  			{Header:"NO",Type:"Seq", Align:"Center"},
  			{Header:"코드",Type:"Text", SaveName:"pk_PERSON_BC_DETAI_CODE_NUM", Width:120, Align:"Center",Edit:1},
  			{Header:"명", Type: "Text",SaveName:"person_BC_DETAI_MNGEMENT_NAME",Width:200,  Align: "Center",Edit:1}
  		];
	}
	
   	var selectedNode = null;
   
   	function mySheet4_OnClick (Row, Col, Value, CellX, CellY, CellW, CellH, rowType){
   		codename = mySheet4.GetCellValue(Row,'person_BC_DETAI_MNGEMENT_NAME');
   	}
   	
	function Action_popup(code){
		switch(code) {
		case 'list':
			mySheet4.DoSearch("${pageContext.request.contextPath}/human/p0002/code.do");
			break;
		case 'list_After':
			// fn_EM_INFO(ComboCode)에서 ComboCode를 가져옴
			ballyeong_Check_NUMBER++;
			var Num_code = "Num_code=" + proChk;
			mySheet5.DoSearch("${pageContext.request.contextPath}/human/p0002/BalAfter_INFO.do",Num_code);
			break;
		}
	}

	function fn_DeptSelected() {
		if(ballyeong_Check_NUMBER == 0){
			container1 = $("#ib-container1").detach();
			var codenm = codename;
			fn_selectDept(codenm);
		}else{
			var bal_AF_NM = mySheet5.GetCellValue(N5Row, 'person_BC_DETAI_MNGEMENT_NAME');
			mySheet2.SetCellValue(M2_Row,'bal_AFT_INFO',bal_AF_NM);
			container1 = $("#ib-container1").detach();
		}
	}  
	function mySheet5_OnSelectCell(OldRow, OldCol, NewRow, NewCol,isDelete) {
		if(OldRow != NewRow) {N5Row = NewRow;}
	} 
   
</script>

<div class="modal-dialog modal-md" role="document">
  <div class="modal-content">
		  				<div class="modal-header">
		                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                    <h4 class="modal-title" id="myModalLabel">코드도움</h4>
		                </div>
		                
                		<div class="modal-body">
			 				<div class="row form-group">
				   				<div style="width:20%; float:left;">&nbsp</div>
								<div id='ib-container1_copy'></div>
								<div id='ib-container1'></div>
							</div>
					</div>
				
						<div class="modal-footer">
				            	<button class="btn btn-outline btn-primary" onclick="fn_DeptSelected()" data-dismiss="modal" id="close"><s:message code="common.btnOK"/></button>
						</div>
     </div>
</div>
