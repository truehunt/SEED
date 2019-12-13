<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 등록</title>

<style>
	.frame {
		  width : 1400px;
		  margin: 0px;

	}

	.container {
  		display: table;
  		margin-top: 8px;
  		height: 600px;
  		border : 1px solid lightblue;
	}

	.nav {
		  float: left;
		  width: 1300px;
	}
	
	.img {
		width:5%;
		height:5%;
	}
	.header{
		width:1300px;
		border : 1px solid lightblue;
	}
	.header_child{
		 height:35px; 
		 margin-top:10px;
		 margin-left:30px;
	}
	p.indent{
		 padding-left:38em; 
		 margin-left:48%;
		 height:-30px;
	}
	
	.pop-layer .pop-container {
	  padding: 20px 25px;
	}
	
	.pop-layer p.ctxt {
	  color: #666;
	  line-height: 25px;
	}
	
	.pop-layer .btn-r {
	  width: 100%;
	  margin: 50px 0 20px;
	  padding-top: 70px;
	  border-top: 1px solid #DDD;
	  text-align: right;
	}
	
	.pop-layer {
	  display: none;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  width: 410px;
	  height: auto;
	  background-color: #fff;
	  border: 2px solid #3571B5;
	  z-index: 10;
	}
	
	.dim-layer {
	  display: none;
	  position: fixed;
	  _position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  z-index: 100;
	}
	
	.dim-layer .dimBg {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: #000;
	  opacity: .3;
	  filter: alpha(opacity=50);
	}
	
	.dim-layer .pop-layer {
	  display: block;
	}
	
	a.btn-layerClose, a.btn-layerCheck {
	  display: inline-block;
	  text-align: center;
	  height: 25px;
	  padding: 0 14px 0;
	  border: 1px solid #b4b4b4;
	  font-size: 13px;
	  text-decoration: none;
	  color: #434343;
	  border-radius:2px;
	  box-shadow: 0 1px 1px #eaeaea;
	  line-height: 28px;
	}
	
	.btn-example{
		display: inline-block;
		text-align: center;
		height: 28px;
		width:70px;
		border: 1px solid #b4b4b4;
		font-size: 13px;
		text-decoration: none;
		color: #434343;
		border-radius:2px;
		line-height:28px;
	}
	
	a.btn-layerClose:hover .btn-example{
	  color: #000;
	}

	
	
</style>



<!--우편번호 관련된 script 추가 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- ibsheet,tab 관련된 script 및 link 추가  -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	
	<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
  	<link href="${contextPath}/resources/ibsheet/tab/ibtab-style.css" rel="stylesheet">
	<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
	<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
	<script src="${contextPath}/resources/ibsheet/tab/ibtab.js" type="text/javascript"></script>
	<script src="${contextPath}/resources/ibsheet/tab/ibtabinfo.js" type="text/javascript"></script>
	
	<!-- 부트스트랩 관련 -->
	<link href="${contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
	<link href="${contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">

	<script src="${contextPath}/resources/js/jquery-2.2.3.min.js"></script>
	<script src="${contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
	<script src="${contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
	<script src="${contextPath}/resources/js/project9.js"></script>

