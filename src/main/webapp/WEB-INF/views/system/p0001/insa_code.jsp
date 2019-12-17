<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>  
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet">

<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
   function LoadPage() {
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1   };
      initData.Cols = [
      	//{Header:"No",Type:"Seq", Align:"Center"},
      	//{Header:"",Type:"DummyCheck", SaveName:"chk", Width:35, Align:"Center",Edit:1,HeaderCheck:1},
      	{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
        {Header:"코드",Type:"Text", SaveName:"pk_PERSON_BC_CODE_NUM", Width:60, Align:"Center",Edit:0},
        {Header:"관리항목명",Type:"Text", SaveName:"person_BC_MNGEMENT_NAME", Width:120, Align:"Center",Edit:0},
        {Header:"수정여부",Type:"Text", SaveName:"person_BC_MODIFY_WHE", Width:80, Align:"Center",Edit:0}
      ];
      
      IBS_InitSheet(mySheet,initData);
      mySheet.SetDataAutoTrim(0);
      
      //행 숨김
      mySheet.SetColHidden([
    	  {Col: 0, Hidden:1} //상태
      ]); 

      
//    mySheet2.SetTheme("GMT","MainTree");
      initData.Cols = [
    	 {Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
  		 {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
  		 {Header:"코드",Type:"Text",SaveName:"fk_PERSON_BC_CODE_NUM",MinWidth:50},
         {Header:"상세코드",Type:"Text", SaveName:"pk_PERSON_BC_DETAI_CODE_NUM", Width:60, Align:"Center"},
         {Header:"update용코드",Type:"Text", SaveName:"copy_CODE_NUM", Width:60, Align:"Center"},
         {Header:"관리내역명",Type:"Text", SaveName:"person_BC_DETAI_MNGEMENT_NAME", Width:100, Align:"Center"},
         {Header:"사용여부",Type:"Text", SaveName:"person_BC_DETAI_NOT_USE", Width:80, Align:"Center"},
         {Header:"비고",Type:"Text", SaveName:"person_BC_DETAI_REMARKS", Width:90, Align:"Center"},
         {Header:"fk_Code",Type:"Text", SaveName:"pk_PERSON_BC_CODE_NUM", Width:90, Align:"Center", Hidden:1}
      ];
      
      IBS_InitSheet(mySheet2,initData);
      mySheet2.SetRowBackColorI("#EDEDED");
	
      mySheet2.SetColHidden([
    	  {Col: 0, Hidden:1}, //상태
    	  {Col: 2, Hidden:1},  //코드
    	  {Col: 4, Hidden:1} //update
      ]); 
   }

   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
      	//조회
         case "search":
            mySheet.DoSearch("${pageContext.request.contextPath}/system/p0001/searchList.do");
			break;
		//초기화
		case "reload":
			mySheet.RemoveAll();
			mySheet2.RemoveAll();
			break;
		//저장
		case "save":
			var sRow = mySheet2.FindStatusRow("U"); // 수정 하는 곳을 찾는다
			var dRow = mySheet2.FindStatusRow("D"); // 삭제
			var arrow = sRow.split(";"); // 위에서 찾은 위치를 배열로서 저장
			var Darrow = dRow.split(";");
			//
			for (var i = 0; i < arrow.length; i++) {
				var row = arrow[i];
				var code = mySheet2.CellSearchValue(row, 3);
				mySheet2.SetCellValue(row, 4, code);
			}
			// 삭제하는 곳에 fk_code를 set
			for (var j = 0; j < Darrow.length; j++) {
				var D_row = Darrow[j];
				mySheet2.SetCellValue(D_row, 'pk_PERSON_BC_CODE_NUM', code_num);
			}
			mySheet2.DoSave("${pageContext.request.contextPath}/system/p0001/insertData.do");
			break;
		//추가 - 코드부분들어감
		case "insert":
			mySheet2.DataInsert(-1);
			//코드부분 들어가는 코딩
			var select_row = mySheet2.GetSelectRow();
			var col = 2;
			mySheet2.SetCellValue(select_row, col, code_num);
			break;
		//인사(H,R) 선택시
		case "insa":
			var param = "person_BC_OUTPUT=" + document.getElementById("insa").value;
			mySheet.DoSearch("${pageContext.request.contextPath}/system/p0001/output.do",param);
			break;
		//근태(T) 선택시
		case "tae":
			var param = "person_BC_OUTPUT=" + document.getElementById("tae").value;
			mySheet.DoSearch("${pageContext.request.contextPath}/system/p0001/output.do",param);
			break;
		//급여(P) 선택시
		case "salary":
			var param = "person_BC_OUTPUT=" + document.getElementById("salary").value;
			mySheet.DoSearch("${pageContext.request.contextPath}/system/p0001/output.do",param);
			break;
		//사원그룹(G) 선택시
		case "group":
			var param = "person_BC_OUTPUT=" + document.getElementById("group").value;
			mySheet.DoSearch("${pageContext.request.contextPath}/system/p0001/output.do",param);
			break;
		//기타(E) 선택시
		case "other":
			var param = "person_BC_OUTPUT=" + document.getElementById("other").value;
			mySheet.DoSearch("${pageContext.request.contextPath}/system/p0001/output.do",param);
			break;
		//시스템설정(S) 선택시
		case "system":
			var param = "person_BC_OUTPUT=" + document.getElementById("system").value;
			mySheet.DoSearch("${pageContext.request.contextPath}/system/p0001/output.do",param);
			break;

		}
	}

	// 기타 이벤트 //마우스 클릭시
	function mySheet_OnSelectCell(oldrow, oldcol, row, col) {
		x = "fk_PERSON_BC_CODE_NUM=" + mySheet.GetCellValue(row, 1);
		code_num = mySheet.GetCellValue(row, 1);
		Modify = mySheet.GetCellValue(row, 3);
		mySheet2.DoSearch("${pageContext.request.contextPath}/system/p0001/detai.do", x);
	}

