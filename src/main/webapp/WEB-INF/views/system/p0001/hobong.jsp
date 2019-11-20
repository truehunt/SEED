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
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet">
 
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>    
<script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>    
<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>    

<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
   function LoadPage() {
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1 };
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
  		 {Header:"호봉|호봉",Type:"Text",SaveName:"fk_HOBONG_CODE", MinWidth:50, Edit:0},
  		 {Header:"호봉테이블|기본급",Type:"Int", SaveName:"hobong_TABLE_PRICE", Width:120, Align:"Center","Format": "#,###",Edit:0},
  		 {Header:"합계|합계",Type:"Int", SaveName:"SUM", CalcLogic: "|hobong_TABLE_PRICE|", Width:60, Align:"Center"},
      ];
      
      IBS_InitSheet(mySheet2,initData);
      mySheet2.SetRowBackColorI("#EDEDED");
      mySheet2.SetEditEnterBehavior("down"); // 엔터 누를시 아래로 이동 
      
      mySheet2.SetColHidden([
    	  {Col: 0, Hidden:1}, //상태
      ]); 
      
      
      initData.Cols = [
        	//{Header:"No",Type:"Seq", Align:"Center"},
        	//{Header:"",Type:"DummyCheck", SaveName:"chk", Width:35, Align:"Center",Edit:1,HeaderCheck:1},
        	{Header:"상태|상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"호봉이력|적용시작년월",Type:"Date", SaveName:"hobong_TABLE_START_DATE_APPLI", Width:120, Align:"Center",Edit:0, Format: "Ym"},
			{Header:"호봉이력|적용종료월",Type:"Date", SaveName:"hobong_TABLE_END_DATE_APPLI", Width:120, Align:"Center",Edit:0, Format: "Ym"},
			{Header:"직급코드|직급코드",Type:"Text", SaveName:"fk_RANK_CODE", Width:10, Align:"Center",Edit:0}
        ];
        
        IBS_InitSheet(mySheet3,initData);
        mySheet3.SetDataAutoTrim(0);
        
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
		//저장
		case "save":
			mySheet2.DoSave("${pageContext.request.contextPath}/system/p0001/updateHB.do",sta_app);
			break;
		//추가 - 코드부분들어감
		case "list":
            mySheet.DoSearch("${pageContext.request.contextPath}/system/p0001/hobongCode.do");
       	 	break;
		}
	}

	// 기타 이벤트 //마우스 클릭시
	function mySheet_OnSelectCell(oldrow, oldcol, row, col) {
		rank_code = mySheet.GetCellValue(row, 1);
		fk_RANK_CODE = "fk_RANK_CODE=" + rank_code;
		mySheet3.DoSearch("${pageContext.request.contextPath}/system/p0001/hobongApp.do", fk_RANK_CODE);
	}
	
	// 조회이벤트 끝날 시
	function mySheet3_OnSearchEnd() {
		mySheet3.DataInsert(-1); 
		var i = mySheet3.RowCount() +1;
		mySheet3.SetCellEditable(i, 1, 1);
	}
	
	function mySheet3_OnSelectCell(oldrow, oldcol, row, col) {
		if(row > 1 && col == 1){
				sta_app = "hobong_TABLE_START_DATE_APPLI=" + mySheet3.GetCellValue(row,1) +"&" + fk_RANK_CODE;
				mySheet2.DoSearch("${pageContext.request.contextPath}/system/p0001/hobongTable.do", sta_app);
				
				if(mySheet3.GetCellValue(row,2) == ""){
					mySheet2.SetColEditable(2,1);
				}else{
					mySheet2.SetColEditable(2,0);
				}
		}
	}
	
	function mySheet3_OnKeyUp(Row,Col,KeyCode,Shift) { 
		if(KeyCode == 13 && (Row-1) == mySheet3.RowCount()){
			if(Row == 2 && Col == 1){
				mySheet3.SetCellValue(Row, 3, rank_code);
				mySheet3.DoSave("${pageContext.request.contextPath}/system/p0001/insertHB.do");
			}else if(Row != 2 && Col == 1){
				if(mySheet3.GetCellValue(Row,Col) > mySheet3.GetCellValue(Row-1,Col)){
					mySheet3.SetCellValue(Row, 3, rank_code);
					if(Row != 2 && mySheet3.GetCellValue(Row-1, 2) == ""){
						if(mySheet3.GetCellValue(Row,1) == 1){
							mySheet3.SetCellValue(Row-1,2,mySheet3.GetCellValue(Row,1));
						}else{
							var year = mySheet3.GetCellValue(Row,1).substr(0,4);
							var month = mySheet3.GetCellValue(Row,1).substr(4,2);
							if(month-1 == "00"){
								mySheet3.SetCellValue(Row-1,2,(year-1)+"12");
								alert((year-1)+"12");
							}else{
								mySheet3.SetCellValue(Row-1,2,mySheet3.GetCellValue(Row,1)-1);	
							}
						}
					}
					mySheet3.DoSave("${pageContext.request.contextPath}/system/p0001/insertHB.do");
				}else{
					alert("저장할 년월은 이전년월보다 커야합니다.");
				}
			}
		} 
	} 
	
	function mySheet3_OnSaveEnd() { 
		mySheet3.DataInsert(-1);
		console.log(mySheet3.RowCount());
		mySheet3.SetCellEditable(mySheet3.RowCount(), 1, 0);
		mySheet3.SetCellEditable(mySheet3.RowCount()+1, 1, 1);
	}

</script>

<body onload="LoadPage()">
<div id="wrapper">

        <div id="page-wrapper" style="margin: 0px;">

	<!--tab 하단의 메인 타이틀(제목) 들어가는 부분 -->
	<div class="row">
		<div class="col-lg-12">        <!-- 해당 메뉴의 아이콘 -->        <!-- 해당 메인 타이틀(제목) 들어가는 부분 -->
			<h1 class="page-header"><i class="fa fa-cog fa-fw"></i> <s:message code="main.setup1"/></h1>
		</div>
			<!-- /.col-lg-12 -->
	</div>
	
  <div class="main_content">
		<!-- 버튼 -->
		<div class="ib_function float_right">
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
	</div>
        <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
</body>
</html>