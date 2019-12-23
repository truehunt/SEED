<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가일수 계산</title>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet">

<script	src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/project9.js"></script>

<!-- select box 실행 안됌  => 다시 찾기 -->
<script language="javascript"> 
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
				jQuery("#fd_year  > option[value=" + nyear + "]").attr(
						"selected", "true");
			})

	// ibsheet

	var pageheightoffset = 200;

	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode : smLazyLoad,ToolTip : 1};
		initSheet.HeaderMode = {Sort : 1,ColMove : 1,ColResize : 1,HeaderCheck : 1};
		initSheet.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
		// MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)

		//------------------------------------------------------
		// 목록만들기
		{Header : "상태",Type : "Status",SaveName : "STATUS",MinWidth : 40,Hidden : 1},
		{Header : "삭제",Type : "DelCheck",SaveName : "STATUS", MinWidth : 80,Hidden : 1},
		{Header : "성명",Type : "Text",SaveName : "sawon_NAME",MinWidth : 80,	Align : "Center"}, 
		{Header : "부서",Type : "Text",SaveName : "fk_DEPT_NAME",	MinWidth : 80,Align : "Center"},
		{Header : "직급",	Type : "Text",SaveName : "rank_NAME",MinWidth : 80,Align : "Center"},
		{Header : "입사일자",Type : "Text",SaveName : "sawon_JOIN_DATE",MinWidth : 80,MultiLineText : 1},
		{Header : "근속기준일",	Type : "Text",SaveName : "cust_state",MinWidth : 80,Wrap : 1}, 
		{Header : "근속년수",Type : "Text",SaveName : "holiday_INT_USER_ID",Align : "Center",MinWidth : 80,Wrap : 1}, 
		{Header : "근속연차",Type : "Text",MinWidth : 80,SaveName : "holiday_INT_DATE",Align : "Center"}, 
		{Header : "사용연차",Type : "Text",SaveName : "sum_HOLIDAY",MinWidth : 80,Align : "Center"}, 
		{Header : "잔여연차",Type : "Text",SaveName : "holiday_CALC_LEFT_ANNUAL",MinWidth : 80,Align : "Center"} ];
		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetEditable(false);
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			var val1 = "&fd_year=" + $('#fd_year option:selected').val()
					+ "&sawon_num="
					+ document.getElementById("sawon_num").value + "&option="
					+ $('#select option:selected').val()
			mySheet.DoSearch(
					"${contextPath}/attendance/p0002/searchList_calc.do", val1);
			break;
			
// 		case "reload": //초기화
// 			mySheet.RemoveAll();
// 			break;

		case "save": // 저장
			mySheet
					.DoSave_calc("${contextPath}/attendance/p0002/insertData_calc.do");
			break;
		case "insert": //신규행 추가
			var row = mySheet.DataInsert();
			break;
		}
	}

	// 조회완료 후 처리할 작업
	function mySheet_OnSaveEnd(code, msg) {
		if (msg != "") {
			function mySheet_OnRowSearchEnd(Row) {
				mySheet.GetCellValue(Row, 7);
			} 

		}
	}

	function mySheet_OnRowSearchEnd(Row) {
		val1 = $('#fd_year option:selected').val()
		mySheet.SetCellValue(Row, 6, val1 + "1231");

		var num = mySheet.GetCellValue(Row, 8)
		var num1 = mySheet.GetCellValue(Row, 9)
		if (mySheet.GetCellValue(Row, 9) == "") {
			mySheet.SetCellValue(Row, 9, 0)
		}
		num = Number(num) - Number(num1)
		mySheet.SetCellValue(Row, 10, num)

	}


</script>
</head>
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
						<s:message code="main.calHoliday" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<form class="form-inline">

				<div class="main_content">
			<br> 기준년도
			<td class="item_title_border" ></td>
			<td class="item_input"><select id="fd_year" name="fd_year" class="form-control"></select>
			</tr>
			&emsp; &emsp;선택조건 <select id="select" class="form-control">
				<option value="" selected="selected">선택</option>
				<option value="dept_name">부서명</option>
				<option value="sawon_name">사원명</option>
				<option value="sawon_code">사원코드</option>
			</select> <input type="text" name="sawon_num" id="sawon_num" class="form-control"> <br>
			<body onload="LoadPage()">
				<div class="ib_function float_right">
					<a href="javascript:doAction('search')"
						class="btn btn-outline btn-primary">조회</a>
					</form>
				</div>
				<div class="ib_function float_right">
					<br> <br> <br>
				</div>
				<div class="clear hidden"></div>
				<div class="ib_product">
					<script>
						createIBSheet("mySheet", "100%", "100%");
					</script>
				</div>
		</div>

	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>
</body>
</html>