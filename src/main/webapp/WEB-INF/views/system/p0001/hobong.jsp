<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
   function LoadPage() {
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1   };
      initData.Cols = [
      	{Header:"상태|상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
        {Header:"대상직급|코드",Type:"Text", SaveName:"pk_PERSON_BC_DETAI_CODE_NUM", Width:60, Align:"Center",Edit:0},
        {Header:"대상직급|직급",Type:"Text", SaveName:"person_BC_DETAI_MNGEMENT_NAME", Width:120, Align:"Center",Edit:0}
      ];
      
      IBS_InitSheet(mySheet,initData);
      mySheet.SetDataAutoTrim(0);
      
      //행 숨김
      mySheet.SetColHidden([
    	  {Col: 0, Hidden:1} //상태
      ]); 

      
//    mySheet2.SetTheme("GMT","MainTree");
      initData.Cols = [
    	 {Header:"상태|상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
  		 {Header:"호봉|호봉",Type:"Text",SaveName:"fk_PERSON_BC_CODE_NUM",MinWidth:50},
  		 {Header:"호봉테이블|기본급",Type:"Text", SaveName:"copy_CODE_NUM", Width:120, Align:"Center"},
  		 {Header:"합계|합계",Type:"Text", SaveName:"pk_PERSON_BC_DETAI_CODE_NUM", Width:60, Align:"Center"},
      ];
      
      IBS_InitSheet(mySheet2,initData);
      mySheet2.SetRowBackColorI("#EDEDED");
	
      mySheet2.SetColHidden([
    	  {Col: 0, Hidden:1}, //상태
      ]); 
      
      
      initData.Cols = [
        	//{Header:"No",Type:"Seq", Align:"Center"},
        	//{Header:"",Type:"DummyCheck", SaveName:"chk", Width:35, Align:"Center",Edit:1,HeaderCheck:1},
        	{Header:"상태|상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"호봉이력|적용시작년월",Type:"Date", SaveName:"hobong_TABLE_START_DATE_APPLI", Width:120, Align:"Center",Edit:0, Format: "Ym"},
			{Header:"호봉이력|적용종료월",Type:"Date", SaveName:"hobong_TABLE_APPLI_END_DATE", Width:120, Align:"Center",Edit:0, Format: "Ym"},
        ];
        
        IBS_InitSheet(mySheet3,initData);
        mySheet.SetDataAutoTrim(0);
        
        mySheet3.SetColHidden([
      	  {Col: 0, Hidden:1} //상태
        ]); 
        
        doAction('list');
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
			var sRow = mySheet2.FindStatusRow("U"); // 업데이트 하는 곳을 찾는다
			var arrow = sRow.split(";"); // 위에서 찾은 위치를 배열로서 저장
			for (var i = 0; i < arrow.length; i++) {
				var row = arrow[i];
				var code = mySheet2.CellSearchValue(row, 3);
				mySheet2.SetCellValue(row, 4, code);
			}
			mySheet2.DoSave("${pageContext.request.contextPath}/system/p0001/insertData.do");
			break;
		//추가 - 코드부분들어감
		case "insert":
			var select_row = mySheet2.GetSelectRow();
			var col = 2;
			mySheet2.SetCellValue(select_row, col, code_num);
			break;
		case "list":
            mySheet.DoSearch("${pageContext.request.contextPath}/system/p0001/hobongCode.do");
       	 	break;
		}
	}

	// 기타 이벤트 //마우스 클릭시
	function mySheet_OnSelectCell(oldrow, oldcol, row, col) {
		x = "fk_RANK_CODE=" + mySheet.GetCellValue(row, 1);
		mySheet3.DoSearch("${pageContext.request.contextPath}/system/p0001/hobongApp.do", x);
	}
	
	// 조회이벤트 끝날 시
	function mySheet3_OnSearchEnd() {
		mySheet3.DataInsert(-1); 
		var i = mySheet3.RowCount() +1;
		alert(i);
		mySheet3.SetCellEditable(i, 1, 1);
	}
	
	function mySheet3_OnChange(Row, Col, Value, OldValue, RaiseFlag) {
		alert(Row+", " + Col + " : " + Value) 
	} 
	 

</script>

<body onload="LoadPage()">
  <div class="page_title">
    <span><a class="closeDepth" href="#">closeDepth</a></span> 
    <span class="title">기초환경설정> <b>기초코드등록</b></span>
  </div>
  <div class="main_content">
		<!-- 버튼 -->
		<div class="ib_function float_right">
			<a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
			<a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
			<a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
		</div>
		
		<div class="ib_product" style="width:100%;float:left">
			<div style="height: 100%; width: 45%; float: left">
				<script>
					createIBSheet("mySheet", "100%", "100%");
				</script>
			</div>
			
			
			<div style="height: 100%; width: 30%; float: left">
				<script>
					createIBSheet("mySheet2", "100%", "100%");
				</script>
			</div>
			
			<div style="height: 100%; width: 5%; float: left"></div>
			
			<div style="height: 10px; width: 100%; float:left"></div>
			
			<div style="height:100%;width:50%;float:left">
				<script> createIBSheet("mySheet3", "100%", "100%"); </script> 
			</div>
			
		</div>	
			   
		<div class="clear hidden"></div>
		
		
	</DIV>
</body>
</html>