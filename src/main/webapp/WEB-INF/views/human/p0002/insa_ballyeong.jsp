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
<link href="${contextPath}/resources/js/datepicker/datepicker.css" rel="stylesheet" type="text/css">

 <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/dynatree/jquery.dynatree.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/daterangepicker/daterangepicker.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<script>
   var pageheightoffset = 200;
   var i = 0;
   var j = 0;
   var k_dept = 0;
   var num = 0;
   
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
	   
			
		//ibtab2 생성
		createIBTab($('#tab2')[0], $('#tab_contents_2')[0], 'myTabs2', {
		    themes: {
		        tabs: "simple_under_blue",
		        contents: "simple_under_blue",
		        contextMenu: "simple_under_blue"
		    },
		    allowCloseBTN: false
		});   
	   
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1 };
      	//mySheet3 //대상자
      	initData.Cols = [
      		//체크박스 만들것
      		{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
      		{Header:"NO",Type:"Seq", Align:"Center"},
      		{Header:"사원코드",Type:"Text",SaveName:"fk_BAL_SAWON_CODE", Align:"Center",Edit:0},
      		{Header:"사원명",Type:"Text", SaveName:"sawon_NAME", Width:150, Align:"Center",Edit:0},
			{Header:"부서",Type:"Text", SaveName:"dept_NAME", Width:60, Align:"Center",Edit:0},
			{Header:"직급",Type:"Text", SaveName:"rank_NAME", Width:60, Align:"Center",Edit:0},
			
			{Header:"발령자코드",Type:"Text", SaveName:"fk_BAL_CODE", Width:60, Align:"Center",Edit:0},
			{Header:"발령호수",Type:"Text", SaveName:"bal_NUM", Width:60, Align:"Center",Edit:0},
			{Header:"발령제목",Type:"Text", SaveName:"bal_TITLE", Width:60, Align:"Center",Edit:0},
			{Header:"발령구분",Type:"Text", SaveName:"bal_DIV_CODE", Width:60, Align:"Center",Edit:0},
			{Header:"발령일자",Type:"Text", SaveName:"bal_DATE", Width:60, Align:"Center",Edit:0}
       	];
      	createIBSheet2($("#tab2_contents")[0],"mySheet3", "100%", "300px");
      	IBS_InitSheet(mySheet3,initData);
      	
      	
      	doAction('list');
   }

  
   
   
   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
         case "save":
        	 mySheet3.DoSave("${pageContext.request.contextPath}/human/p0002/insertBal.do");
            break;
         case "insert":
        	  $.ajax({
      	        url: "ballyeong_target.do", // 알아서 주소를 칠 것.
      	        type: "post"        
      	    }).success(function(result){
      	                $("#popupTarget").html(result);
      	                Loading();
      	                if(j == 0){
      	                	createIBSheet2($("#ib-container3")[0],"mySheet6", "100%", "300px");
      	              		IBS_InitSheet(mySheet6,initData);
//       	            		Action_popup('list_sawon');
      	            		j++;
      	                }else{
      	                	$("#ib-container3_copy").after(container3);
      	                }
      	    });
      	    $("#popupTarget").modal("show");
            break; 
      }
   }
   
//    ------------------------------------------------------------------------------------
   function mySheet_OnSearchEnd() {
	   	
		// 저장/추가에 버튼이 없는곳은 Edit:0을 시켜준다.
		for(var bal_row=1; bal_row<=mySheet.RowCount(); bal_row++){
			mySheet.SetRowEditable(bal_row,0);
		}

	}
	
	// 추가버튼 누를시 현제 row에 있는 추가버튼을 없애고, 다음 Row에 추가버튼을 추가한다.
	function mySheet_OnButtonClick(Row, Col) {
		var save = mySheet.GetCellValue(Row, Col);
		if(save != '저장'){
			mySheet.SetCellValue(Row, Col, "");
			mySheet.DataInsert(-1);
			
			mySheet.SetCellValue(Row+1, Col, "저장");	
		}else{
			if(mySheet.GetCellValue(Row,Col-1) != ""){
				//save로직
				mySheet.DoSave("${pageContext.request.contextPath}/human/p0002/insertBal.do");
				mySheet.SetCellValue(Row,Col,'추가'); 
			}else{
				alert("발령일자를 적어주시기 바랍니다.");
			}
			
		}
	} 
	
	
	// 새로 추가된 row중 마지막 row가 삭제될시 추가버튼을 이전 row에 추가한다.
	function mySheet_OnRowDelete(row, api) {
		if(row == mySheet.RowCount()){
			mySheet.SetCellValue((row-1), mySheet.LastCol(),"추가");
		}
	} 