<script type="text/javascript">
	//시트 높이 계산용
	var pageheightoffset = 200;
	
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		mySheet2.RemoveAll();
		
		$('#layerSectorEnroll').fadeOut();
		$('#layerWorkplace').fadeOut();
		$('#layerSector').fadeOut();
		$('#layerSearch').fadeOut();
		
		//아이비시트 초기화
		var initdata = {};
		initdata.Cfg = {SearchMode:smLazyLoad,Page:50};
		initdata.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initdata.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
			// MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
			// Align : data 정렬값.
			// keyfield : keyfield값 필수값 체크시 필요(미입력시 추가안됨.)
			// MultiLineText:1  : 하나의 셀에 여러값을 넣을수 있음(shift+enter)
			// Wrap:1 : 데이터
			// Edit:1 : 그리드 화면에서 편집 가능 여부 (1-입력가능,0-입력 불가능)
			// FORMAT 형식 법인/사업자 등록번호 - Format:["IdNo", "SaupNo"], 전화번호/FAX번호 - Format: "PhoneNo", 
			
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50, Align:"Center"},
			{Header:"부서코드",Type:"Text",SaveName:"pk_dept_code",MinWidth:60, Align:"Center", UpdateEdit:0},
			{Header:"부서명",Type:"Text",SaveName:"dept_name",MinWidth:100, Align:"Center"},			
			{Header:"사업장코드",Type:"Text",SaveName:"fk_workplace_code",MinWidth:70, Align:"Center"},
			{Header:"사업장 명",Type:"Text",SaveName:"workplace_name",MinWidth:150, Align:"Center", Edit:0},
			{Header:"부문코드",Type:"Text",SaveName:"fk_sector_code",MinWidth:70, Align:"Center"},
			{Header:"부문명",Type:"Text",SaveName:"sector_name",MinWidth:100, Align:"Center", Edit:0},
			{Header:"사용기간",Type:"Date",SaveName:"dept_priodof",MinWidth:100, Align:"Center", format:""},
			{Header:"구분코드",Type:"Text",SaveName:"dept_inquiry_code",MinWidth:50, Align:"Center", Edit:0, Hidden:1},
			{Header:"입력자",Type:"Text",SaveName:"dept_int_user_id",MinWidth:80, Hidden:1},
			{Header:"입력일시",Type:"Text",SaveName:"dept_int_date",MinWidth:80, Hidden:1},
			{Header:"수정자",Type:"Text",SaveName:"dept_mod_user_id",MinWidth:80, Hidden:1},
			{Header:"수정일시",Type:"Text",SaveName:"dept_mod_date",MinWidth:80, Hidden:1},
		];   
		IBS_InitSheet( mySheet , initdata);
		
		//ibSheet 에서 col 지정해서 숨김
		//mySheet1.SetColHidden([
	    //   {Col: 0, Hidden:1}, //상태
	    // ]);
		//mySheet.SetDataAutoTrim(0);
		
		var initdata = {};
		
		initdata.Cfg = {SearchMode:smLazyLoad, Page:50};
		initdata.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initdata.Cols =[
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50, Align:"Center"},
			{Header:"부문코드",Type:"Text",SaveName:"pk_sector_code",MinWidth:60, Align:"Center", UpdateEdit:0},
			{Header:"부문 명",Type:"Text",SaveName:"sector_name",MinWidth:100, Align:"Center" },			
			{Header:"사용기간",Type:"Date",SaveName:"sector_priodof",MinWidth:120, Align:"Center", format:""},
			{Header:"입력자",Type:"Text",SaveName:"dept_int_user_id",MinWidth:80, Align:"Center", Hidden:1},
			{Header:"입력일시",Type:"Text",SaveName:"dept_int_date",MinWidth:80, Align:"Center", Hidden:1},
			{Header:"수정자",Type:"Text",SaveName:"dept_mod_user_id",MinWidth:80, Align:"Center", Hidden:1},
			{Header:"수정일시",Type:"Text",SaveName:"dept_mod_date",MinWidth:80, Align:"Center", Hidden:1},
		];
		
		IBS_InitSheet( mySheet2 , initdata);
		
		//ibSheet2 에서 col 지정해서 숨김
		mySheet2.SetColHidden([
	      {Col: 0, Hidden:1}, //상태
	    ]);
		
		var initdata = {};
		
		initdata.Cfg = {SearchMode:smLazyLoad, Page:50};
		initdata.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initdata.Cols =[
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50, Align:"Center"},
			{Header:"부문코드",Type:"Text",SaveName:"pk_sector_code",MinWidth:60, Align:"Center"},
			{Header:"부문 명",Type:"Text",SaveName:"sector_name",MinWidth:90, Align:"Center" },
			{Header:"사용기간",Type:"Date",SaveName:"sector_priodof",MinWidth:100, Align:"Center", format:""},
			
		];
		
		IBS_InitSheet( mySheet3 , initdata);
		
		//ibSheet3 에서 col 지정해서 숨김
		mySheet3.SetColHidden([
	      {Col: 0, Hidden:1}, //상태
	      {Col: 1, Hidden:1}, //삭제
	    ]);
		
		var initdata = {};
		
		initdata.Cfg = {SearchMode:smLazyLoad, Page:50};
		initdata.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initdata.Cols =[
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50, Align:"Center"},
			{Header:"사업장코드",Type:"Text",SaveName:"pk_workplace_code",MinWidth:100, Align:"Center"},
			{Header:"사업장 명",Type:"Text",SaveName:"workplace_name",MinWidth:150, Align:"Center" },			
			
		];
				
		IBS_InitSheet( mySheet4 , initdata);
		
		//ibSheet4 에서 col 지정해서 숨김
		mySheet4.SetColHidden([
	      {Col: 0, Hidden:1}, //상태
	      {Col: 1, Hidden:1}, //삭제
	    ]);	
		
		var initdata = {};
		
		initdata.Cfg = {SearchMode:smLazyLoad, Page:50};
		initdata.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initdata.Cols =[
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50, Align:"Center"},
			{Header:"사업장코드",Type:"Text",SaveName:"pk_workplace_code",MinWidth:100, Align:"Center"},
			{Header:"사업장 명",Type:"Text",SaveName:"workplace_name",MinWidth:150, Align:"Center" },			
			
		];
				
		IBS_InitSheet( mySheet5 , initdata);
		
		//ibSheet5 에서 col 지정해서 숨김
		mySheet5.SetColHidden([
	      {Col: 0, Hidden:1}, //상태
	      {Col: 1, Hidden:1}, //삭제
	    ]);	
		
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet3.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet4.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet5.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		
		mySheet.DoSearch("${contextPath}/human/s0003/searchList.do"); // 부서등록 페이지로 가면 자동으로 searchList.do 실행 
		mySheet2.DoSearch("${contextPath}/human/s0003/searchList2.do"); // 부서등록 페이지로 가면 자동으로 searchList2.do 실행	
		mySheet3.DoSearch("${contextPath}/human/s0003/searchList2.do"); // 부서등록 페이지로 가면 자동으로 searchList2.do 실행(속성이 동일하므로 같이 사용)
		mySheet4.DoSearch("${contextPath}/human/s0003/searchList3.do"); // 부서등록 페이지로 가면 자동으로 searchList3.do 실행
		mySheet5.DoSearch("${contextPath}/human/s0003/searchList3.do"); // 부서등록 페이지로 가면 자동으로 searchList3.do 실행
		
	}
	
	//더블 클릭시 팝업이벤트
	var t_row1 = 0; //mySheet의 클릭시 row num
	var t_col1 = 0; //mySheet의 클릭시 col num
	var t_col2 = 0; //mySheet의 클릭시 col+1 num
	
	function mySheet_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH){
		t_row1 = Row;
		t_col1 = Col;
		t_col2 = Col+1;
		//console.log("t_row1:"+t_row1);
		//console.log("t_col1:"+t_col1);
		//console.log("t_col2:"+t_col2);
		switch(Col){
		case 4:
			 //사업장도움 코드
			 console.log("4:"+Col);
			 layer_popup('#layerWorkplace');
			 break;
		case 6:
			 //부문도움 코드
			 console.log("6:"+Col); 
			 layer_popup('#layerSector');
			 break;
		case 5:
			alert("지금 클릭하신 셀에는 더블 클릭이벤트가 없습니다. 4번(사업장코드)에 해당하는 셀에서 사용해주세요.");
			break;
		case 7:
			alert("지금 클릭하신 셀에는 더블 클릭이벤트가 없습니다. 6번(부문코드)에 해당하는 셀에서 사용해주세요.");
			break;
		default :
			break;
		}

		//self.close();
		return false; // 창을 닫는 경우에는 false를 리턴해 줘야 함
	}

	//더블 클릭후 레이어팝업에서 더블클릭 시 mySheet3 
	function mySheet3_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH){
		console.log("부문 코드 도움 더블 클릭");
		console.log("t_row3 : "+ t_row1);
		//console.log("t_row1="+t_row1);
		//console.log("t_col1="+t_col1);
		//console.log("t_col2="+t_col2);
	 	var pk = mySheet3.GetCellValue(Row, 2);
	 	var pk2 = mySheet3.GetCellValue(Row, 3);
	 	
	 	alert("현재 선택된 코드와 명은"+pk+","+pk2+"입니다.");
	 	
	 	
	 	$('.btn-layerClose').click();//레이어 팝업 fadeOut
	 	//$('#layerSector').fadeOut();
	 	//$('.dim-layer').fadeOut();
		
	 	//팝업 레이어의 데이터 값으로 해당 col 값 변경
	 	mySheet.SetCellValue(t_row1, t_col1, pk);
	 	mySheet.SetCellValue(t_row1, t_col2, pk2);
	}

	//onClick 이벤트 mySheet3(부문코드 도움)
 	 function mySheet3_OnClick(Row, Col, Value, CellX, CellY, CellW, CellH)  {
 		console.log("t_row4 : "+ t_row1);
		if (Row == null || Row <= 0) return; // row가 null 이거나 0보다 같거나 작으면 바로 리턴
		
		pk = mySheet3.GetCellValue(Row, 2); // 마우스로 클릭한 셀의 value를 가져와서 pk에 저장
	 	pk2 = mySheet3.GetCellValue(Row, 3); // 마우스로 클릭한 셀의 value를 가져와서 pk2에 저장
	 	
	 	console.log(pk);
	 	console.log(pk2);
	 	
	 	$('.btn-layerCheck').click( function(){
		 	mySheet.SetCellValue(t_row1, t_col1, pk);
			mySheet.SetCellValue(t_row1, t_col2, pk2);
	 	});
	 }

	//더블 클릭후 레이어팝업에서 더블클릭 시 mySheet4	
	 function mySheet4_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH){
		console.log("사업장 코드 도움 더블 클릭");
		console.log("t_row1 : "+ t_row1);

		if(t_row1 != null || t_row1 <= 0){
			//console.log("t_row1="+t_row1);
			//console.log("t_col1="+t_col1);
			//console.log("t_col2="+t_col2);
			
		 	var pk = mySheet4.GetCellValue(Row, 2);
		 	var pk2 = mySheet4.GetCellValue(Row, 3);
			 	
		 	 //console.log(pk);
		 	 
		 	alert("현재 선택된 코드와 명은"+pk+","+pk2+"입니다.");
		 	
		 	//팝업 레이어의 데이터 값으로 해당 col 값 변경
	 		mySheet.SetCellValue(t_row1, t_col1, pk);
		 	mySheet.SetCellValue(t_row1, t_col2, pk2);

		 	$('.btn-layerClose').click();//레이어 팝업 fadeOut
		 	//$('#layerWorkplace').fadeOut();
		 	//$('.dim-layer').fadeOut();
	 	
		} 
	}
	 
	 //onClick 이벤트  mySheet4(사업장코드 도움)
	 function mySheet4_OnClick(Row, Col, Value, CellX, CellY, CellW, CellH) {

		if (Row == null || Row <= 0) return; // row가 null 이거나 0보다 같거나 작으면 바로 리턴
	
		if(t_row1 != null || t_row1 <= 0){
			console.log("t_row2 : "+ t_row1);
			pk = mySheet4.GetCellValue(Row, 2); // 마우스로 클릭한 셀의 value를 가져와서 pk에 저장
		 	pk2 = mySheet4.GetCellValue(Row, 3); // 마우스로 클릭한 셀의 value를 가져와서 pk2에 저장
		 	
		 	console.log(pk);
		 	console.log(pk2);
		 	
		 	console.log(mySheet4);
		 	
		 	$('.btn-layerCheck').click( function(){
		 		console.log("t_row02 : "+ t_row1);
		 		mySheet.SetCellValue(t_row1, t_col1, pk);
			 	mySheet.SetCellValue(t_row1, t_col2, pk2);		 	
		 	});	
		 	return false;
		}
			
 	 } 
	 
	 //더블 클릭후 레이어팝업에서 더블클릭 시 mySheet5	
	 function mySheet5_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH){
		console.log("사업장 코드 도움 더블 클릭");
		console.log("t_row1 : "+ t_row1);

		// ibsheet의 GetCellValue 메서드를 사용해 row 의 value 를 가져와 id = code에 넣어줌 
			$('#code').val(mySheet4.GetCellValue(Row, 3)); 
			
			$('.btn-layerClose').click(); 
			console.log("code : " + code);
		
	}
	 
	 //onClick 이벤트  mySheet5(사업장코드 도움 (검색))
	 function mySheet5_OnClick(Row, Col, Value, CellX, CellY, CellW, CellH) {

		if (Row == null || Row <= 0) return; // row가 null 이거나 0보다 같거나 작으면 바로 리턴
	
			console.log("t_row05:"+t_row1);
			// ibsheet의 GetCellValue 메서드를 사용해 row 의 value 를 가져와 id = code에 넣어줌 
			
			$('.btn-layerCheck').click( function(){

				console.log("t_row05:"+t_row1);
				$('#code').val(mySheet4.GetCellValue(Row, 3));	
				console.log("code : " + code);
				
			});
	 }

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
				//검색하려는 값 받아옴
				var param = FormQueryStringEnc(document.frm);
				alert(param);

				mySheet.DoSearch("${contextPath}/human/s0003/searchList.do",param);
				mySheet2.DoSearch("${contextPath}/human/s0003/searchList2.do");
				mySheet3.DoSearch("${contextPath}/human/s0003/searchList2.do");
				mySheet4.DoSearch("${contextPath}/human/s0003/searchList3.do");
				mySheet5.DoSearch("${contextPath}/human/s0003/searchList3.do");
				
				//검색 input 초기화
				$('#code').val("");
				
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				mySheet2.RemoveAll();
				mySheet3.RemoveAll();
				mySheet4.RemoveAll();
				mySheet5.RemoveAll();
				break;
			case "save": // 저장
				//현재는 테스트 하는 겸 해서 놔두지만 나중에는 주석 처리 해야됨 
				//save 를 하면서 중복 처리 됨 
				var tempStr = mySheet.GetSaveString();
				tempStr += alert("서버로 전달되는 문자열 확인 :"+tempStr);
				//mySheet.DoSave("${contextPath}/human/s0003/insertData.do");
				
				 mySheet.DoSave("${pageContext.request.contextPath}/human/s0003/insertData.do");
				
				break;
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();
				
				//구분코드2(dept_inquiry_code) 에 값 입력
				mySheet.SetCellValue(row, 9, 2);
				break;
		}
	}
	
	/*Sheet 각종 처리*/
	function doAction2(sAction) {
		switch(sAction) {
			case "search": //조회
				//var param = FormQueryStringEnc(document.frm);
				//alert(param);
				//mySheet.DoSearch("${contextPath}/human/s0001/searchList.do", param);

				mySheet2.DoSearch("${contextPath}/human/s0003/searchList2.do");
				
				break;
			case "reload": //초기화
				mySheet2.RemoveAll();
				
				break;
			case "save": // 저장
				//현재는 테스트 하는 겸 해서 놔두지만 나중에는 주석 처리 해야됨 
				//save 를 하면서 중복 처리 됨 
				var tempStr = mySheet.GetSaveString();
				tempStr += alert("서버로 전달되는 문자열 확인 :"+tempStr);
				//mySheet.DoSave("${contextPath}/human/s0003/insertData.do");
				
				 mySheet2.DoSave("${pageContext.request.contextPath}/human/s0003/insertData2.do");
				
				break;
			case "insert": //신규행 추가
				var row = mySheet2.DataInsert();
				
				break;
		}
	}
	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {

	}
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code,msg){
		if(msg != ""){
			alert(msg);	
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}	
	}	
	
