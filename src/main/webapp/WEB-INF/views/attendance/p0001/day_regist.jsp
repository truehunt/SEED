<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>일일 근태 등록</title>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

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
		{Header : "상태",	Type : "Status",SaveName : "STATUS",MinWidth : 40,edit : 0}, 
		{Header : "마감",	Type : "Text",SaveName : "daily_TA_END",MinWidth : 30},
		{Header : "삭제",Type : "DelCheck",SaveName : "DEL_CHK",	MinWidth : 40},
		{Header : "근무일자",Type : "Text",SaveName : "pk_DAILY_TA_WORKING_DATE",MinWidth : 100},
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
		
		IBS_InitSheet(mySheet, initSheet);

		//mySheet.SetEditable(false);
		//InitSheet.SetRowEditable(5, 1);//5번째 행을 수정할수 있게해줌
		//mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
// 		select2();
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회

			var val1 = "PK_DAILY_TA_WORKING_DATE2="
					+ document.getElementById("pk_DAILY_TA_WORKING_DATE2").value
					+ "&PK_DAILY_TA_WORKING_DATE3="
					+ document.getElementById("pk_DAILY_TA_WORKING_DATE3").value
					+ "&sawon_num="
					+ document.getElementById("sawon_num").value + "&option="
					+ $('#select option:selected').val();
			mySheet.DoSearch(
					"${contextPath}/attendance/p0001/da_searchList.do", val1);
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			break;

		case "save": // 저장
			mySheet.DoSave("${contextPath}/attendance/p0001/insertData_da.do");
			function mySheet_OnRowSearchEnd(Row){
				
				
			}			
			break;

		case "insert": //신규행 추가
			var row = mySheet.DataInsert();
			break;

		case "end": //마감관리
			var select_row = mySheet.GetSelectRow();
		alert(mySheet.GetCellValue(select_row, 1));
		if(mySheet.GetCellValue(select_row, 1) =='Y'){
			mySheet.SetCellValue(select_row, 1, '')
		}else {
			mySheet.SetCellValue(select_row, 1, 'Y')
		}
		}// 마감을 누를시 Y가 들어감
	}

// 	function select1() {

// 		$.ajax({
// 					url : "${contextPath}/attendance/p0001/select.do",//목록을 조회 할 url
// 					type : "POST",
// 					dataType : "JSON",
// 					success : function(data) {
// 						console.log(data);
// 						for (var i = 0; i < data.length; i++) {
// 							var option = "<option class='' value='" + data[i].DEPT_NAME + "'>"
// 									+ data[i].DEPT_NAME + "</option>";
// 							//대상 콤보박스에 추가

// 							$('#select').append(option);
// 						}
// 					},
// 					error : function(jqxhr, status, error) {
// 					}
// 				});
// 	};

	// 조회완료 후 처리할 작업 //마감여부에 Y가 체크시 수정불가
	function mySheet_OnSearchEnd() {

	}

	function mySheet_OnRowSearchEnd(Row) {
		if (mySheet.GetCellValue(Row, 1) == "Y") {
			mySheet.SetRowEditable(Row, 0);
		}
	}
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(Row) {
		mySheet.DoSearch("${contextPath}/attendance/p0001/da_searchList.do");
	}
</script>
</head>
<body onload="LoadPage()">
<body>

	<div id="wrapper">

		<div id="page-wrapper" style="margin: 0px;">

			<!--tab 하단의 메인 타이틀(제목) 들어가는 부분 -->
			<div class="row">
                <div class="col-lg-12">        <!-- 해당 메뉴의 아이콘 -->        <!-- 해당 메인 타이틀(제목) 들어가는 부분 -->
                    <h1 class="page-header"><i class="fa fa-user fa-fw"></i> <s:message code="main.dayCls"/></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="exp_product"></div>
			<div class="ib_function float_right">
				<a href="javascript:doAction('insert')"
					class="f1_btn_gray lightgray">추가</a> <a
					href="javascript:doAction('search')" class="f1_btn_gray lightgray">조회</a>
				<a href="javascript:doAction('save')" class="f1_btn_gray lightgray">저장</a>
				<a href="javascript:doAction('end')" class="f1_btn_gray lightgray">마감</a>
			</div>
			<body>
				선택조건
	
				<select id="select">
					<option value="" selected="selected">선택</option>
					<option value="dept_name">부서명</option>
					<option value="sawon_name" >사원명</option>
					<option value="sawon_code" >사원코드</option>
				</select>	
				<input type="text" name="sawon_num" id="sawon_num">
			
					
				 </select>&emsp;근무일자&emsp;
				<input type="Date" name="pk_DAILY_TA_WORKING_DATE2"
					id="pk_DAILY_TA_WORKING_DATE2">&emsp; ~&emsp;
				<input type="Date" name="pk_DAILY_TA_WORKING_DATE3"
					id="pk_DAILY_TA_WORKING_DATE3"> 
				
				<br>
				<br>
				<br>

				<div class="clear hidden"></div>
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




<!-- 1. 선택해주세요 조회
	 2. 값 입력시 자동 계산  
	 3. 마감 처리 -->