//   ------------------------------------------------------------------------------------
	// 발령구분 팝업
   function bal_div_Popup(){      
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
		                	$("#ib-container1_copy").after(container1);
		                }
		    });
		   $("#popupUsers").modal("show");
   }     
   
   function mySheet_OnSelectCell(OldRow, OldCol, NewRow, NewCol,isDelete) {
	   Newrow = NewRow; // 현재 row저장 

	   	if(OldRow != NewRow){ // Row가 달라졌을 때 초기화
		   	$("#bal_div_code").text(mySheet.GetCellValue(NewRow,'bal_DIV_CODE'));
		//	if문으로 해서 mySheet.GetCellValue(NewRow,'fk_BAL_CODE')의 값을 확인
			var _Bal_code = mySheet.GetCellValue(NewRow,'fk_BAL_CODE');
		
			if(_Bal_code != null && _Bal_code != ''){
//				 - 있을 경우 : 값이 있을경우에는 ajax로 검색을 해서 값을 넣는다.
				$.ajax({
	        			url: "Sawon.do", // 알아서 주소를 칠 것.
	    	    		type: "post",
	    	    		data: {"fk_BAL_CODE":_Bal_code},
						dateType: "JSON"
		    		}).success(function(result){
	    				$("#pk_SAWON_CODE").val(result['Data'][0].pk_SAWON_CODE);
	    				$("#pk_SAWON_NAME").text(result['Data'][0].sawon_NAME);
					    $("#sawon_DEPT").text(result['Data'][0].dept_NAME);
	    				$("#sawon_WORKPLACE").text(result['Data'][0].workplace_NAME);
	 	    		});
			}else{
// 				 - 없을 경우 : 아래와 같이 빈 값을 넣는다.
	 		   	$("#pk_SAWON_CODE").val('');
	 		   	$("#pk_SAWON_NAME").text('');
	 		   	$("#sawon_DEPT").text('');
	 		   	$("#sawon_WORKPLACE").text('');
			}
			
			// mySheet3 조회
			// 조회조건으로는 발령호수 / 발령구분 으로준다.
			var param = "bal_NUM=" + mySheet.GetCellValue(NewRow, 'bal_NUM') + "&bal_DIV_CODE=" + mySheet.GetCellValue(NewRow, 'bal_DIV_CODE');
			mySheet3.DoSearch("${pageContext.request.contextPath}/human/p0002/Sawon_Add_Search.do",param); // 이름 지을것.
		}
	   
   } 
	
   function fn_selectDept(codenm) {
	    $("#bal_div_code").val(codenm);
	    $("#popupUsers").modal("hide");
	}
   
// 부서선택
	function fn_DeptSelect(){
		// 저장이란 버튼이 있을 때 사용 불가.
		if(mySheet.GetCellValue(Newrow, 'bal_ADD') != '저장'){
		    $.ajax({
	        	url: "ballyeong_sawon.do", // 알아서 주소를 칠 것.
	    	    type: "post"        
		    }).success(function(result){
		                $("#popupDept").html(result);
	                	Loading();
	            	    if(k_dept == 0){
	        	        	createIBSheet2($("#ib-container2")[0],"mySheet5", "100%", "300px");
	    	          		IBS_InitSheet(mySheet5,initData);
		            		Action_popup('list_sawon');
		            		k_dept++;
	                	}else if(k_dept == 1){
	            	    	$("#ib-container2_copy").after(container2);
	        	        }
	    	});
	    	$("#popupDept").modal("show");
		}else{
			alert('데이터를 저장해주세요');
		}
	}
// 발령호수
	function fn_BallyeongNum(){
		    $.ajax({
	        	url: "BalNum.do", // 알아서 주소를 칠 것.
	    	    type: "post"        
		    }).success(function(result){
		                $("#popupNum").html(result);
	                	Loading();
	            	    if(num == 0){
	        	        	createIBSheet2($("#ib-container0")[0],"mySheet", "100%", "300px");
	    	          		IBS_InitSheet(mySheet,initData);
		            		Action_popup('list');
		            		num++;
	                	}else if(num == 1){
	            	    	$("#ib-container0_copy").after(container0);
	        	        }
	    	});
	    	$("#popupNum").modal("show");
	}
	
	// 팝업창에서 선택된 부서코드, 부서명 값 넣기
	function fn_sawon(sawon_code, sawon_name, sawon_dept, sawon_workplace) {
		mySheet.SetCellValue(Newrow,'fk_BAL_CODE', sawon_code);
		mySheet.DoSave("${pageContext.request.contextPath}/human/p0002/insertBal.do",{Col: mySheet.FindStatusRow("U")}); // 저장대상의 Col
		$("#pk_SAWON_CODE").val(sawon_code);
	    $("#pk_SAWON_NAME").text(sawon_name);
	    $("#sawon_DEPT").text(sawon_dept);
	    $("#sawon_WORKPLACE").text(sawon_workplace);
	    
	    
	    $("#popupDept").modal("hide");
	}  
	function mySheet_OnSaveEnd(){ 
		if(mySheet.FindText('bal_ADD','저장') != -1){
	    	mySheet.SetCellValue(mySheet.RowCount(),'STATUS','I'); 
	    }
	}
	
