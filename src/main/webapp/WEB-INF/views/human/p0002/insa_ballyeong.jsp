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
<script src="${contextPath}/resources/ibsheet/ibtab.js"></script>
<script src="${contextPath}/resources/ibsheet/ibtabinfo.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${contextPath}/resources/css/ibtab-style.min.css">

<link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">

 <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/dynatree/jquery.dynatree.js"></script>

<script>
   var pageheightoffset = 200;
   var i = 0;
   /*Sheet 기본 설정 */
   function LoadPage() {
	   //ibtab 생성
		createIBTab($('#tab1')[0], $('#tab_contents')[0], 'myTabs1', {
			themes: {
				tabs: "simple_under_blue",
		       	contents: "simple_under_blue",
		       	contextMenu: "simple_under_blue"
		    },
			allowCloseBTN: false
		});
	   
			
// 		//ibtab2 생성
// 		createIBTab($('#tab2')[0], $('#tab_contents_2')[0], 'myTabs2', {
// 		    themes: {
// 		        tabs: "simple_under_blue",
// 		        contents: "simple_under_blue",
// 		        contextMenu: "simple_under_blue"
// 		    },
// 		    allowCloseBTN: false
// 		});   
	   
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1 };
      initData.Cols = [
    	 {Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
         {Header:"NO",Type:"Seq", Align:"Center"},
         {Header:"발령호수",Type:"Text", SaveName:"bal_NUM", Width:120, Align:"Center",Edit:1,HeaderCheck:1},
         {Header:"제목", Type: "Text",SaveName:"bal_TITLE",Width:200,  Align: "Center"},
		 {Header:"발령구분",Type:"Text",SaveName:"bal_DIV_CODE",Width:120, Align:"Center", Edit:0},
		 {Header:"발령일자",Type:"Date",SaveName:"bal_DATE",Width:120, Align:"Center"},
		 {Header:"저장/추가",Type:"Button", SaveName:"bal_ADD", Width:60, Align:"Center"}
      ];
      	createIBSheet2($("#ballyeong")[0],"mySheet", "100%", "300px");
		IBS_InitSheet(mySheet,initData);
     
        
//      mySheet2.SetTheme("GMT","MainTree"); // 발령등록
      
//       	//mySheet3 //대상자
//       	initData.Cols = [
//       		//체크박스 만들것
//       		{Header:"사원코드",Type:"Text",SaveName:"Seq", Align:"Center"},
//       		{Header:"사원명",Type:"Text", SaveName:"sName", Width:150, Align:"Left",TreeCol:1},
// 			{Header:"부서",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
// 			{Header:"직책",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
//        	];
      
//       	IBS_InitSheet(mySheet3,initData);
//       	mySheet3.SetRowBackColorI("#EDEDED");

//      mySheet.SetSelectionMode(3);
      	
      	doAction('list');
   }

  
   
   
   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
         case "search":
        	data = $("#ballyeong").detach();
            break;
         case "reload":
            mySheet.RemoveAll();
            break;
         case "save":
        	 $("#ballyeong_copy").after(data);
            break;
         case "insert":
            mySheet.DataInsert(); 
            break; 
         case "list":
        	 mySheet.DoSearch("${pageContext.request.contextPath}/human/p0002/ballyeong.do"); //
        	 break;
      }
   }
   
//    ------------------------------------------------------------------------------------
   function mySheet_OnSearchEnd() {
		if(mySheet.RowCount() == 0){	
			mySheet.DataInsert(-1);
		} // 조회시 조회내용이 없으면 한줄 추가
	 
		mySheet.SetCellValue(mySheet.RowCount(),'bal_ADD', '추가'); // 추가에 추가버튼
		if(mySheet.GetCellValue(mySheet.RowCount(),'STATUS') == 'U' )
			mySheet.SetCellValue(mySheet.RowCount(),'STATUS', 'R'); // 추가버튼때문에 '수정'으로 뜬것을 다시 조회로 변경 
		
	}
	
	// 추가버튼 누를시 현제 row에 있는 추가버튼을 없애고, 다음 Row에 추가버튼을 추가한다.
	function mySheet_OnButtonClick(Row, Col) {  
		mySheet.SetCellValue(Row, Col, "");
		mySheet.DataInsert(-1);
		
		mySheet.SetCellValue(Row+1, Col, "추가");
	} 
	
	
	// 새로 추가된 row중 마지막 row가 삭제될시 추가버튼을 이전 row에 추가한다.
	function mySheet_OnRowDelete(row, api) {
		if(row == mySheet.RowCount()){
			mySheet.SetCellValue((row-1), mySheet.LastCol(),"추가");
		}
	} 
