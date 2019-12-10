<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibtab.js"></script>
<script src="${contextPath}/resources/ibsheet/ibtabinfo.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${contextPath}/resources/css/ibtab-style.min.css">

<link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/js/datepicker/datepicker.css" rel="stylesheet" type="text/css">

 	<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/dynatree/jquery.dynatree.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/daterangepicker/daterangepicker.js"></script>

<script>
   var pageheightoffset = 200;
   
   /*Sheet 기본 설정 */
   function LoadPage() {
	   
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1 };
      initData.Cols = [
    	 {Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
         {Header:"NO",Type:"Seq", Align:"Center"},
         {Header:"발령호수",Type:"Text", SaveName:"bal_NUM", Width:120, Align:"Center",Edit:1,HeaderCheck:1},
         {Header:"제목", Type: "Text",SaveName:"bal_TITLE",Width:200,  Align: "Center"},
		 {Header:"발령구분",Type:"Text",SaveName:"bal_DIV_CODE",Width:120, Align:"Center", Edit:0},
		 {Header:"발령일자",Type:"Date",SaveName:"bal_DATE",Width:120, Align:"Center"},
		 {Header:"저장/추가",Type:"Button", SaveName:"bal_ADD", Width:60, Align:"Center"},
		 {Header:"발령코드",Type:"Text",SaveName:"pk_BAL_CODE",Width:120, Align:"Center", Hidden:1},
		 
		 {Header:"발령자",Type:"Text",SaveName:"fk_BAL_CODE",Width:120, Align:"Center"}
      ];
      	createIBSheet2($("#ballyeong")[0],"mySheet", "100%", "300px");
		IBS_InitSheet(mySheet,initData);
		mySheet.SetFocusAfterProcess(0); // 조회후 Focus를 두지 않는다.
        
      	//mySheet3 //대상자
      	initData.Cols = [
      		//체크박스 만들것
      		{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
      		{Header:"NO",Type:"Seq", Align:"Center"},
      		{Header:"사원코드",Type:"Text",SaveName:"fk_BAL_SAWON_CODE", Align:"Center",Edit:0},
      		{Header:"사원명",Type:"Text", SaveName:"sawon_NAME", Width:150, Align:"Center",Edit:0},
			{Header:"부서",Type:"Text", SaveName:"dept_NAME", Width:60, Align:"Center",Edit:0},
			{Header:"직책",Type:"Text", SaveName:"rank_NAME", Width:60, Align:"Center",Edit:0},
			
			{Header:"발령자코드",Type:"Text", SaveName:"fk_BAL_CODE", Width:60, Align:"Center",Edit:0},
			{Header:"발령호수",Type:"Text", SaveName:"bal_NUM", Width:60, Align:"Center",Edit:0},
			{Header:"발령제목",Type:"Text", SaveName:"bal_TITLE", Width:60, Align:"Center",Edit:0},
			{Header:"발령구분",Type:"Text", SaveName:"bal_DIV_CODE", Width:60, Align:"Center",Edit:0},
			{Header:"발령일자",Type:"Text", SaveName:"bal_DATE", Width:60, Align:"Center",Edit:0}
       	];
      	createIBSheet2($("#tab2_contents")[0],"mySheet2", "100%", "300px");
      	IBS_InitSheet(mySheet2,initData);
      	
      	
   }

   
   
   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
         case "save":
        	 mySheet3.DoSave("${pageContext.request.contextPath}/human/p0002/insertBal.do");
            break;
         case "insert":
        	  $.ajax({
      	        url: "ballyeong_target.do", // 알아서 주소를 칠 것.
      	        type: "post"        
      	    }).success(function(result){
      	                $("#popupTarget").html(result);
      	                Loading();
      	                if(j == 0){
      	                	createIBSheet2($("#ib-container3")[0],"mySheet6", "100%", "300px");
      	              		IBS_InitSheet(mySheet6,initData);
//       	            		Action_popup('list_sawon');
      	            		j++;
      	                }else{
      	                	$("#ib-container3_copy").after(container3);
      	                }
      	    });
      	    $("#popupTarget").modal("show");
            break; 
         case "list":
        	 mySheet.DoSearch("${pageContext.request.contextPath}/human/p0002/ballyeong.do"); //mySheet조회
        	 break;
      }
   }
   
   function fn_BalNum(){
		$.ajax({
	    	url: "bal_Num_Code.do", // 알아서 주소를 칠 것.
	    	type: "post"        
		}).success(function(result){
			$("#popupNum").html(result);
	        Loading();
// 	        if(k_dept == 0){
	        	createIBSheet2($("#ib-container2")[0],"mySheet3", "100%", "300px");
	    	    IBS_InitSheet(mySheet3,initData);
// 		        Action_popup('list_sawon');
// 		        k_dept++;
// 			}else if(k_dept == 1){
// 	        	$("#ib-container2_copy").after(container2);
// 	        }
	    });
	    $("#popupNum").modal("show"); // modal : popupNum을 보여준다.(생성)
	}
	