</script>

<script>
$(function(){   
  $("#bal_DATE").datepicker({
                dateFormat: 'yymmdd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "https://www.shareicon.net/data/16x16/2016/08/13/808501_calendar_512x512.png" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            });  

      $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px'});  //아이콘(icon) 위치   
      $('img.ui-datepicker-trigger').attr('align', 'absmiddle');
 });
 
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
		

		<div class="clear hidden"></div>
		
		<div class="ib_product" style="width:100%;float:left">
			<!-- left -->
<!-- 			<div style="height:100%;width:45%;float:left"> -->
<!-- 				<div id="ballyeong_copy"></div> -->
<!-- 				<div id="ballyeong"></div> -->
<!-- 			</div> -->
			<div style="height:100%;width:45%;float:left">
				<!-- 아래 tab기능_2 -->
				<div class="ib_function float_right">
					<button class="btn btn-outline btn-primary" onclick="doAction('save')"><s:message code="common.btnOK"/></button>
				</div>
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
								<col style="width: 18%;"></col>
								<col style="width: 8%;"></col>
								<col style="width: 12%;"></col>
								<col style="width: 8%;"></col>
								<col style="width: 12%;"></col>
							</colgroup>
							<tr>  
								<td class="bg01_r">발령호수</td>
								<td class="bg02_l">
									<input type="text" id="bal_NUM" style="width: 68%; ">
									<img src='${contextPath}/resources/image/search_icon.png;' onclick='fn_BallyeongNum()' style='cursor:pointer' />
								</td>
								<td class="bg01_r">제목</td>
								<td class="bg02_l">
									<input type="text" id="bal_TITLE" style="width: 98%; ">
								</td>
								<td class="bg01_r">발령구분</td><!-- 이름 변경해야함 -->
								<td class="bg02_l" style="text-align:right">
									<input type="text" id="bal_div_code" style="width: 98%; ">
									<img src='${contextPath}/resources/image/search_icon.png;' onclick='bal_div_Popup()' style='cursor:pointer' />
								</td>
							</tr>
						  
							<tr>
								<td class="bg01_r">발령자</td>
								<td class="bg02_l">
									<input type="text" id="pk_SAWON_CODE" style="width: 68%; ">
									<img src='${contextPath}/resources/image/search_icon.png;' onclick='fn_DeptSelect()' style='cursor:pointer' />
								</td>
								<td class="bg02_l" id="pk_SAWON_NAME" colspan="2"></td>
								<td class="bg01_r" colspan="2"></td>
							</tr>
						
							<tr>
								<td class="bg01_r">발령일자</td>
								<td class="bg02_l">
									<input type="text" id="bal_DATE" readonly style="width: 80%; ">
								</td>
								<td class="bg01_r">발신부서</td>
								<td class="bg02_l" id="sawon_DEPT"></td>
								<td class="bg01_r" colspan="2"></td>
							</tr>
						
							<tr>
								<td class="bg01_r">발신사업장</td>
								<td class="bg02_l" id="sawon_WORKPLACE" colspan="2"></td>
								<td class="bg01_r" colspan="3"></td>
							</tr>
						     
							<tr>
								<td class="bg01_r">참조</td>
								<td class="bg02_l" id="bal_div_code" colspan="4">
									<input type="text" id="isa_ADDRESS" style="width:100%;">
								</td>
								<td class="bg01_r" ></td>
							</tr>
						</table> 
					</div>
				</div>
			</div> 
			<!-- 좌우를 나누는 빈공간 -->
			<div style="height:100%;width:1%;float:left"></div>
			
			<!-- right -->
			
				
<!-- 				위아래를 나누는 빈공간 -->
<!--             	<div style="height:5%"></div> -->
			<div style="height:100%;width:45.2%;float:left">
				<div class="ib_function float_right">
					<button class="btn btn-outline btn-primary" onclick="doAction('save')"><s:message code="common.btnOK"/></button>
				</div>
 				<div id="tab2" class="ib-tab-tabs">
					<div class="ib-tab-tabs-item">
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">대상자</span></a>
					</div>
				</div>
				
					
            	<div id="tab_contents_2" class="ib-tab-contents">
					<div class="ib-tab-contents__item"> 
						<div id="tab2_contents"></div>
					</div>
				</div>
			</div>
		</div>
        
		</DIV>
    		<!--main_content-->
		</div>
	</div>
	  <div id="popupNum" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" ></div>
	  <div id="popupUsers" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" ></div>
	  <div id="popupDept" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" ></div>
	  <div id="popupTarget" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" ></div>    
</body>
</html>