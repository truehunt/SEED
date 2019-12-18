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
   var bal_check = 0; // 발령호수 check
   var Content_check = 0; // 발령내역 check
   var After_check = 0; // 발령내역 check
   /*Sheet 기본 설정 */
   function LoadPage() {
	   
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1 };
      initData.Cols = [
    	 {Header:"상태|상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
         {Header:"NO|NO",Type:"Seq", Align:"Center"},
         {Header:"대상자|사원코드",Type:"Text", SaveName:"fk_BAL_SAWON_CODE", Width:120, Align:"Center", Edit:0},
         {Header:"대상자|사원명", Type: "Text",SaveName:"sawon_NAME",Width:200,  Align: "Center", Edit:0},
		 {Header:"대상자|발령일자",Type:"Text",SaveName:"bal_DATE",Width:120, Align:"Center", Edit:0},
      ];
      	createIBSheet2($("#ballyeong")[0],"mySheet", "100%", "348px");
		IBS_InitSheet(mySheet,initData);
		mySheet.SetFocusAfterProcess(0); // 조회후 Focus를 두지 않는다.
        
      	//mySheet2 //대상자
      	initData.Cols = [
      		//체크박스 만들것 
      		{Header:"상태|상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
      		{Header:"NO|NO",Type:"Seq", Align:"Center"},
      		{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50},
      		{Header:"발령내역|발령내역 ",Type:"Text",SaveName:"bal_DETAILS", Width:120, Align:"Center",Edit:0},
      		{Header:"발령내역|현정보",Type:"Text", SaveName:"bal_INFO", Width:150, Align:"Center",Edit:0},
			{Header:"발령내역|발령전정보",Type:"Text", SaveName:"bal_BEF_INFO", Width:150, Align:"Center",Edit:0},
			{Header:"발령내역|발령후정보",Type:"Text", SaveName:"bal_AFT_INFO", Width:150, Align:"Center",Edit:0},
			{Header:"발령내역|적용",Type:"Button", SaveName:"button", Width:80, Align:"Center"},
			
			{Header:"발령내역|발령자코드",Type:"Text", SaveName:"fk_BAL_SAWON_CODE", Width:60, Align:"Center",Edit:0},
			{Header:"발령내역|발령호수",Type:"Text", SaveName:"bal_NUM", Width:60, Align:"Center",Edit:0},
			{Header:"발령내역|발령제목",Type:"Text", SaveName:"bal_TITLE", Width:60, Align:"Center",Edit:0},
			{Header:"발령내역|발령구분",Type:"Text", SaveName:"bal_DIV_CODE", Width:60, Align:"Center",Edit:0},
			{Header:"발령내역|발령일자",Type:"Text", SaveName:"bal_DATE", Width:60, Align:"Center",Edit:0},
			{Header:"pk_code",Type:"Text", SaveName:"pk_BAL_CODE", Width:60, Align:"Center",Edit:0}
       	];
      	createIBSheet2($("#tab2_contents")[0],"mySheet2", "100%", "348px");
      	IBS_InitSheet(mySheet2,initData);
      	mySheet2.SetColHidden([
			{Col: 'fk_BAL_SAWON_CODE', Hidden:1},
			{Col: 'bal_NUM', Hidden:1},
			{Col: 'bal_TITLE', Hidden:1},
			{Col: 'bal_DIV_CODE', Hidden:1},
			{Col: 'bal_DATE', Hidden:1},
			{Col: 'pk_BAL_CODE', Hidden:1}
  	    ]);
      	
   }

   
   
   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
         case "save":
        	 for(var i=2; i<=mySheet2.RowCount()+1; i++){
        		 if(mySheet2.GetCellValue(i,'STATUS') != 'R'){
        			 mySheet2.SetCellValue(i,'bal_NUM',$('#bal_NUMBER').val());
                	 mySheet2.SetCellValue(i,'bal_DATE',$('#balDate').val());
                	 mySheet2.SetCellValue(i,'bal_DIV_CODE',$('#Bal_DIV').val());
                	 mySheet2.SetCellValue(i,'bal_TITLE',$('#balTitle').val());
                	 mySheet2.SetCellValue(i,'fk_BAL_SAWON_CODE',Bal_Sawon_Code);
                	 mySheet2.SetCellValue(i,'button', '적용');
        		 }
        	 }
        	 mySheet2.DoSave("${pageContext.request.contextPath}/human/p0002/balContentSave.do");
        	 mySheet2.DoSearch("${pageContext.request.contextPath}/human/p0002/fk_Sawon.do",bal_Contents);
            break;
         case "insert":
			mySheet2.DataInsert(-1);
			break; 
         case "list":
        	 mySheet.DoSearch("${pageContext.request.contextPath}/human/p0002/ballyeong.do"); //mySheet조회
        	 break;
        // 발령대상자 조회
         case "search":
        	 var param = "bal_NUM=" + $('#bal_NUMBER').val() 
        	 + "&bal_DATE=" + $('#balDate').val() 
        	 + "&bal_DIV_CODE=" + $('#Bal_DIV').val() 
        	 + "&bal_TITLE=" + $('#balTitle').val();
        	 mySheet.DoSearch("${pageContext.request.contextPath}/human/p0002/fk_Sawon.do", param); 
        	 mySheet2.RemoveAll();
        	 break;
        	 
      }
   }
   
   // 발령호수 popup창
   function fn_BalNum(){
		$.ajax({
	    	url: "bal_Num_Code.do", // 알아서 주소를 칠 것.
	    	type: "post"        
		}).success(function(result){
			$("#popupNum").html(result);
	        Loading();
	        if(bal_check == 0){
	        	createIBSheet2($("#ib-container2")[0],"mySheet3", "100%", "300px");
	    	    IBS_InitSheet(mySheet3,initData);
		        Action_popup('list_sawon');
		        bal_check++;
			}else if(bal_check == 1){
	        	$("#ib-container2_copy").after(container2);
	        	Action_popup('list_sawon');
	        }
	    });
	    $("#popupNum").modal("show"); // modal : popupNum을 보여준다.(생성)
	}
	
   // 발령구분
	function selectDIV(ballyeong_Num, selected) {
		$.ajax({
			url : "BalDiv.do",//목록을 조회 할 url
	        type : "POST",
	        dataType : "JSON",
	        data : {bal_NUM : ballyeong_Num},
	        success : function(data) {
				$(".1").remove();
				for (var i = 0; i < data['Data'].length; i++) {
					var option = "<option class='1' value='" + data['Data'][i].bal_DIV_CODE + "'>"
								+ data['Data'][i].bal_DIV_CODE
								+ "</option>";
					//대상 콤보박스에 추가
					$('#Bal_DIV').append(option);
				}
				$('#Bal_DIV').val(selected); // ibSheet에서 선택된 값이 selected
				Search_Date_Title();
			}, error : function(jqxhr, status, error) {
	        	alert("에러");
			}
		});
	} 
	
