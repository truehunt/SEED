<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet">
<script	src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/project9.js"></script>
<script language="javascript">
	//시트 높이 계산용

	/*Sheet 기본 설정 */

	function LoadPage() {

		function year() {
			let today = new Date();
			document.write(today.toLocaleDateString());

			var val1 = "&fd_year=" + $('#fd_year option:selected').val()
					+ $('#fd_month option:selected').val() + "&option="
					+ $('#select option:selected').val() + "&sawon_num="
					+ document.getElementById("sawon_num").value
			mySheet
					.DoSearch("${contextPath}/attendance/p0001/searchList_month.do",val1);
		}
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode : smLazyLoad,ToolTip : 1};
		initSheet.HeaderMode = {Sort : 1,ColMove : 1,ColResize : 1,HeaderCheck : 1};
		initSheet.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
		// MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
		// Align : data 정렬값.
		// keyfield : keyfield값 필수값 체크시 필요(미입력시 추가안됨.)
		// MultiLineText:1  : 하나의 셀에 여러값을 넣을수 있음(shift+enter)
		// Wrap:1 : 데이터
		{Header : "사원코드",Type : "Text",SaveName : "pk_SAWON_CODE",MinWidth : 80,Hidden : 1}, 
		{Header : "성명",Type : "Text",SaveName : "sawon_NAME",MinWidth : 80},
		{Header : "부서",	Type : "Text",SaveName : "fk_RANK_NAME",MinWidth : 80}, 
		{Header : "직급",	Type : "Text",SaveName : "rank_NAME",MinWidth : 80} ];
		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetDataAutoTrim(0);
		mySheet.SetEditable(false);

		var header = [ {
			Text : "상태|마감|삭제|근무일자|성명|직급|부서|출근시각|퇴근시각|근무시간|연장근로|지각시간|조퇴시간",
			Align : "Center"
		} ];
		var info = {
			Sort : 0,
			ColMove : 1,
			ColResize : 1
		};
		mySheet2.InitHeaders(header, info);

		var cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
		// MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
		// Align : data 정렬값.
		// keyfield : keyfield값 필수값 체크시 필요(미입력시 추가안됨.)
		// MultiLineText:1  : 하나의 셀에 여러값을 넣을수 있음(shift+enter)
		// Wrap:1 : 데이터
		{Header : "상태",Type : "Status",SaveName : "STATUS",	MinWidth : 50,edit : 0},
		{Header : "마감",	Type : "Text",SaveName : "daily_TA_END",MinWidth : 30},
		{Header : "삭제",Type : "DelCheck",SaveName : "DEL_CHK",MinWidth : 70},
		{Header : "근무일자",Type : "Date",SaveName : "pk_DAILY_TA_WORKING_DATE",MinWidth : 100},
		{Header : "성명",	Type : "Text",SaveName : "sawon_NAME",MinWidth : 80},
		{Header : "직급",Type : "Text",SaveName : "rank_NAME",MinWidth : 80,editable : 0},
		{Header : "부서",Type : "Text",SaveName : "fk_RANK_NAME",	MinWidth : 80}, 
		{Header : "출근시각",Type : "Text",SaveName : "daily_TA_GO_TIME",MinWidth : 60},
		{Header : "퇴근시각",Type : "Text",SaveName : "daily_TA_OFF_TIME",MinWidth : 60},
		{Header : "근무시간",Type : "Text",SaveName : "daily_TA_WORK_TIME",MinWidth : 60},
		{Header : "연장근로",Type : "Text",SaveName : "daily_TA_EXTEN_WORK",MinWidth : 60},
		{Header : "지각시간",Type : "Text",SaveName : "daily_TA_LATE_TIME",MinWidth : 60,Format : "Hm"},
		{Header : "조퇴시간",Type : "Text",SaveName : "daily_TA_LEAVE_TIME",MinWidth : 60},
		{Header : "순번",	Type : "Text",SaveName : "num",MinWidth : 60,Hidden : 1} ];
		mySheet2.GetAutoSumPosition(1);
		mySheet2.InitColumns(cols);
		var val1 = "&fd_year=" + $('#fd_year option:selected').val()
				+ $('#fd_month option:selected').val() + "&option="
				+ "&sawon_num=" + document.getElementById("sawon_num").value
		mySheet.DoSearch("${contextPath}/attendance/p0001/searchList_month.do",
				val1);

	}
	//------------------------------------------------------------------------------------

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {

		case "search"://조회
			var val1 = "&fd_year=" + $('#fd_year option:selected').val()
					+ $('#fd_month option:selected').val() + "&option="
					+ $('#select option:selected').val() + "&sawon_num="
					+ document.getElementById("sawon_num").value
			mySheet.DoSearch("${contextPath}/attendance/p0001/searchList_month.do",	val1);
			break;

		case "save": // 저장
			for (var i = 1; i <= mySheet2.RowCount(); i++) {
				if (mySheet2.GetCellValue(i-1, 3) == mySheet2.GetCellValue(mySheet2.RowCount(), 3)){
					alert(mySheet2.GetCellValue(mySheet2.RowCount(), 3)+"일은 이미 등록된 날짜입니다.")
					return false;
				}
				
			}
			mySheet2.DoSave("${contextPath}/attendance/p0001/insertData.do");
			mySheet2.DoSearch("${contextPath}/attendance/p0001/searchList_month_click.do",onclick_val);
			break;

		case "insert": //신규행 추가
			var row = mySheet2.DataInsert(-1);
			mySheet2.SetCellValue(mySheet2.RowCount(), 'sawon_NAME', name) // 사원이름
			mySheet2.SetCellValue(mySheet2.RowCount(), 'fk_RANK_NAME', dept) // 사원부서코드
			mySheet2.SetCellValue(mySheet2.RowCount(), 'rank_NAME', rank) // 사원직급
			break;

		case "end": //마감관리
			var select_row = mySheet2.GetSelectRow();
			if (mySheet2.GetCellValue(select_row, 1) == 'Y') {
				mySheet2.SetCellValue(select_row, 1, '')
			} else {
				mySheet2.SetCellValue(select_row, 1, 'Y')
			}
		}
	}

	// 	var count = 0;
	function mySheet2_OnRowSearchEnd(Row) {
		if (mySheet2.GetCellValue(Row, 1) == "") {
		}
		if (mySheet2.GetCellValue(Row, 1) == "Y") {
			mySheet2.SetRowEditable(Row, 0);
		}
	}
	$(document).ready(
			function() {
				var now = new Date();
				var nyear = now.getFullYear();
				var nmon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1)
						: '0' + (now.getmonth() + 1);

				//년도 selectbox만들기               
				for (var sy = 2015; sy <= nyear; sy++) {
					$('#fd_year').append(
							'<option value="' + sy + '">' + sy + '년</option>');
				}

				// 월별 selectbox 만들기            
				for (var i = 1; i <= 12; i++) {
					var sm = i > 9 ? i : "0" + i;
					$('#fd_month').append(
							'<option value="' + sm + '">' + sm + '월</option>');
				}

				jQuery("#fd_year  > option[value=" + nyear + "]").attr(
						"selected", "true");
				jQuery("#fd_month  > option[value=" + nmon + "]").attr(
						"selected", "true");
			})

	//클릭이벤트
	function mySheet_OnClick(selectRow, Col, Value, CellX, CellY, CellW, CellH) {

		var val1 = "&fd_year=" + $('#fd_year option:selected').val()
				+ $('#fd_month option:selected').val() + "&option="
				+ $('#select option:selected').val()

		var val2 = "&sawon_code=" + mySheet.GetCellValue(selectRow, 0)
		onclick_val = val1 + val2;
		name = mySheet.GetCellValue(selectRow, 'sawon_NAME') // 사원이름
		dept = mySheet.GetCellValue(selectRow, 'fk_RANK_NAME') // 사원부서코드
		rank = mySheet.GetCellValue(selectRow, 'rank_NAME') // 사원직급
		mySheet2.DoSearch(
				"${contextPath}/attendance/p0001/searchList_month_click.do",
				onclick_val);
	}

	function mySheet2_OnClick(selectRow, Col, CellX, CellY, CellW, CellH) {
		if (mySheet2.GetCellValue(selectRow, 7) != "") {
			if (mySheet2.GetCellValue(selectRow, 8) != "") {
				mySheet2.GetCellValue(selectRow, 7)
				mySheet2.GetCellValue(selectRow, 8)
				var Get = mySheet2.GetCellValue(mySheet2.GetSelectRow(), 7);
				var GetA = Get.split(':');
				 Hour = GetA[0];
				 Min = GetA[1];
				var Time = Hour - 9 + "" + Min;//지각 시간
				if (Time>0) {
						mySheet2.SetCellValue(mySheet2.GetSelectRow(), 11, Time);//지각시간	 
				}
				var Set = mySheet2.GetCellValue(mySheet2.GetSelectRow(), 8);
				var SetA = Set.split(':');
				var NowTime3 = SetA[0];
				var NowTime4 = SetA[1];
				WorkTime1 = NowTime3 - Hour;//시간
				WorkTime2 = NowTime4 - Min;//분
				if (Min > NowTime4) {
					WorkTime1 = (NowTime3 - 1 - Hour)
					WorkTime2 = (NowTime4 + 60 - Min)
				} else {
					WorkTime1 = NowTime3 - Hour;//시간
					WorkTime2 = NowTime4 - Min;//분
				}
				if (WorkTime1 < 10) {
					WorkTime1 = "0" + WorkTime1
				}
				if (WorkTime2 < 10) {
					WorkTime2 = "0" + WorkTime2
				}
				var WorkTime = WorkTime1 + ":" + WorkTime2
				mySheet2.SetCellValue(mySheet2.GetSelectRow(), 9, WorkTime);//근무시간
				var ExTime = NowTime3 - 18 + " : " + NowTime4;
				if (NowTime3 > 17) {
					mySheet2.SetCellValue(mySheet2.GetSelectRow(), 10, ExTime);//연장시간
				}
				if (NowTime3 < 18) {
					var Time2 = NowTime3 + ":" + NowTime4;
					var HTime = 18 - NowTime3;
					var MTime = 60 - NowTime4;
					if (NowTime4 > 0) {
						HTime = 17 - NowTime3;
						MTime = 60 - NowTime4;
						if (MTime < 10) {
							MTime = "0" + MTime;
						}
					}
					var Time = HTime + " : " + MTime;
					mySheet2.SetCellValue(mySheet2.GetSelectRow(), 12, Time); //조퇴시간
				}
			}
		}
	}
