<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- select box 실행 안됌  => 다시 찾기 -->
<script language="javascript">	
	window.onload = function() {
		var syear = 2000
		var eyear = 2019

		var stryear = "";

		for (var i = eyear; i > syear; i--) 
		{
			stryear += "<option value = "+i+">" + i + "</option>";
		}
		document.getElementById("year").innerHTML = stryear
	}
</script>
	<script>
	// ibsheet

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
</script>
</head>
<body>
	<h3>휴가일수 계산</h3>
	<br>
	<h6>
		기준년도
		<td><select id="year" name="year">
		</select></td>
		</tr>
		&emsp; &emsp; &emsp; &emsp; 회원 코드   <input type="TEXT" name="SAWON_ID"
			SIZE="10"> <input type="button" value="검색"
			style="float: right;"> 
			<br>
			<div class="page_title">
		<br><br><br><br>
		<br><h4>휴가 일수 계산</h4>
		 <body onload="LoadPage()">
			<div class="exp_product">
				</form>
			</div>
			<div class="ib_function float_right">
<br><br><br><a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
			</div>
			<div class="clear hidden"></div>
			<div class="ib_product">
				<script>
					createIBSheet("mySheet", "100%", "100%");
				</script>
			</div>
		</div>
</body>
</html>
</body>
</html>