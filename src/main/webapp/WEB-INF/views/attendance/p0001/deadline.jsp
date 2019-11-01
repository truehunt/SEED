<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!----------------------------------------------------------------------------------------->
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script language="javascript">
	//시트 높이 계산용

	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {
			SearchMode : smLazyLoad,
			ToolTip : 1
		};
		initSheet.HeaderMode = {
			Sort : 1,
			ColMove : 1,
			ColResize : 1,
			HeaderCheck : 1
		};
		
		initSheet.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
		// MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
		// Align : data 정렬값.
		// keyfield : keyfield값 필수값 체크시 필요(미입력시 추가안됨.)
		// MultiLineText:1  : 하나의 셀에 여러값을 넣을수 있음(shift+enter)
		// Wrap:1 : 데이터
			{Header : "마감유무",Type : "DATE",	SaveName : "CLOSING_DEADLINE_CONFORM",	MinWidth : 10,	},
			{Header : "근무일자",Type : "DATE",	SaveName : "PK_DAILY_TA_WORKING_DATE",	MinWidth : 100,	},
			{Header : "성명",	Type : "Text",SaveName : "DAILY_TA_SAWON_NAME",	MinWidth : 80,},
			{Header : "직급",	Type : "Text",SaveName : "DAILY_TA_RANK",MinWidth : 80},
			{Header : "부서",	Type : "Text",SaveName : "DAILY_TA_DEPT_NAME",MinWidth : 80,Wrap : 1},
			{Header : "출근시각",Type : "Time",SaveName : "DAILY_TA_GO_TIME",MinWidth : 60	},
			{Header : "퇴근시각",Type : "Time",SaveName : "DAILY_TA_OFF_TIME",MinWidth : 60},
			{Header : "근무시간",Type : "Time",SaveName : "DAILY_TA_WORK_TIME",MinWidth : 60},
			{Header : "휴일근무",Type : "Time",SaveName : "DAILY_TA_HOLI_WORK",MinWidth : 60},
			{Header : "연장근로",Type : "Time",SaveName : "DAILY_TA_EXTEN_WORK",MinWidth : 60},
			{Header : "야간근로",Type : "Time",SaveName : "DAILY_TA_NIGHT_WORK",MinWidth : 60},
			{Header : "지각시간",Type : "Time",SaveName : "DAILY_TA_LATE_TIME",MinWidth : 60}, 
			{Header : "조퇴시간",Type : "Time",SaveName : "DAILY_TA_LEAVE_TIME",MinWidth : 60}];
		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		//mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
	}
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
		var val = "PK_DAILY_TA_WORKING_DATE=" + document.getElementById("fromDate").value;
		mySheet.DoSearch("${contextPath}/attendance/p0001/searchList1.do", val);
			alert(val);
			break;
			
		//------------------------------------------------------------------------------------------------------------------------------	
        	//출근
        	case "gowork":
           	mySheet.DataInsert(-1);//열 추가
            //날짜부분 들어가는 코딩 
            var select_row = mySheet.GetSelectRow();
           	var PK_DAILY_TA_WORKING_DATE = document.getElementById("fromDate").value;
            var Now = new Date();
            var NowTime1 = Now.getHours();
            NowTime1 += ':' + Now.getMinutes();
            mySheet.SetCellValue(select_row, 0 ,PK_DAILY_TA_WORKING_DATE);
            mySheet.SetCellValue(select_row, 5 ,NowTime1);
            alert("시작");
			mySheet.DoSave("${contextPath}/attendance/p0001/insertData.do");
            // 12:03분을 12:3으로 표시
            alert("완성");
            //DB에 값이 들어가지 않음
            //값을 받아오지도 않음
        	mySheet.Doinsert("${contextPath}/attendance/p0001/insertDate.do");// 실행안됌,,,,,,       
			alert("654321");
            //----------------------------------------------------------------------------------------------------------------------------------
            
		case "gohome": //퇴근
			var select_row = mySheet.GetSelectRow();
	        var currentDate = new Date();
	        alert(currentDate)
	        var msg = currentDate.getHours()+":"
	        msg += currentDate.getMinutes();
	        alert(msg);
	        mySheet.SetCellValue(select_row, 6 ,msg);
		break;
		}
	}
	
	
</script>
</head>
<body onload="LoadPage()">
	<div class="page_title">
		<span><a class="closeDepth" href="#">closeDepth</a></span> <span
			class="title">근태/연차관리 > <b>일일 마감 관리</b></span>
	</div>
	<div class="main_content">
		<br> <label for="fromDate">마감일</label> <input type='date'
			id="fromDate" name="fromDate" />
		<!-------------------- 달력 -------------------------------->
		&emsp;부서명
		<!-- select box -->
		&emsp; <select name="부서명">
			<option value="">부서명</option>
			<option value="A">A</option>
			<option value="B">B</option>
			<option value="C">C</option>
		</select> <br> <a href="javascript:doAction('search')"
			class="f1_btn_gray lightgray" style="float: right;">조회</a>
		<div class="page_title"></div>
		<!-- 구분 선 -->
		<br> <br>

		<h4>일일근태 확인</h4>
		<div class="ib_function float">

			<!-- 공간을 넓게 -->
			<!--<div class="ib_product"><!-- 없으면 크기가 작아짐(3줄정도로 바뀜 -->
			<script>
		createIBSheet("mySheet", "100%", "100%");
	</script>
</body>
</html>

<!-- 1. 조회를 누르면 그날의 디비값을 가져와야함  O
	 2. 출근을 누르면 오늘날짜는 근무일자에 넣고 현재시간에 맞춰서 출근시간에 넣어야한다. O
	 3. 로그인한 정보대로 성명, 직급, 부서를 불러온다.
	 4. 근무일자가 오늘날짜가 아니면 출근퇴근을 할수 없다.
	 5. 표는 수정을 할수가 없다.
	 6. DB에 값을 넣어야함
	 7. 연장근무에 시간 들어가야함
	 8. 퇴근시간에서 출근시간 빼서 근무시간 들어가야함
	 -->