//   ------------------------------------------------------------------------------------
   function mySheet_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) {     //팝업을 연다. 
	   if(Col == 4){
		   $.ajax({
		        url: "ballyeong_Popup.do",
		        type: "post"        
		    }).success(function(result){
		                $("#popupUsers").html(result);
		                Loading();
		                if(i == 0){
		                	createIBSheet2($("#ib-container1")[0],"mySheet4", "100%", "300px");
		              		IBS_InitSheet(mySheet4,initData);
		            		Action_popup('list');
		            		i++;
		                }else{
		                	alert("확인중입니다.");
		                	$("#ib-container1_copy").after(data);
		                }
		    });
		   $("#popupUsers").modal("show");
	   }
   }     
   
   function fn_selectDept(codenm) {
	    mySheet.SetCellValue(1,'bal_DIV_CODE',codenm);
	    $("#bal_div_code").text(codenm);
	    data = $("#ib-container1").detach();
	    $("#popupDept").modal("hide");
	}
   
    
</script>

<body onload="LoadPage()">
  <div id="wrapper">
		<div id="page-wrapper" style="margin: 0px;">

		<!--tab 하단의 메인 타이틀(제목) 들어가는 부분 -->
		<div class="row">
			<div class="col-lg-12">        <!-- 해당 메뉴의 아이콘 -->        <!-- 해당 메인 타이틀(제목) 들어가는 부분 -->
				<h1 class="page-header"><i class="fa fa-users fa-fw"></i> <s:message code="main.per3"/></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
  <div class="main_content">
		<!-- 버튼 -->
		<div class="ib_function float_right">
			<a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
			<a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
			<a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
			<a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
		</div>

		<div class="clear hidden"></div>
		
		<div class="ib_product" style="width:100%;float:left">
			<!-- left -->
			<div style="height:100%;width:45%;float:left">
				<div id="ballyeong_copy"></div>
				<div id="ballyeong"></div>
			</div>
			
			<!-- 좌우를 나누는 빈공간 -->
			<div style="height:100%;width:5%;float:left"></div>
			
			<!-- right -->
			<div style="height:100%;width:45%;float:left">
				<!-- 아래 tab기능_2 -->
				
				<div id="tab1" class="ib-tab-tabs">
					<div class="ib-tab-tabs-item">
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">발령등록</span></a>
					</div>
				</div>
				
				<div id="tab_contents" class="ib-tab-contents">
					<div class="ib-tab-contents__item">
						<table class="tb01" style="width: 100%; min-width:400px">
							<colgroup>
								<col style="width: 12%;"></col>
								<col style="width: 12%;"></col>
								<col style="width: 1%;"></col>
								<col style="width: 20%;"></col>
								<col style="width: 55%;"></col>
							</colgroup>
							<tr>  
								<td class="bg01_r">발령구분</td><!-- 이름 변경해야함 -->
								<td class="bg02_l" id="bal_div_code"></td>
								<td class="bg01_r" colspan="3"></td>
							</tr>
						  
							<tr>
								<td class="bg01_r">발령자</td>
								<td class="bg02_l">
									<input type="text" id="isa_ADDR_ZIP" style="width: 98%; ">
								</td>
								<td class="bg02_l">
									<img src='${contextPath}/resources/image/search_icon.png;' onclick='Postcode();' style='cursor:pointer;' />
								</td>
								<td class="bg02_l">
									<input type="text" id="isa_ADDRESS" style="width:100%;">
								</td>
								<td class="bg01_r"></td>
							</tr>
						
							<tr>
								<td class="bg01_r">발신사업장</td><!-- 이름 변경해야함 -->
								<td class="bg02_l" id="bal_div_code"></td>
								<td class="bg01_r" colspan="3"></td>
							</tr>
						
							<tr>
								<td class="bg01_r">발신부서</td><!-- 이름 변경해야함 -->
								<td class="bg02_l" id="bal_div_code"></td>
								<td class="bg01_r" colspan="3"></td>
							</tr>
						     
							<tr>
								<td class="bg01_r">참조</td><!-- 이름 변경해야함 -->
								<td class="bg02_l" id="bal_div_code" colspan="3">
									<input type="text" id="isa_ADDRESS" style="width:100%;">
								</td>
								<td class="bg01_r" ></td>
							</tr>
						</table> 
					</div>
				</div>
				
<!-- 				위아래를 나누는 빈공간 -->
<!--             	<div style="height:5%"></div> -->


<!--	 				<div id="tab2" class="ib-tab-tabs"> -->
<!-- 						<div class="ib-tab-tabs-item"> -->
<%-- 							<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">대상자</span></a> --%>
<!-- 						</div> -->
<!-- 					</div> -->

<!--             	<div id="tab_contents2" class="ib-tab-contents"> -->
<!-- 					<div id="tab2" class="tabcontent2" style="height:45%; display: block;">  -->
<%-- 						<script type="text/javascript"> createIBSheet("mySheet3", "100%", "100%"); </script>  --%>
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>
        
		</DIV>
    		<!--main_content-->
		</div>
	</div>
	  <div id="popupUsers" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  		
	  </div>    
</body>
</html>