// 	// 기타이벤트 // 키보드 버튼이 올라올 시
// 	function mySheet2_OnKeyUp(Row, Col, KeyCode, Shift) {
// 		if (Modify == 1) { //인사코드 부분 - 수정 가능일시이니까 / 인사기록카드에서는 상관x
// 			if (KeyCode == 13 && Col == mySheet2.LastCol()
// 					&& Row == mySheet2.RowCount()) { // 엔터를 누르고 / col이 마지막 col이고 / row가 마지막 열일경우
// 				doAction("insert");
// 			}
// 		}
// 	}
</script>

<body onload="LoadPage()">
	<div id="wrapper">
		<div id="page-wrapper" style="margin: 0px;">

			<!--tab 하단의 메인 타이틀(제목) 들어가는 부분 -->
			<div class="row">
				<div class="col-lg-12">        <!-- 해당 메뉴의 아이콘 -->        <!-- 해당 메인 타이틀(제목) 들어가는 부분 -->
					<h1 class="page-header"><i class="fa fa-cog fa-fw"></i> <s:message code="main.setup4"/></h1>
				</div>
                <!-- /.col-lg-12 -->
            </div>
            
         <!-- 버튼 -->
		<div class="ib_function float_right">
			<button class="btn btn-outline btn-primary" onclick="doAction('insert')"><s:message code="board.append"/></button>
			<button class="btn btn-outline btn-primary" onclick="doAction('save')"><s:message code="common.btnSave"/></button>
		</div>
		
		<!-- SELECT문 기본기능으로 가져옴 확인바람 -->
		<form class="form-inline" style="margin:20px">
			<label for="Bal_DIV">출력구분</label>
			<select class="form-control" id="selTheme" onchange="doAction(this.value)">
				<option value="">----</option>
				<option value="insa" id="insa" >0. 인사(H,R)</option>
    			<option value="tae" id="tae">1. 근태(T)</option>
    			<option value="salary" id="salary">2. 급여(P)</option>
	    		<option value="group" id="group">3. 사원그룹(G)</option>
    			<option value="other" id="other">4. 기타(E)</option>
    			<option value="system" id="system">5. 시스템설정(S)</option>
			</select>
<!-- 			<div class="form-group"> -->
<!--     			<label for="balDate">발령일자</label> -->
<!-- 				<input type="text" class="form-control" id="balDate" readonly> -->
<!--         	</div>  -->
        	<hr style="border: solid 1px gray ;">
		</form>
		
		
  		<div class="main_content">
		<div class="ib_product" style="width:100%;float:left">
			<div style="height:100%;width:20.6%;float:left">
				<script>createIBSheet("mySheet", "100%", "100%");</script>
			</div>
			
			<div style="height:100%;width:1%; float:left"></div>
			
			<div style="height:100%;width:50%;float:left">
				<script> createIBSheet("mySheet2", "100%", "100%"); </script> 
			</div>
		</div>
	</DIV>
	</div>
	</div>
	
</body>
</html>