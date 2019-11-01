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
      	//{Header:"No",Type:"Seq", Align:"Center"},
      	//{Header:"",Type:"DummyCheck", SaveName:"chk", Width:35, Align:"Center",Edit:1,HeaderCheck:1},
      	{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
		{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
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
         {Header:"사용여부",Type:"Text", SaveName:"person_BC_DETAI_REMARKS", Width:80, Align:"Center"},
         {Header:"비고",Type:"Text", SaveName:"person_BC_DETAI_NOT_USE", Width:90, Align:"Center"},
      ];
      
      IBS_InitSheet(mySheet2,initData);
      mySheet2.SetRowBackColorI("#EDEDED");
	
      mySheet2.SetColHidden([
    	  {Col: 0, Hidden:1}, //상태
    	  {Col: 2, Hidden:1},  //코드
    	  {Col: 4, Hidden:1} //update
      ]); 
   }


   /* function mySheet_OnDropEnd(FromSheet, FromRow, ToSheet, ToRow, X, Y, Type) {
      //같은 시트에서는 데이터이동 안됨.
      //if(FromSheet == ToSheet) return;
      
      var rowjson = FromSheet.GetRowData(FromRow);
      
      //행 데이터 복사
      ToSheet.SetRowData(ToRow+1 , rowjson ,{Add:1} );
      
      //원본 데이터 삭제
      if(ToRow<FromRow) FromRow++;
      FromSheet.RowDelete(FromRow);
      
   }
 */   

   /* //드레그 드롭 데이터 이동
   function mySheet2_OnDropEnd(FromSheet, FromRow, ToSheet, ToRow, X, Y, Type) {
	   //같은 시트에서는 데이터이동 안됨.
	      //if(FromSheet == ToSheet) return;
	      
	      var rowjson = FromSheet.GetRowData(FromRow);
	      
	      //행 데이터 복사
	      ToSheet.SetRowData(ToRow+1 , rowjson ,{Add:1} );
	      
	      //원본 데이터 삭제
	      if(ToRow<FromRow) FromRow++;
	      FromSheet.RowDelete(FromRow);
   }
   
	var toggle = 1;
   	function mySheet_OnDragStart(row,col){
    	  if(toggle){
        	 if(row == 3) {
            
//            mySheet.SetRowDraggable(3,0);
//            setTimeout(function(){mySheet.SetRowDraggable(3,1);},100);
            	toggle=0;
         }
      }
      if(mySheet.CheckedRows("chk")>1)
      return "<div style='background-color:#FFFFFF;border:2px solid #666'> <h2>이동 중...<h2> </div>";
   }
 */


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
        	 for(var i=0; i<arrow.length; i++){
        		 var row = arrow[i];
        		 var code = mySheet2.CellSearchValue(row,3);
        		 mySheet2.SetCellValue(row,4,code);
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
        //인사 선택시
         case "insa":
        	 var param = "person_BC_OUTPUT=" +document.getElementById("insa").value;
             mySheet.DoSearch("${pageContext.request.contextPath}/system/p0001/output.do",param);
             break;
      }
   }
   
   
  

   ////////////////////////////////////////////////
   /* 
 	function fnAppendLog(msg) {
		var evt_log = document.getElementById("evt_log");
		evt_log.value = msg + "\n" + evt_log.value;
	} 
	// var code = mySheet2.CellSearchValue(row,3); // 원래 가지고있던 값을 가져온다 
	// 기타 이벤트 //마우스 더블클릭시
	function mySheet2_OnDblClick(row,col) {
		 var msg = "";

		msg += "[" + mySheet.GetCellValue(row,2)+   "] ";
		console.log(mySheet.GetCellValue(row,2));
		 if (document.getElementById('chkEtc').checked == true) 
			 fnAppendLog(msg)
	
	}*/
	
	// 기타 이벤트 //마우스 클릭시
	function mySheet_OnSelectCell(oldrow,oldcol,row,col) {
		x = "fk_PERSON_BC_CODE_NUM=" + mySheet.GetCellValue(row,2);
		code_num = mySheet.GetCellValue(row,2);
		mySheet2.DoSearch("${pageContext.request.contextPath}/system/p0001/detai.do",x);
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
		
		<br />
		<br />
		<br />
		
		<!-- SELECT문 기본기능으로 가져옴 확인바람 -->
		<div class="ib_function2 border_sheet">
				<table class="ib_column2">
					<tr>
						<th class="r20">출력구분</th>
						<td class="r20">
							<select id="selTheme" class="contentsLeftText" onChange="doAction(this.value);">
								<option value="">----</option>
								<option value="insa" id="insa" >인사</option>
    							<option value="salary" id="salary">급여</option>
    							<option value="ta" id="ta">근태</option>
    							<option value="other" id="other">기타</option>
							</select>	
						</td>
						<th class="r20">검색:</th>
						<td class="r20">
							<input type="text" id="p_id" name="p_id">
							<a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
						</td>
						
						<!-- 클릭하는 값에 대한 정보를 가져온다 -->
						<!-- // 기타 이벤트 //마우스 클릭시 확인 -->
						<td><input class="r20" type="hidden" checked="checked" id="chkEtc"/></td>
					 </tr>
					<tr>
				</table>
           </div>
           
		<div class="clear hidden"></div>
		<div class="ib_product" style="width:100%;float:left">
	
			<div style="height:100%;width:30%;float:left">
				<script>createIBSheet("mySheet", "100%", "100%");</script>
			</div>
			
			<div style="height:100%;width:5%; float:left"></div>
			
			<div style="height:100%;width:50%;float:left">
				<script> createIBSheet("mySheet2", "100%", "100%"); </script> 
			</div>
		</div>
		<!-- ---------------------- 로그 나오는부분 -------------------------
		
		CellSearchValue
				<div class="w50pro" style="height:100%">
					<div  style=";height:100%">
						<textarea id="evt_log" cols="40" style="width:100%;height:99%;border:1px solid #888888;"></textarea>
					</div>
				</div> 
        -->
	</DIV>
</body>
</html>