<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibleaders.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibsheet.js"></script>
	
	
	<link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/js/dynatree/ui.dynatree.css" rel="stylesheet"/> 

     <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/dynatree/jquery.dynatree.js"></script>

<script type="text/javascript">
	//시트 높이 계산용
	var pageheightoffset = 200;
	
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
			// MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
			// Align : data 정렬값.
			// keyfield : keyfield값 필수값 체크시 필요(미입력시 추가안됨.)
			// MultiLineText:1  : 하나의 셀에 여러값을 넣을수 있음(shift+enter)
			// Wrap:1 : 데이터
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
			{Header:"사원코드",Type:"Text",SaveName:"pk_SAWON_CODE",MinWidth:80,Align:"Center", KeyField:1},
			{Header:"사원명",Type:"Text",SaveName:"sawon_NAME",MinWidth:80, KeyField:1},			
			{Header:"사원명(영문)",Type:"Text",SaveName:"sawon_ENG_NAME",MinWidth:150},
			{Header:"부서코드",Type:"Text",SaveName:"fk_DEPT_CODE",MinWidth:150},
			{Header:"부서명",Type:"Text",SaveName:"fk_DEPT_NAME",MinWidth:100},
			{Header:"입사일",Type:"Date",SaveName:"sawon_JOIN_DATE",MinWidth:150, KeyField:1, format:"Ymd"},
			{Header:"사용자여부",Type:"Combo",SaveName:"sawon_USER_STATUS",MinWidth:60, KeyField:1, ComboText:"Y|N", ComboCode:"Y|N"},
			{Header:"이메일주소",Type:"Text",SaveName:"sawon_EMAIL",MinWidth:150, KeyField:1},
		];   
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
		
		// ibsheet 버전 확인
		//alert(mySheet.Version()); 
		 
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
			    var param = FormQueryStringEnc(document.frm);
				mySheet.DoSearch("adSawon_Enroll_searchList", param);
				//mySheet.DoSearch("transaction_data2.json");
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				$('#SAWON_NAME').val('');
				$('#SelectDeptCode').val('');
				$('#SelectDeptName').val('');
				break;
			case "save": // 저장
				//var tempStr = mySheet.GetSaveString();
				//alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet.DoSave("adSawon_Enroll_saveData");
				break;			
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();
				break;
		}
	}
	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
      
	}
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code,msg){
		if(msg != ""){
			alert(msg);	
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}	
	}
	
	// 부서선택
	function fn_DeptSelect(){
	    $.ajax({
	        url: "sample_popup.jsp",
	        type: "post"        
	    }).success(function(result){
	                $("#popupDept").html(result);
	    });
	    $("#popupDept").modal("show");
	}
	
	// 팝업창에서 선택된 부서코드, 부서명 값 넣기
	function fn_selectDept(deptno, deptnm) {
	    $("#SelectDeptCode").val(deptno);
	    $("#SelectDeptName").val(deptnm);
	    
	    $("#popupDept").modal("hide");
	}
	
</script>
</head>
<body onload="LoadPage()">

        <div id="page-wrapper" style="margin: 0px;">
        	<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-folder fa-fw"></i> <s:message code="main.enroll4"/></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
			  <div class="main_content" style="width:1500px;">
			    
			    <div class="ib_function float_left">
			      <button class="btn btn-outline btn-primary" onclick="fn_DeptSelect()">부서선택</button>
				  <button type="button" class="btn btn-primary" onclick="doAction('reload')">초기화</button>
				  <button type="button" class="btn btn-primary" onclick="doAction('insert')">추가</button>
				  <button class="btn btn-outline btn-primary" onclick="doAction('search')">조회</button>
				  <button class="btn btn-outline btn-primary" onclick="doAction('save')">저장</button>
				</div>
				<br><br><br>
			    <div class="exp_product">
			      <form name='frm'>
			         사원명검색:<input type='text' id="SAWON_NAME" name="SAWON_NAME" />
			         부서코드:<input type="text" name="SelectDeptCode" id="SelectDeptCode" readonly />
			         부서명:<input type="text" name="SelectDeptName" id="SelectDeptName" readonly />  
			      </form>
			      
			    </div>
			    <br>
			
				<div class="clear hidden"></div>
				<div class="ib_product_1"><script>createIBSheet("mySheet", "100%", "500px");</script></div>
			  </div>
        </div>
        <!-- /#page-wrapper -->
        <div id="popupDept" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" 
    aria-labelledby="myLargeModalLabel"></div> 

</body>
</html>