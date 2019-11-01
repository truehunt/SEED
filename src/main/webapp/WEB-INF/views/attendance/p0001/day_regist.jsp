<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<meta charset="UTF-8">
<div class="page_title">
	<span><a class="closeDepth" href="#">closeDepth</a></span> <span
			class="title">근태/연차관리 > <b>일일 근태 관리</b></span>
	</div>
	<title>일일 근태 등록</title>
	
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
			{Header : "근무일자",Type : "DATE",	SaveName : "PK_DAILY_TA_WORKING_DATE",	MinWidth : 100,	},
			{Header : "성명",	Type : "Text",SaveName : "DAILY_TA_SAWON_NAME",	MinWidth : 80,},
			{Header : "직급",	Type : "Text",SaveName : "DAILY_TA_RANK",MinWidth : 80},
			{Header : "부서",	Type : "Text",SaveName : "DAILY_TA_DEPT_NAME",MinWidth : 80,Wrap : 1},
			{Header : "근태구분",Type : "Text",SaveName : "DAILY_TA_TA",MinWidth : 100	},//ex)9-6까지 근무를 했으면 정상 / 9시 이후 출근 지각 / 6시 이전 퇴근 조퇴
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
				var val = document.getElementById("gowork").value
				var val1 = document.getElementById("gohome").value;
				mySheet.DoSearch("${contextPath}/attendance/p0001/da_searchList.do", val);
					alert(val +"~"+ val1);
					break;
				//mySheet.DoSearch("transaction_data2.json");
				break;
				
				
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
				
				
			case "save": // 저장
				//var tempStr = mySheet.GetSaveString();
				//alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet.DoSave("${contextPath}/attendance/p0001/insertData.do");
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
		function mySheet_OnSaveEnd(code, msg) {
			if (msg != "") {
				alert(msg);
				//번호 다시 매기기
				//mySheet.ReNumberSeq();
			}
		}
	</script>
</head>
<body onload="LoadPage()">
	<div class="exp_product"></div>
	<div class="ib_function float_right">
		<a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
		<a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
		<a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
		<a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
	</div>
	<body>
	부서명
	<!-- select box -->
	&emsp;
	<select name="부서명">
		<option value="">부서명</option>
		<option value="A">A</option>
		<option value="B">B</option>
		<option value="C">C</option>
	</select> &emsp;근무일자&emsp;
	<input type="Date" name="PK_DAILY_TA_WORKING_DATE" id="gowork">&emsp; ~&emsp;
	<input type="Date" name="endDate" id="gohome">
	&emsp;사원번호&emsp;
	<input type="text" name="sawon_num" id="sawon_num">
	<a class="f1_btn_gray lightgray" style="float: right;">검색</a>
	<div class="page_title"></div>
	<!-- 구분 선 -->
	<br>
	<br>
	<br>

	<div class="clear hidden"></div>
	<div class="ib_product">
		<script>
			createIBSheet("mySheet", "100%", "100%");
		</script>
</body>
</html>