// =======================================================================	
   
	// 발령일자 및 제목
	function Search_Date_Title() {
		var bal_DIV = $('#Bal_DIV').val();
		var bal_Number = $('#bal_NUMBER').val();
		$.ajax({
			url : "BalSearch.do",//목록을 조회 할 url
	        type : "POST",
	        dataType : "JSON",
	        data : {bal_DIV : bal_DIV, bal_Number : bal_Number},
	        success : function(data) {
	        	$('input[id=balDate]').val(data['Data'][0].bal_DATE);
	        	$('input[id=balTitle]').val(data['Data'][0].bal_TITLE);
	        }, error : function(jqxhr, status, error) {
	        	alert("에러");
			}
		});
	} 
   
	function mySheet_OnSelectCell(OldRow, OldCol, NewRow, NewCol,isDelete) {
		m2nrow = NewRow;
		if(OldRow != NewRow){
			Bal_Sawon_Code = mySheet.GetCellValue(NewRow, 'fk_BAL_SAWON_CODE');
			bal_Contents = "bal_NUM=" + $('#bal_NUMBER').val() 
       	 + "&bal_DATE=" + $('#balDate').val() 
    	 + "&bal_DIV_CODE=" + $('#Bal_DIV').val() 
    	 + "&bal_TITLE=" + $('#balTitle').val()
    	 + "&fk_BAL_SAWON_CODE=" + mySheet.GetCellValue(NewRow, 'fk_BAL_SAWON_CODE');
			mySheet2.DoSearch("${pageContext.request.contextPath}/human/p0002/fk_Sawon.do",bal_Contents);
		}
	}
