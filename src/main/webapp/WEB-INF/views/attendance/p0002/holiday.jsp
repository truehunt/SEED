<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				MinWidth : 40,
			}, {
				Header : "삭제",
				Type : "DelCheck",
				SaveName : "DEL_CHK",
				MinWidth : 40
			},{
				Header : "신청 일자",
				Type : "Text",
				SaveName : "holiday_REGIST",
				MinWidth :80,
				Edit : 0
			}, {
				Header : "전자결재 상태",
				Type : "Text",
				SaveName : "holiday_PAY",
				MinWidth : 30,
				Edit : 0
			}, {
				Header : "휴가구분",
				Type : "Combo",
				SaveName : "holiday_DIVISION",
				MinWidth : 60,
				ComboCode:"연가|병가|특별휴가"
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
			},{
		          Header : "사원코드",
		          Type : "Text",
		          SaveName : "fk_HOLIDAY_SAWON_CODE",
		          MinWidth : 60,
		          Hidden :1
		       }, {
					Header : "순번",
					Type : "Text",
					SaveName : "holiday_NUM",
					MinWidth : 60,
				    Hidden :1
				},{
					Header : "근속연차",
					Type : "Text",
					MinWidth : 80,
					SaveName : "holiday_INT_DATE",
					Align : "Center",
					Hidden :1
				} ,{
					Header : "사용연차",
					Type : "Text",
					SaveName : "sum_HOLIDAY",
					MinWidth : 80,
					Align : "Center",
					Hidden :1
				},{
					Header : "잔여연차",
					Type : "Text",
					SaveName : "holiday_CALC_LEFT_ANNUAL",
					MinWidth : 80,
					Align : "Center",
					Hidden :1
				}   ];
			IBS_InitSheet(mySheet, initSheet);
		//mySheet.SetEditable(false);
		//mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
	}
   //------------------------------------------------------------------------------------

   
   /*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
		
		var val1 = "&pk_SAWON_CODE=" + '<%=session.getAttribute("PK_SAWON_CODE")%>'
		+"&fd_year="+ $('#fd_year option:selected').val()
		+"&HOLIDAY_PAY="+ $('#HOLIDAY_PAY option:selected').val()
			mySheet.DoSearch("${contextPath}/attendance/p0002/searchList_holi.do", val1)
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			break;

		case "save": // 저장
			for (var i = 1; i <= mySheet.RowCount(); i++) {
				if(mySheet.GetCellValue(i,'STATUS') == 'I'){
					var fd_year = $('#fd_year option:selected').val();
					var nm = mySheet.GetCellValue(i,8);
					var cnt = i;
					$.ajax({
						url : "searchList_holi_da2.do", // 알아서 주소를 칠 것.
						type : "post",
						data : {sawon_code : nm, fd_year : fd_year}
					}).success(function(data){
						var int_date = data['Data'][0].holiday_INT_DATE; 
						var sum_Hol = data['Data'][0].sum_HOLIDAY
						var num = int_date - sum_Hol;
						mySheet.SetCellValue(cnt,'holiday_INT_DATE',int_date);
						mySheet.SetCellValue(cnt,'sum_HOLIDAY',sum_Hol);
						mySheet.SetCellValue(cnt,'holiday_CALC_LEFT_ANNUAL',num);
								if (mySheet.GetCellValue(cnt, 'holiday_DIVISION') == '연가') {
									if(((mySheet.GetCellValue(cnt, 6))- (mySheet.GetCellValue(cnt, 5)) + 1) > (mySheet.GetCellValue(cnt, 12))){
										alert("잔여일수보다 신청일수가 큽니다.남은 잔여일수는 "
												+ (mySheet.GetCellValue(cnt, 12)) + "일 입니다.")
										return false;
									}
								}
						mySheet.DoSave("${contextPath}/attendance/p0002/insertData_holi.do");
						}
					);
				}
				mySheet.GetCellValue(i, 6);
				mySheet.GetCellValue(i, 5);
				// 
				
				if (mySheet.GetCellValue(i, 5) > mySheet.GetCellValue(i, 6)) {
					alert(i + "열의 날짜를 정확히 입력해주세요");
					return false;
				}
			
				if (mySheet.GetCellValue(i, 'STATUS') != 'R') {
					if (mySheet.GetCellValue(i, 'holiday_DIVISION') == '연가') {
						(((mySheet.GetCellValue(i, 6))
								- (mySheet.GetCellValue(i, 5)) + 1) > (mySheet
								.GetCellValue(i, 15)))
						alert("잔여일수보다 신청일수가 큽니다. 남은 잔여일수는 "
								+ (mySheet.GetCellValue(i, 12)) + "입니다.")
						return false;
					}
				}
			if(mySheet.GetCellValue(i,'STATUS') == 'U'){
				mySheet.DoSave("${contextPath}/attendance/p0002/insertData_holi.do");
			}
			if((mySheet.GetCellValue(i,'STATUS') == "D")){
				mySheet.DoSave("${contextPath}/attendance/p0002/deleteData_holi.do");
			}
				
			}
			break;

		case "insert": //신규행 추가
			var row = mySheet.DataInsert(-1);
		    var select_row = mySheet.GetSelectRow();
			var val2 = '<%=session.getAttribute("PK_SAWON_CODE")%>';
            mySheet.SetCellValue(select_row,8, val2);
        	mySheet.SetCellValue(select_row, 2, getToday());
        	mySheet.SetCellValue(select_row, 3, '요청');
			break;
		}
	}
   
 // mySheet 조회 끝나기 직전 이벤트 
  function mySheet_OnSearchEnd() {
      if(mySheet.GetCellValue(1,1) == -1 ){
    	  val2 = '<%=session.getAttribute("PK_SAWON_CODE")%>';

			var PK_DAILY_TA_WORKING_DATE = document
					.getElementById("PK_SAWON_CODE").value;
			mySheet.SetCellValue(1, 8, PK_DAILY_TA_WORKING_DATE);
			//첫번째 열에서 두번째에다가 변수이름:PK_DAILY_TA_WORKING_DATE를 추가한다.
		}
	}
	function mySheet_OnRowSearchEnd(Row) {
		if (mySheet.GetCellValue(Row, 3) != "요청") {
			mySheet.SetRowEditable(Row, 0);
		}
		var num = mySheet.GetCellValue(Row, 11)
		var num1 = mySheet.GetCellValue(Row, 10)
		num = Number(num1) - Number(num)
		mySheet.SetCellValue(Row, 12, num)
		mySheet.SetCellValue(Row, 0, "R")

	}
	function mySheet_OnSelectCell() {

	}

	$(document).ready(
			function() {
				var now = new Date();
				var nyear = now.getFullYear();

				//년도 selectbox만들기               
				for (var sy = 2015; sy <= nyear; sy++) {
					$('#fd_year').append(
							'<option value="' + sy + '">' + sy + '년</option>');
				}

				jQuery("#fd_year  > option[value=" + nyear + "]").attr(
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
		if ((date + "").length < 2) { //2자리가 아니면 0을 붙여줌.
			date = "0" + date;
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
						<s:message code="main.findHoliday" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<form class="form-inline">
				<br>
				<td class="item_title_border">기준년도</td> <select id="fd_year"
					name="fd_year" style="width: 100px;" class="form-control"></select>
				</td> &emsp; &emsp; 전자결재 상태 <select id="HOLIDAY_PAY" , name="HOLIDAY_PAY"
					class="form-control" style="width: 150px;">
					<option value="">전자 결재 상태</option>
					<option value="요청">요청</option>
					<option value="반려">반려</option>
					<option value="`승인">승인</option>
				</select> <br>
				<div class="ib_function float_right">
					<a href="javascript:doAction('insert')"
						class="btn btn-outline btn-primary">추가</a> <a
						href="javascript:doAction('search')"
						class="btn btn-outline btn-primary">조회</a> <a
						href="javascript:doAction('save')"
						class="btn btn-outline btn-primary">저장</a>
				</div>
			</form>

			<div class="exp_product"></div>
			<!-- 공간을 넓게 -->
			<div class="ib_product">
				<script>
					createIBSheet("mySheet", "100%", "100%");
				</script>
			</div>
		</div>

		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>