</script>
<script>
$(function(){   
    var cal = {
          closeText : "닫기",
          prevText : "이전달",
          nextText : "다음달",
          currentText : "오늘",
          changeMonth: true, // 월을 바꿀 수 있는 셀렉트 박스
          changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스
          monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
          monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",   "9월", "10월", "11월", "12월" ],
          dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
          dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
          dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
          weekHeader : "주",
          firstDay : 0,
          isRTL : false,
          showMonthAfterYear : true, // 연,월,일 순으로
          yearSuffix : '',
          
          showOn: 'both', // 텍스트와 버튼을 함께 보여준다
          buttonImage:'https://www.shareicon.net/data/16x16/2016/08/13/808501_calendar_512x512.png', //날짜 버튼 이미지
          buttonImageOnly: true,
          
          showButtonPanel: true
    };
        cal.closeText = "선택"; 
        cal.dateFormat = "yymm";
        cal.onClose = function (dateText, inst) {
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
            $(this).datepicker('setDate', new Date(year, month, 1));
            yeardayd();
        }
     
        cal.beforeShow = function () {
            var selectDate = $("#balDate").val().split("-");
            var year = Number(selectDate[0]);
            var month = Number(selectDate[1]) - 1;
            $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
        }

      $("#balDate").datepicker(cal);

      $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px'});  //아이콘(icon) 위치   
      $('img.ui-datepicker-trigger').attr('align', 'absmiddle');
 });
 
</script>

<body onload="LoadPage()">
  <div id="wrapper">
		<div id="page-wrapper" style="margin: 0px;">

		<!--tab 하단의 메인 타이틀(제목) 들어가는 부분 -->
		<div class="row">
			<div class="col-lg-12">        <!-- 해당 메뉴의 아이콘 -->        <!-- 해당 메인 타이틀(제목) 들어가는 부분 -->
				<h1 class="page-header"><i class="fa fa-users fa-fw"></i> <s:message code="main.per4"/></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
	<!-- 호수 정하는 공간 -->	
   <div class="input-group custom-search-form col-lg-2" style="margin:20px">
		<div class="input-group">
			<input class="form-control" type="text" id="dateRangePicker" placeholder="발령호수를 선택하세요." value="" style="width:313px;" readonly>
		</div>
		<span class="input-group-btn">
			<button class="btn btn-default" onclick="fn_BalNum()">
				<i class="fa fa-search"></i>
			</button>
		</span>
	</div>
	
	<form class="form-inline" style="margin:20px">
		<label for="Bal_DIV">발령구분</label>
		<select id="Bal_DIV" onchange="Bal_DIV()">
			<option value="" selected>전체</option>
		</select> &ensp; &ensp; 
           
		<div class="form-group">
    		<label for="balDate">발령일자</label>
			<input type="text" class="form-control" id="balDate" readonly>
        </div>  &ensp; &ensp; 
        
        <div class="form-group">
    		<label for="balTitle">발령제목</label>
			<input type="text" class="form-control" id="balTitle" readonly>
        </div>
        
    <div class="ib_function float_right">
			<a href="javascript:doAction('search')" class="f1_btn_gray lightgray">조회</a>
	</div>
	
	<hr style="border: solid 1px gray ;">    
	</form>
	
	
	
  <div class="main_content">
		<!-- 버튼 -->
		<div class="ib_function float_right">
			<a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
			<a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
		</div>

		<div class="clear hidden"></div>
		
		<div class="ib_product" style="width:100%;float:left">
			<!-- left -->
			<div style="height:100%;width:45%;float:left">
				<div id="ballyeong_copy"></div>
				<div id="ballyeong"></div>
			</div>
			
			<!-- 좌우를 나누는 빈공간 -->
			<div style="height:100%;width:5%;float:left"></div>
			
			<!-- right -->
			<div style="height:100%;width:45%;float:left">
				<div id="tab2_contents"></div>
			</div>
		</div>
        
		</DIV>
		
		</div>
	</div>
	  <div id="popupNum" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" ></div>
</body>
</html>