//---------------------------------------------------------------------------------------

	function mySheet2_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) {
		M2_Row = Row; // mySheet2 row 저장
		proChk = mySheet2.GetCellValue(Row, 'bal_DETAILS');
		// 버튼 적용완료시  사용 불가 & 
		// 발령내역 버튼 적용이 있을 시 사용 불가
		if(mySheet2.GetCellValue(Row,'button') != '적용완료'){
			if(Col == 3 &&  mySheet2.GetCellValue(Row,'button') != '적용'){ // 발령내역
				$.ajax({
			    	url: "bal_Content.do", // popup창 주소
			    	type: "post"
				}).success(function(result){
					$("#PopBalContents").html(result); 
			        Loading();
			        if(Content_check == 0){
			        	createIBSheet2($("#ib-container3")[0],"mySheet4", "100%", "300px");
			    	    IBS_InitSheet(mySheet4,initData);
				        Action_popup('bal_Content');
				        Content_check++;
					}else if(Content_check == 1){
			        	$("#ib-container3_copy").after(container3);
			        	Action_popup('bal_Content');
			        }
			    });
			    $("#PopBalContents").modal("show"); // modal : popupNum을 보여준다.(생성)
			}else if(Col == 6){ // 발령후 정보
				if(proChk != "프로젝트"){ // 프로젝트가 아닐 때
					$.ajax({
				    	url: "ballyeong_Popup.do", // 알아서 주소를 칠 것.
				    	type: "post",
					}).success(function(result){
						$("#popupAfter").html(result);
				        Loading();
				        if(After_check == 0){
				        	createIBSheet2($("#ib-container1")[0],"mySheet5", "100%", "300px");
				    	    IBS_InitSheet(mySheet5,initData);
					        Action_popup('list_After');
					        After_check++;
						}else if(After_check == 1){
				        	$("#ib-container1_copy").after(container1);
				        	mySheet5.RemoveAll();
				        	Action_popup('list_After');
				        }
				    });
				    $("#popupAfter").modal("show"); // modal : popupNum을 보여준다.(생성)
				}
			}
		}
		
	}

	function fn_EM_INFO(ComboText){
		Code = ComboText;
		$.ajax({
			url : "EM_INFO.do",//목록을 조회 할 url
	        type : "POST",
	        dataType : "JSON",
	        data : {Code : ComboText, Sawon : Bal_Sawon_Code},
	        success : function(data) {
	        	if(data['Data'][0] != null){
	        		mySheet2.SetCellValue(M2_Row, 'bal_INFO', data['Data'][0].info);
					mySheet2.SetCellValue(M2_Row, 'bal_BEF_INFO', data['Data'][0].info);
					mySheet2.SetCellValue(M2_Row, 'bal_AFT_INFO', '');
	        	}else {
	        		mySheet2.SetCellValue(M2_Row, 'bal_INFO', '');
	        		mySheet2.SetCellValue(M2_Row, 'bal_BEF_INFO', '');
	        		mySheet2.SetCellValue(M2_Row, 'bal_AFT_INFO', '');
	        	}
		        	
	        }, error : function(jqxhr, status, error) {
	        	alert("에러");
			}
		});
	}
	
	
	function mySheet2_OnSearchEnd(){
		var fk_BAL_SAWON_CODE = mySheet.GetCellValue(m2nrow, 'fk_BAL_SAWON_CODE');
   	 	for(var i=2; i<=mySheet2.RowCount()+1; i++){
			var bal_DETAILS = mySheet2.GetCellValue(i,'bal_DETAILS'); // 발령내역을 bal_DETAILS에 저장 
			$.ajax({
				url : "Content_Div.do",
		        type : "POST",
	        	dataType : "JSON",
	        	data : {fk_BAL_SAWON_CODE : fk_BAL_SAWON_CODE, bal_DETAILS : bal_DETAILS}, // 사원코드, 발령내역을 보낸다.
	    	    success : function(data) {
	    	    	var Row1 = mySheet2.FindText('bal_DETAILS', data['result'], 0); // 발령내역과 같은곳을 찾는다
	    	    	if(data['Data'][0] != null){
	    	    		mySheet2.SetCellValue(Row1,'bal_INFO', data['Data'][0].bal_INFO); // 현정보에 값을 넣는다.
	    	    		if(mySheet2.GetCellValue(Row1,'bal_INFO') == mySheet2.GetCellValue(Row1,'bal_AFT_INFO')){
	    	    			mySheet2.SetCellValue(Row1, 'button', '적용완료'); // 적용완료
	    					mySheet2.SetCellEditable(Row1, 'button', 0); // 적용완료시 수정 불가
	    					mySheet2.SetCellEditable(Row1, 'DEL_CHK', 0); // 삭제불가
	    	    		}
	    	    		mySheet2.SetCellValue(Row1, 'STATUS', 'R'); // 값을 넣으면서 수정으로 변경된 상태값을 다시 조회로 변경해준다.
	    	    	}
		        }, error : function(jqxhr, status, error) {
	        		alert("에러");
				}
			});
   	 	}
		for(var k=2; k<=mySheet2.RowCount()+1; k++){
			mySheet2.SetCellValue(k, 'button', '적용'); // 적용버튼 생성
			mySheet2.SetCellValue(k, 'STATUS', 'R'); // 적용버튼이 생성되면서 수정으로 변경된 값을 다시 조회로 변경해준다.
 		}
	}
	
	// 버튼 눌렀을 시
	function mySheet2_OnButtonClick(Row, Col) {
		// ajax로 보낼 값 정리
		var fk_BAL_SAWON_CODE = mySheet.GetCellValue(m2nrow, 'fk_BAL_SAWON_CODE'); // 사원코드
		var bal_DETAILS = mySheet2.GetCellValue(Row,'bal_DETAILS'); // 발령내역
		var bal_INFO = mySheet2.GetCellValue(Row, 'bal_AFT_INFO'); // 현정보
		var pk_BAL_CODE = mySheet2.GetCellValue(Row, 'pk_BAL_CODE'); // pk_code값
		var button = mySheet2.GetCellValue(Row, 'button'); // 버튼값
		
		$.ajax({
			url : "ContentSave.do", 
	        type : "POST",
        	dataType : "JSON",
        	data : {fk_BAL_SAWON_CODE: fk_BAL_SAWON_CODE, bal_DETAILS: bal_DETAILS, bal_INFO: bal_INFO, button: button, pk_BAL_CODE: pk_BAL_CODE},
    	    success : function(data) {
    	    	 mySheet2.SetCellValue(Row,'bal_INFO', data['Data'][0].bal_INFO);
    	    	 mySheet2.SetCellValue(Row, 'button', '적용완료');
    	    	 mySheet2.SetCellEditable(Row, 'button', 0); // 적용완료시 수정 불가
    	    	 mySheet2.SetCellEditable(Row, 'DEL_CHK', 0); // 삭제불가
    	    	 mySheet2.SetCellValue(Row, 'STATUS', 'R'); // 적용버튼이 생성되면서 수정으로 변경된 값을 다시 조회로 변경해준다.
	        }, error : function(jqxhr, status, error) {
        		alert("에러");
			}
		});
		
	} 
	