</script>
</head>
<body onload="LoadPage()">
<body>

	<div id="wrapper">

		<div id="page-wrapper" style="margin: 0px;">

			<!--tab 하단의 메인 타이틀(제목) 들어가는 부분 -->
			<div class="row">
				<div class="col-lg-12">
					<!-- 해당 메뉴의 아이콘 -->
					<!-- 해당 메인 타이틀(제목) 들어가는 부분 -->
					<h1 class="page-header">
						<i class="fa fa-user fa-fw"></i>
						<s:message code="main.monthlyCls2" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			</tr>
</body>
<body>
	<form class="form-inline">

		<div class="main_content">
			<td class="item_title_border">년월선택</td>
			<td class="item_input"><select id="fd_year" name="fd_year"
				style="width: 80;" class="form-control"></select> <select
				id="fd_month" name="fd_month" style="width: 90px;"
				class="form-control">
					<option value="">월</option>
			</select></td>
			</tr>
			&emsp;&emsp;
</body>
<br>
<br>
<div class="ib_function float_right">
	<a href="javascript:doAction('insert')"
		class="btn btn-outline btn-primary">추가</a> <a
		href="javascript:doAction('search')"
		class="btn btn-outline btn-primary">조회</a> <a
		href="javascript:doAction('save')" class="btn btn-outline btn-primary">저장</a>
	<a href="javascript:doAction('end')"
		class="btn btn-outline btn-primary">마감</a>
</div>

선택조건

<select id="select" class="form-control">
	<option value="" selected="selected">선택</option>
	<option value="dept_name">부서명</option>
	<option value="sawon_name">사원명</option>
	<option value="sawon_code">사원코드</option>
</select>
<input type="text" name="sawon_num" id="sawon_num" class="form-control">
<br>
<br>
<br>

<div class="clear hidden"></div>
<!-- left단 사원리스트 -->
<DIV class="ib_product" style="width: 70%; float: left">
	<div style="height: 100%; width: 30%; float: left">
		<script type="text/javascript">
			createIBSheet("mySheet", "100%", "100%");
		</script>
	</div>

	<div style="height: 100%; width: 1%; float: left"></div>
	<div style="height: 100%; width: 45%; float: left">
		<script type="text/javascript">
			createIBSheet("mySheet2", "200%", "100%");
		</script>
	</div>
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
</body>
</html>