</script>
</head>
<body onload="LoadPage()">

	<div id="wrap" style="margin: 0px;">
	<div id="page-wrapper" style="margin: 0px;">
		<div class="row">
	        <div class="col-lg-12">
	            <h1 class="page-header"><i class="fa fa-folder fa-fw"></i> <s:message code="main.enroll3"/> <p class='indent' />
	            <a href="#layerSectorEnroll" class="btn-example lightgray">부문 등록</a><br></h1>
	        </div>
   	 	</div>
  <div class="frame">
    <%-- //header 및 container 시작--%>
    	<div class="header">
    		<div class="header_child">
    			<form name='frm'>
		        	 사업장  :  <input type='text' id="code" name="code"/> <!-- 현재는 입력후 조회 버튼 누르면 조회됨 -->
		        	 		<%-- <select id="fk_workplace_code" name="fk_workplace_code" style="width:9%;">
		        	 		<option value='' hidden='1'></option><!-- 공백 -->
		        	 		</select> --%>
		        	<img src='${contextPath}/resources/image/search_icon.png;' onclick="layer_popup('#layerSearch');" style='cursor:pointer;' />
	        		
	        		<div class="ib_function float_right">
						  <a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
						  <a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
						  <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
						  <a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
					</div>
	        	</form>
	        </div>
	    </div><!-- //header -->
  <div class="container" style="padding:0px; margin-left:0px;">
	
  <%-- content (아래쪽 layout)시작 --%>
  <div class="nav"></div>
  		
		<!-- ibsheet 뿌려주는 부분  -->
		<div class="clear hidden"></div>
		
		<div class="ib_product" style="margin-left:10px; margin-top:10px;">
			<script>createIBSheet("mySheet", "100%", "163%");</script>
			<div style="height:10px"></div>
		</div>
		<!-- 레이어  팝업 시작 및 내용-->
		<div class="dim-layer">
   			<div class="dimBg"></div>
   			
   			<!-- 부문등록 -->
			<div id="layerSectorEnroll" class="pop-layer">
			<div class="pop-container">
        	<div class="pop-conts">
       	 	<!--content //-->
       	 		<div class="page_title">
       	 			<img src='${contextPath}/resources/ibsheet/Main/d_right.gif' style="width:10px; height:10px;" />
       	 			<span class="title"><b>부문 등록</b></span>
       	 		</div><br>
				<div class="ib_product" style="margin-left:10px;">
					<div class="ib_function float_right">
					  <a href="javascript:doAction2('reload')" class="f1_btn_gray lightgray">초기화</a>
					  <a href="javascript:doAction2('insert')" class="f1_btn_gray lightgray">추가</a>
					  <a href="javascript:doAction2('search')" class="f1_btn_white gray">조회</a>
					  <a href="javascript:doAction2('save')" class="f1_btn_white gray">저장</a>
					</div>	
					<script> createIBSheet("mySheet2", "100%", "50%"); </script>
					
					<div class="btn-r">
						<a href="#" class="btn-layerClose lightgray">확인</a>
		            </div>
            	</div><!--// ib_product-->
        	</div>
		</div></div>
        
   			<!-- 부문 코드 도움 레이어 -->
        	<div id="layerSector" class="pop-layer">
			<div class="pop-container">
        	<div class="pop-conts">
       	 	<!--content //-->
       	 		<div class="page_title">
       	 			<img src='${contextPath}/resources/ibsheet/Main/d_right.gif' style="width:10px; height:10px;" />
       	 			<span class="title"><b>부문 코드 도움</b></span>
       	 		</div><br>
				<div class="ib_product" style="margin-left:10px;">
					<script> createIBSheet("mySheet3", "100%", "50%"); </script>
								
					<div class="btn-r">
						<a href="#" class="btn-layerCheck lightgray">확인</a>
						<a href="#" class="btn-layerClose lightgray">취소</a>
		            </div>
            	</div><!--// ib_product-->
        	</div>
		</div></div>
        
   			<!-- 사업장 코드도움 레이어 -->        
        	<div id="layerWorkplace" class="pop-layer">
			<div class="pop-container">
        	<div class="pop-conts">
       	 	<!--content //-->
       	 		<div class="page_title">
       	 			<img src='${contextPath}/resources/ibsheet/Main/d_right.gif' style="width:10px; height:10px;" />
       	 			<span class="title"><b>사업장 코드 도움</b></span>
       	 		</div><br>
				<div class="ib_product" style="margin-left:10px;">
					<script> createIBSheet("mySheet4", "100%", "50%"); </script>
				<div class="btn-r">
					<a href="#" class="btn-layerCheck lightgray">확인</a>
					<a href="#" class="btn-layerClose lightgray">취소</a>
		        </div>
            	</div><!--// ib_product-->
        </div>
        </div></div>

   			<!-- 사업장 코드도움(검색) 레이어 -->        
        	<div id="layerSearch" class="pop-layer">
			<div class="pop-container">
        	<div class="pop-conts">
       	 	<!--content //-->
       	 		<div class="page_title">
       	 			<img src='${contextPath}/resources/ibsheet/Main/d_right.gif' style="width:10px; height:10px;" />
       	 			<span class="title"><b>사업장 코드 도움</b></span>
       	 		</div><br>
				<div class="ib_product" style="margin-left:10px;">
					<script> createIBSheet("mySheet5", "100%", "50%"); </script>
				<div class="btn-r">
					<a href="#" class="btn-layerCheck lightgray">확인</a>
					<a href="#" class="btn-layerClose lightgray">취소</a>
		        </div>
            	</div><!--// ib_product-->
        </div>
        </div></div> 			       
        </div> <!-- //layer 끝 -->
		
  </div><!-- //container -->
  </div><!-- //frame -->
  </div><!-- //page-wrapper -->
  </div><!-- //wrap -->
  
<script>  

$('.btn-example').click(function(){
    var $href = $(this).attr('href');
    layer_popup($href);
});

function layer_popup(el){
	console.log("el : "+ el);
    var $el = $(el);		//레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');	//dimmed 레이어를 감지하기 위한 boolean 변수

    //isDim ? $('.dim-layer').fadeIn() : $el.fadeIn(); // 딤 레이어가 하나일때 적용
	$('.dim-layer').fadeIn(); // 딤 레이어가 여러개 있어서 각각 적용 
	$el.fadeIn();
	
    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /1,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }
    
	//아무 동작 없이 레이어 팝업 닫기
    $el.find('a.btn-layerClose').click(function(){
        //isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        
        $('.dim-layer').fadeOut(); // 딤 레이어가 여러개 있어서 각각 적용
        $el.fadeOut();
        return false;
    });
     
    //layerCheck -> 동작 
    $el.find('a.btn-layerCheck').click(function(){
		
        $('.dim-layer').fadeOut(); // 딤 레이어가 여러개 있어서 각각 적용
        $el.fadeOut();
        return false;
    }); 

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });

}
</script>
   
</body>
</html>