</script>


<script>
$(function(){   
  $("#balDate").datepicker({
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
				<h1 class="page-header"><i class="fa fa-users fa-fw"></i> <s:message code="main.per4"/></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
	<!-- 호수 정하는 공간 -->	
   <div class="input-group custom-search-form col-lg-2" style="margin:20px">
		<div class="input-group">
			<input class="form-control" type="text" id="bal_NUMBER" placeholder="발령호수를 선택하세요." value="" style="width:313px;" readonly>
		</div>
		<span class="input-group-btn">
			<button class="btn btn-default" onclick="fn_BalNum()">
				<i class="fa fa-search"></i>
			</button>
		</span>
	</div>
	
	
	<div class="ib_function float_right">
		<button class="btn btn-outline btn-primary" onclick="doAction('search')"><s:message code="common.btnSearch"/></button>
	</div>
	<form class="form-inline" style="margin:20px">
		<label for="Bal_DIV">발령구분</label>
		<select id="Bal_DIV" onchange="Search_Date_Title()">
			<option value="" selected>전체</option>
		</select> &ensp; &ensp; 
            
		<div class="form-group">
    		<label for="balDate">발령일자</label>
			<input type="text" class="form-control" id="balDate" readonly>
        </div>  &ensp; &ensp; 
        
        <div class="form-group">
    		<label for="balTitle">발령제목</label>
			<input type="text" class="form-control" id="balTitle" readonly>
        </div>
	
	<hr style="border: solid 1px gray ;">    
	</form>
	
	
	
  <div class="main_content">
		<!-- 버튼 -->
		<div class="ib_function float_right">
			<button class="btn btn-outline btn-primary" onclick="doAction('insert')"><s:message code="board.append"/></button>
			<button class="btn btn-outline btn-primary" onclick="doAction('save')"><s:message code="common.btnSave"/></button>
		</div>
		<div class="clear hidden"></div>
		
		<div class="ib_product" style="width:100%;float:left">
			<!-- left -->
			<div style="height:100%;width:37%;float:left; ">
				<div id="ballyeong_copy"></div>
				<div id="ballyeong"></div>
			</div>
			
			<!-- 좌우를 나누는 빈공간 -->
			<div style="height:100%;width:1%;float:left"></div>
			
			<!-- right -->
			<div style="height:100%;width:57%;float:left">
				<div id="tab2_contents"></div>
			</div>
		</div>
        
		</DIV>
		
		</div>  
	</div>
<!-- 발령호수 팝업 -->	  <div id="popupNum" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" ></div>
<!-- 발령내역 팝업 -->	  <div id="PopBalContents" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" ></div> 
<!-- 발령 후 정보 -->	  <div id="popupAfter" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" ></div>
</body>
</html>