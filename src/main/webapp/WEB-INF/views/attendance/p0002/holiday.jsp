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
				MinWidth : 40
			}, {
				Header : "전자결재 상태",
				Type : "Text",
				SaveName : "holiday_PAY",
				MinWidth : 30
			}, {
				Header : "삭제",
				Type : "DelCheck",
				SaveName : "DEL_CHK",
				MinWidth : 40
			}, {
				Header : "신청일",
				Type : "Date",
				SaveName : "holiday_REGIST",
				MinWidth : 80,
				Edit : 0
			}, { 
				Header : "성명",
				Type : "Text",
				SaveName : "sawon_NAME",
				MinWidth : 80
			}, {
				Header : "부서",
				Type : "Text",
				SaveName : "fk_DEPT_NAME",
				MinWidth : 80
			}, {
				Header : "직급",
				Type : "Text",
				SaveName : "rank_NAME",
				MinWidth : 80,
				Wrap : 1
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
			} ];
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
		var val1 = "&pk_SAWON_CODE=" + '<%=session.getAttribute("PK_SAWON_CODE")%>';
			mySheet.DoSearch("${contextPath}/attendance/p0002/searchList_holi.do", val1);
			alert("val1 : " +val1)
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			break;

		case "save": // 저장
			mySheet.DoSave("${contextPath}/attendance/p0002/insertData_holi.do");
			console.log("save");
			break;

		case "insert": //신규행 추가
			var row = mySheet.DataInsert();
			selectSite();
			break;
		}
	}
   
   
// 	 function mySheet_OnSearchEnd() {
// 		// mySheet.SetRowEditable(1, 0);
// 		//  1열 수정불가
// 		 alert("1");
// 	 }
	 //5번째 행을 수정할수 있게해줌
  function selectSite() {
      $.ajax({ // 
         url : "${contextPath}/attendance/p0002/searchList.do",//목록을 조회 할 url
         type : "POST",
         dataType : "JSON",
         data : { "pk_SAWON_CODE": val1},
         success : function(data) {
            var NAME_CODE = ""; // 성명 
            var DEPT_CODE = ""; // 부서
            var RANK_CODE = ""; // 직급코드
            for (var i = 0; i < data['Data'].length; i++) {
         	   NAME_CODE = data['Data'][i].sawon_NAME;
         	   DEPT_CODE = data['Data'][i].fk_RANK_NAME;
         	   RANK_CODE = data['Data'][i].rank_NAME;
               
                  mySheet.SetCellValue(1,4,NAME_CODE);
                  mySheet.SetCellValue(1,5,DEPT_CODE);
                  mySheet.SetCellValue(1,6,RANK_CODE);
                  
            }
            alert(NAME_CODE);
         },
         error : function(jqxhr, status, error) {
            alert("에러");
         }
      });
   }
   
   // mySheet 조회 끝나기 직전 이벤트 
//   function mySheet_OnSearchEnd() {
//       if(mySheet.GetCellValue(1,1) == -1 ){
<%--     	  val2 = '<%=session.getAttribute("PK_SAWON_CODE")%>'; --%>

// 			var PK_DAILY_TA_WORKING_DATE = document
// 					.getElementById("PK_DAILY_TA_WORKING_DATE").value;
// 			mySheet.SetCellValue(1, 5, PK_DAILY_TA_WORKING_DATE);
// 			//첫번째 열에서 두번째에다가 변수이름:PK_DAILY_TA_WORKING_DATE를 추가한다.
// 		}
// 	}
	// let today = new Date();
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
			기준년도
			<td><select id="year" name="year">
			</select></td>
			</tr>
</body>

&emsp; &emsp; &emsp; 전자결재 상태
<select name="HOLIDAY_PAY">
	<option value="">전자 결재 상태</option>
	<option value="대기">대기</option>
	<option value="반려">반려</option>
	<option value="완료">완료</option>
</select>
<br>
<div class="ib_function float_right"></div>

<div class="ib_function float_right">
	<a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
	<a href="javascript:doAction('search')" class="f1_btn_gray lightgray">조회</a>
	<a href="javascript:doAction('save')" class="f1_btn_gray lightgray">저장</a>
</div>

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