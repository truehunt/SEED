<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외근보고서</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script language="javascript">
	window.onload = function() {
		var syear = 2000
		var eyear = 2019

		var stryear = "";

		for (var i = eyear; i > syear; i--) {
			stryear += "<option value = "+i+">" + i + "</option>";
		}
		document.getElementById("year").innerHTML = stryear
	}
	}
</script>

</head>
<body>
	<h3>외근보고서</h3>
	<h6>
		기준년도
		<td><select id="year" name="year">
		</select></td>
		</tr>
</body>

&emsp; &emsp; &emsp; 전자결제 상태
<select name="PAY">
	<option value="">전자 결재 상태</option>
	<option value="작성">작성</option>
	<option value="반려">반려</option>
	<option value="완료">완료</option>
</select>

<input type="button" value="검색" style="float: right;">
<BR>사원 번호 :
<input type="TEXT" name="SAWON_ID" SIZE="10">


<BR>
<BR>휴가신청
<BR>사원번호
<input type="TEXT" name="SAWON_ID" SIZE="10"> &emsp; 성명
<input type="TEXT" name="SAWON_NM" SIZE="10"> &emsp; 연차기간
<input type="TEXT" name="ANNUAL STR" SIZE="10"> ~
<input type="TEXT" name="ANNUAL END" SIZE="10">
<BR>발생일수
<input type="TEXT" name="ANNUAL YEAR" SIZE="10"> &emsp; 사용일수
<input type="TEXT" name="ANNUAL USE" SIZE="10"> &emsp; 잔여일수
<input type="TEXT" name="LEFT ANNUAL" SIZE="10"> &emsp;
<br>
<br>
<script language="javascript">
var pageheightoffset = 200;

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
		//------------------------------------------------------
		// 목록만들기
		{
			Header : "",
			Type : "DelCheck",
			SaveName : "STATUS",//디비명
			MinWidth : 80,
			Align : "Center"
		}, {
			Header : "사원번호",
			Type : "SAWON_CODE",
			SaveName : "DEL_CHK",//디비명
			MinWidth : 80,
			
		}, {
			Header : "성명",
			Type : "Text",
			SaveName : "cust_id",
			MinWidth : 80,
			Align : "Center",
		}, {
			Header : "부서",
			Type : "Text",
			SaveName : "cust_name",
			MinWidth : 80,
			
		}, {
			Header : "입사일자",
			Type : "Text",
			SaveName : "cust_address",
			MinWidth : 80,
			MultiLineText : 1
		}, {
			Header : "근속기준일",
			Type : "Text",
			SaveName : "cust_state",
			MinWidth : 80,
			Wrap : 1
		}, {
			Header : "근속년수",
			Type : "Text",
			SaveName : "cust_zip",
			MinWidth : 80
		}, {
			Header : "잔여연차",
			Type : "Text",
			SaveName : "cust_state",
			MinWidth : 80
		}, {
			Header : "근속연차",
			Type : "Text",
			SaveName : "cust_contact",
			MinWidth : 80
		}, {
			Header : "당년연차",
			Type : "Text",
			SaveName : "cust_email",
			MinWidth : 80
		}, {
			Header : "사용연차",
			Type : "Text",
			SaveName : "cust_contact",
			MinWidth : 80
		},];
		IBS_InitSheet(mySheet, initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		//mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/attendance/p0001/searchList.do",
					param);
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
<script type="text/javascript" src="/common/js/calendar.js"></script>
<script language="javascript">
	$(function() {
		// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
		// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

		//시작일.
		$('#fromDate').datepicker({
			showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage : "images/duke.png", // 버튼 이미지
			buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
			dateFormat : "yy-mm-dd", // 날짜의 형식
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			//minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
			onClose : function(selectedDate) {
				// 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#toDate").datepicker("option", "minDate", selectedDate);
			}
		});

		//종료일
		$('#toDate').datepicker({
			showOn : "both",
			buttonImage : "images/duke.png",
			buttonImageOnly : true,
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			//minDate: 0, // 오늘 이전 날짜 선택 불가
			onClose : function(selectedDate) {
				// 종료일(toDate) datepicker가 닫힐때
				// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
				$("#fromDate").datepicker("option", "maxDate", selectedDate);
			}
		});
	});
	
</script>
</head>

<body>
<br>
<br>
<br> 외근보고서
<br>
<br> 휴가 구분
<select name="HOLIDAY DIVISION">
	<option value="">휴가구분</option>
	<option value="연차휴가">연차휴가</option>
	<option value="경조휴가">경조휴가</option>
	<option value="기타휴가">기타휴가</option>
</select> &emsp; 전일 /반일
<select name="ALL DAY">
	<option value="">전일 / 반일</option>
	<option value="전일">전일</option>
	<option value="반일">반일</option>
</select>
<BR>휴가기간

	<form>
		<input type="text" name="fromDate" id="fromDate"> ~ <input
			type="text" name="toDate" id="toDate">
	</form>
	전자 결재 상태
	<input type="TEXT" name="PAY" SIZE="10"> &emsp; 휴가사유
	<input type="TEXT" name="HOLIDAT REASON" SIZE="10"> &emsp;
	<br>
	<br>
	<input type="button" value="저장" style="float: right;">
	<input type="button" value="삭제" style="float: right;">
	<input type="button" value="신규" style="float: right;">
	<!-- 달력 이미지 안뜸 -->
</body>
</html>