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
		//mySheet6
		initData.Cols = [
			//삭제 만들것.
  			{Header:"NO",Type:"Seq", Align:"Center"},
  			{Header:"",Type:"CheckBox", SaveName:"CHK", Align:"Center"},
  			{Header:"사원코드",Type:"Text", SaveName:"pk_SAWON_CODE", Width:80, Align:"Center",Edit:0},
  			{Header:"사원명", Type: "Text",SaveName:"sawon_NAME",Width:120,  Align: "Center",Edit:0},
  			{Header:"부서", Type: "Text",SaveName:"dept_NAME",Width:120,  Align: "Center",Edit:0, Hidden:1},
  			{Header:"직책", Type: "Text",SaveName:"rank_NAME",Width:120,  Align: "Center",Edit:0, Hidden:1}
  		];
	}
	
	// checkbox 선택시 pk_sawon_code를 저장 -> 저장된 sawon_code를 이용하여 조회할것... 
   	
	function fn_Selected() {
		var ChkRow = mySheet6.FindCheckedRow(1).split('|'); // 체크된 row를 배열로 저장
		for(var i=1; i<=ChkRow.length; i++){
			var pk_EDUCATION_ADD_SAWON_CODE = mySheet6.GetCellValue(ChkRow[i-1],'pk_SAWON_CODE'); // 사원코드
			var education_ADD_SAWON_NAME = mySheet6.GetCellValue(ChkRow[i-1],'sawon_NAME'); // 사원이름
			var education_ADD_DEPT = mySheet6.GetCellValue(ChkRow[i-1],'dept_NAME'); // 부서
			var education_ADD_POSITION = mySheet6.GetCellValue(ChkRow[i-1],'rank_NAME'); // 직책

			// 체크된게 있으면
			if(ChkRow != ''){
				// 만약 fk_BAL_SAWON_CODE에 없는 사원코드면 등록
				if(mySheet2.FindText('pk_EDUCATION_ADD_SAWON_CODE',pk_EDUCATION_ADD_SAWON_CODE) == -1){
					check_num = mySheet2.RowCount();
					check_num = check_num+1;
					mySheet2.DataInsert(-1);
					mySheet2.SetCellValue(check_num,'pk_EDUCATION_MANA_CODE', pk_EDUCATION_MANA_CODE);
					mySheet2.SetCellValue(check_num,'pk_EDUCATION_ADD_SAWON_CODE', pk_EDUCATION_ADD_SAWON_CODE);
					mySheet2.SetCellValue(check_num,'education_ADD_SAWON_NAME', education_ADD_SAWON_NAME);
					mySheet2.SetCellValue(check_num,'education_ADD_DEPT', education_ADD_DEPT);
					mySheet2.SetCellValue(check_num,'education_ADD_POSITION', education_ADD_POSITION);
					
				}
			}
		}
		mySheet6.RemoveAll();
		container3 = $("#ib-container3").detach();
	}
	
	function search_sawon(){
		if($('#SiteList').val() == 1){
			var dept_code= "rank_NAME=" + document.getElementById("DeptList").value;
		}else{
			var dept_code= "pk_DEPT_CODE=" + document.getElementById("DeptList").value;
		}
		mySheet6.DoSearch("${pageContext.request.contextPath}/human/p0007/sawon_search.do", dept_code);
	}
	
	// 1. 부서
	// 2. 직책
	// --------- 선택시 구분에 나오는 TEXT를 뽑아내는 코드. 
	function selectDept() {
		var SiteList = $('#SiteList').val();
	    if(SiteList==2){
	      	$.ajax({
				url : "DeptList.do",//목록을 조회 할 url
	            type : "POST",
	            dataType : "JSON",
	            success : function(data) {
					$(".1").remove();
					for (var i = 0; i < data['Data'].length; i++) {
						var option = "<option class='1' value='" + data['Data'][i].pk_DEPT_CODE + "'>"
										+ data['Data'][i].dept_NAME
										+ "</option>";
						//대상 콤보박스에 추가
						$('#DeptList').append(option);
					}
				}, error : function(jqxhr, status, error) {
	            	alert("에러");
				}
			});
		} else { // 2일때 
				$.ajax({
					url : "${contextPath}/human/p0001/ISA_c.do",//목록을 조회 할 url
					type : "POST",
					dataType : "JSON",
					success : function(data) {
		                $(".1").remove();
	                	for (var i = 0; i < data['Data'].length; i++) {
	                		var option = "<option class='1' value='" + data['Data'][i].person_BC_DETAI_MNGEMENT_NAME + "'>" 
												+ data['Data'][i].person_BC_DETAI_MNGEMENT_NAME + "</option>";
							var code_ = data['Data'][i].fk_PERSON_BC_CODE_NUM;
		                	switch(code_){
		                		case 'G4': // 채용구분
									$('#DeptList').append(option);
									break;
		                	}
		                }
	             	}, 
	             	error : function(jqxhr, status, error) { alert("에러"); }
				});
			}
		};
   
</script>

<div class="modal-dialog modal-sm" role="document">
  <div class="modal-content">
		  				<div class="modal-header">
		                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                    <h4 class="modal-title" id="myModalLabel">부서선택</h4>
		                </div>
		                
                		<div class="modal-body">
                		 <!-- /.row -->
							<form class="form-inline_3">
								<label for="SiteList">조회조건</label>
								<select id="SiteList" onchange="selectDept()">
			        		 		<option value="" selected>전체</option>
			        		 		<option value="2" >부서</option> <!-- dept_name -->
			        		 		<option value="1" >직책</option> <!-- G4 -->
			     		 		</select> &ensp; 
           
				      			<label for="DeptList">구분</label>
      							<select id="DeptList" >
         							<option  value="" selected>전체</option>
								</select>
							</form>
			 				<div class="row form-group">
				   				<div style="width:5%; float:left;">&nbsp</div>
								<div id='ib-container3_copy'></div>
								<div id='ib-container3'></div>
							</div>
						</div>
				
						<div class="modal-footer">
							<button class="btn btn-outline btn-primary" onclick="search_sawon()"><s:message code="common.btnSearch"/></button>
				            <button class="btn btn-outline btn-primary" onclick="fn_Selected()" data-dismiss="modal" id="close"><s:message code="common.btnOK"/></button>
						</div>
     </div>
</div>
