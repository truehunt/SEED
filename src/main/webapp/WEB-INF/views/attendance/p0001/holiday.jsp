<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가신청</title>
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
</script>

</head>
<body>
	<h3>휴가 신청</h3>
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
<td width="547" height="45" align="left" class="A_HOLIDAY">휴가 신청 내역</td>
<div class="container">
	<div class="row">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<td width="09%"
						style="background-color: #eeeeee; text-align: center;">NO</td>&emsp;
					<td width="12%"
						style="background-color: #eeeeee; text-align: center;">신청일</td>&emsp;
					<td width="10%"
						style="background-color: #eeeeee; text-align: center;">휴가구분</td>&emsp;
					<td width="20%"
						style="background-color: #eeeeee; text-align: center;">전일/반일</td>&emsp;
					<td width="10%"
						style="background-color: #eeeeee; text-align: center;">시작일</td>&emsp;
					<td width="10%"
						style="background-color: #eeeeee; text-align: center;">종료일</td>&emsp;
					<td width="10%"
						style="background-color: #eeeeee; text-align: center;">일수</td>&emsp;
					<td width="10%"
						style="background-color: #eeeeee; text-align: center;">전자결재상태</td>&emsp;
				</tr>
			</thead>
		</table>
	</div>
</div>
<br>
<br>
<br> 휴가신청
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
<script type="text/javascript" src="/common/js/calendar.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
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