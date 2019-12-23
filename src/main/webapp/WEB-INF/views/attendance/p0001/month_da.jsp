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
<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
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
		}
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {
			SearchMode : smLazyLoad,
			ToolTip : 1
		};
		initSheet.HeaderMode = {Sort : 1,ColMove : 1,ColResize : 1,HeaderCheck : 1};
		initSheet.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
		// MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
			{Header : "사원코드",Type : "Text",SaveName : "pk_SAWON_CODE", MinWidth : 80,Hidden : 1},
			{Header : "성명", Type : "Text",SaveName : "sawon_NAME", MinWidth : 80},
			{Header : "부서", Type : "Text", SaveName : "fk_RANK_NAME", MinWidth : 80	},
			{Header : "직급", Type : "Text", SaveName : "rank_NAME", MinWidth : 80}, ];
		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetDataAutoTrim(0);
		mySheet.SetEditable(false);
		initSheet.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
			// MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
		{Header : "상태",	Type : "Status",SaveName : "STATUS",MinWidth : 40,edit : 0}, 
		{Header : "근무일자",Type : "Date",SaveName : "pk_DAILY_TA_WORKING_DATE",MinWidth : 100},
		{Header : "성명",	Type : "Text",SaveName : "sawon_NAME",MinWidth : 80},
		{Header : "직급",Type : "Text",SaveName : "rank_NAME",MinWidth : 80,editable : 0},
		{Header : "부서",	Type : "Text",SaveName : "fk_RANK_NAME",MinWidth : 80},
		{Header : "출근시각",Type : "Text",SaveName : "daily_TA_GO_TIME",MinWidth : 60},
		{Header : "퇴근시각",Type : "Text",SaveName : "daily_TA_OFF_TIME",MinWidth : 60}, 
		{Header : "근무시간",Type : "Text",SaveName : "daily_TA_WORK_TIME",MinWidth : 60}, 
		{Header : "연장근로",Type : "Text",SaveName : "daily_TA_EXTEN_WORK",MinWidth : 60},
		{Header : "지각시간",Type : "Text",SaveName : "daily_TA_LATE_TIME",MinWidth : 60}, 
		{Header : "조퇴시간",Type : "Text",SaveName : "daily_TA_LEAVE_TIME",MinWidth : 60},
		{Header : "순번",Type : "Text",SaveName : "num",MinWidth : 60,Hidden :1}];
		IBS_InitSheet(mySheet2, initSheet); 
		mySheet.SetEditable(false);
		mySheet2.SetEditable(false);
			
			var val1 = "&pk_SAWON_CODE=" + '<%=session.getAttribute("PK_SAWON_CODE")%>'
			+ "&fd_year=" + $('#fd_year option:selected').val()
	mySheet.DoSearch("${contextPath}/attendance/p0001/searchList_month.do",	val1);
	}
	//------------------------------------------------------------------------------------

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {

		//조회
		case "search": 
			var val1 = "&pk_SAWON_CODE=" + '<%=session.getAttribute("PK_SAWON_CODE")%>'
			+ "&fd_year=" + $('#fd_year option:selected').val()
			+ $('#fd_month option:selected').val() 
	mySheet.DoSearch("${contextPath}/attendance/p0001/searchList_month.do",	val1);
			break;
		}
	}
//년월선태 SelectBox
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

		var val2 = "&sawon_code=" +mySheet.GetCellValue(selectRow, 0)
		var val3 = val1+val2;
		mySheet2.DoSearch(
				"${contextPath}/attendance/p0001/searchList_month_click.do", val3);
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
						<s:message code="main.findTA" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			</tr>
</body>
<body>
	<form class="form-inline">
				<div class="main_content">
	<td class="item_title_border" >년월선택</td>
	<td class="item_input"><select id="fd_year" name="fd_year"
		style="width: 80;" class="form-control"></select> <select id="fd_month" name="fd_month"
		style="width: 80px;" class="form-control">
			<option value="">월</option>
	</select></td>
	</tr>
	&emsp;&emsp;
</body>
<br>
<br>
<div class="ib_function float_right">
	<a href="javascript:doAction('search')" class="btn btn-outline btn-primary">조회</a>
</div>

	
<br>
<br>
<br>
 <div class="clear hidden"></div>
      <!-- left단 사원리스트 -->
              <DIV class="ib_product" style="width:70%;float:left">
            <div style="height:100%;width:30%;float:left">
               <script type="text/javascript"> createIBSheet("mySheet", "100%", "100%"); selectSite(); </script>
            </div>
         
            <div style="height:100%;width:1%;float:left"></div>
            <div style="height:100%;width:45%;float:left">
               <script type="text/javascript"> createIBSheet("mySheet2", "200%", "100%"); </script>
            </div>
         </div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
</body>
</html>

