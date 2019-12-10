<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일일 근태 등록</title>
<!----------------------------------------------------------------------------------------->
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/project9.js"></script>
<script language="javascript">
	//시트 높이 계산용

	/*Sheet 기본 설정 */

	function LoadPage() {

		function year() {
			let today = new Date();

			document.write(today.toLocaleDateString());
		}
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
		{
			Header : "상태",
			Type : "Status",
			SaveName : "STATUS",
			MinWidth : 40
		}, {
			Header : "삭제",
			Type : "DelCheck",
			SaveName : "DEL_CHK",
			MinWidth : 40
		}, {
			Header : "결재 상태",
			Type : "Text",
			SaveName : "holiday_PAY",
			MinWidth : 30
		}, {
			Header : "신청 일자",
			Type : "Text",
			SaveName : "holiday_REGIST",
			MinWidth : 80,
			Edit : 0
		}, {
			Header : "사원명",
			Type : "Text",
			SaveName : "sawon_NAME",
			MinWidth : 80
		}, {
			Header : "부서명",
			Type : "Text",
			SaveName : "fk_DEPT_NAME",
			MinWidth : 80
		}, {
			Header : "직급 명",
			Type : "Text",
			SaveName : "rank_NAME",
			MinWidth : 80
		}, {
			Header : "휴가구분",
			Type : "Text",
			SaveName : "holiday_DIVISION",
			MinWidth : 60
		}, {
			Header : "휴가시작일",
			Type : "Date",
			SaveName : "holiday_ANNUAL_STR",
			MinWidth : 100
		}, {
			Header : "휴가종료일",
			Type : "Date",
			SaveName : "holiday_ANNUAL_END",
			MinWidth : 100
		}, {
			Header : "휴가사유",
			Type : "Text",
			SaveName : "holiday_REASON",
			MinWidth : 60
		}, {
			Header : "사원코드",
			Type : "Text",
			SaveName : "fk_HOLIDAY_SAWON_CODE",
			MinWidth : 60,
			Hidden : 1
		}, {
			Header : "순번",
			Type : "Text",
			SaveName : "holiday_NUM",
			MinWidth : 60,
			Hidden : 1
		} ];
		IBS_InitSheet(mySheet, initSheet);
		// 			select();
	}
	//------------------------------------------------------------------------------------

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			var val1 = "&fd_year=" + $('#fd_year option:selected').val()
					+ "&fd_month=" + $('#fd_month option:selected').val()
					+ "&sawon_num="
					+ document.getElementById("sawon_num").value + "&option="
					+ $('#select option:selected').val() + "&HOLIDAY_PAY="
					+ $('#HOLIDAY_PAY option:selected').val()
			mySheet.DoSearch(
					"${contextPath}/attendance/p0002/searchList_holi_da.do",
					val1);
			break;

		case "save": // 저장
			mySheet
					.DoSave("${contextPath}/attendance/p0002/insertData_holi_da.do");
			var val1 = "&fd_year=" + $('#fd_year option:selected').val()
					+ "&fd_month=" + $('#fd_month option:selected').val()
					+ "&sawon_num="
					+ document.getElementById("sawon_num").value + "&option="
					+ $('#select option:selected').val() + "&HOLIDAY_PAY="
					+ $('#HOLIDAY_PAY option:selected').val()
			mySheet.DoSearch(
					"${contextPath}/attendance/p0002/searchList_holi_da.do",
					val1);
			break;

		case "insert": //신규행 추가
			var row = mySheet.DataInsert();
			var select_row = mySheet.GetSelectRow();
			mySheet.SetCellValue(select_row, 3, getToday());
			mySheet.SetCellValue(select_row, 2, '요청');
			break;

		case "yes": //승인
			var select_row = mySheet.GetSelectRow();
			if (mySheet.GetCellValue(select_row, 2) == '요청') {
				mySheet.SetCellValue(select_row, 2, '승인')
			}
			if (mySheet.GetCellValue(select_row, 2) == '반려') {
				mySheet.SetCellValue(select_row, 2, '승인')
			}else {
				mySheet.SetCellValue(select_row, 2, '요청')
			} 
			break;

		case "no": //반려
			var select_row = mySheet.GetSelectRow();
			if (mySheet.GetCellValue(select_row, 2) == '요청') {
				mySheet.SetCellValue(select_row, 2, '반려')
			}
			if (mySheet.GetCellValue(select_row, 2) == '승인') {
				mySheet.SetCellValue(select_row, 2, '반려')
			}else {
				mySheet.SetCellValue(select_row, 2, '요청')
			}
			break;

		}
	}
	// 	   function select() {

	// 			$.ajax({
	// 						url : "${contextPath}/attendance/p0002/select.do",//목록을 조회 할 url
	// 						type : "POST",
	// 						dataType : "JSON",
	// 						success : function(data) {
	// 							console.log(data);
	// 							for (var i = 0; i < data.length; i++) {
	// 								var option = "<option class='' value='" + data[i].DEPT_NAME + "'>"
	// 										+ data[i].DEPT_NAME + "</option>";
	// 								//대상 콤보박스에 추가

	// 								$('#select').append(option);
	// 							}
	// 						},
	// 						error : function(jqxhr, status, error) {
	// 						}
	// 					});
	// 		};
	// mySheet 조회 끝나기 직전 이벤트 
	function mySheet_OnSearchEnd() {
	}
	function mySheet_OnRowSearchEnd(Row) {
		if (mySheet.GetCellValue(Row, 2) != "요청") {
			mySheet.SetRowEditable(Row, 0);
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

	// 오늘 날짜 삽입
	function getToday() {
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth() + 1; //1월이 0으로 되기때문에 +1을 함.
		var date = now.getDate();

		if ((month + "").length < 2) { //2자리가 아니면 0을 붙여줌.
			month = "0" + month;
		}
		// ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.
		return today = "" + year + "-" + month + "-" + date;
		mySheet.SetCellValue(select_row, 2, today); //조퇴시간
	}
	//	let today = new Date();
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
						<s:message code="main.findHoliday2" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<td class="item_title_border">년월선택</td>
			<td class="item_input"><select id="fd_year" name="fd_year"
				style="width: 80;"></select> <select id="fd_month" name="fd_month"
				style="width: 80px;">
					<option value="">월</option>
			</select></td>
			</tr>
			&emsp;&emsp;
			</table>
</body>

&emsp;전자결재 상태
<select name="HOLIDAY_PAY" , id="HOLIDAY_PAY">
	<option value="">전자 결재 상태</option>
	<option value="요청">요청</option>
	<option value="반려">반려</option>
	<option value="승인">승인</option>
</select>
<br>
<br>
<div class="ib_function float_right">
	<a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
	<a href="javascript:doAction('search')" class="f1_btn_gray lightgray">조회</a>
	<a href="javascript:doAction('save')" class="f1_btn_gray lightgray">저장</a>
	<a href="javascript:doAction('yes')" class="f1_btn_gray lightgray">승인</a>
	<a href="javascript:doAction('no')" class="f1_btn_gray lightgray">반려</a>
</div>
선택조건

<select id="select">
	<option value="" selected="selected">선택</option>
	<option value="dept_name">부서명</option>
	<option value="sawon_name">사원명</option>
	<option value="sawon_code">사원코드</option>
</select>
<input type="text" name="sawon_num" id="sawon_num">
<br>
<br>
<br>
<div class="exp_product"></div>
<!-- 공간을 넓게 -->
<div class="ib_product">
	<script>
		createIBSheet("mySheet", "100%", "100%");
	</script>
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
</body>
</html>