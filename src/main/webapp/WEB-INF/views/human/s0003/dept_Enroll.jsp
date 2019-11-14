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
		width:20px;
		height:15px;
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
</style>


<!--우편번호 관련된 script 추가 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- ibsheet,tab 관련된 script 및 link 추가  -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

	<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
  	<link href="${contextPath}/resources/ibsheet/tab/ibtab-style.css" rel="stylesheet">
	<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
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
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
			// MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
			// Align : data 정렬값.
			// keyfield : keyfield값 필수값 체크시 필요(미입력시 추가안됨.)
			// MultiLineText:1  : 하나의 셀에 여러값을 넣을수 있음(shift+enter)
			// Wrap:1 : 데이터
			// FORMAT 형식 법인/사업자 등록번호 - Format:["IdNo", "SaupNo"], 전화번호/FAX번호 - Format: "PhoneNo", 
			
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
			{Header:"부서코드",Type:"Text",SaveName:"pk_dept_code",MinWidth:60},
			{Header:"부서명",Type:"Text",SaveName:"dept_name",MinWidth:100, },			
			{Header:"사업장코드",Type:"Text",SaveName:"workplace_code",MinWidth:70},
			{Header:"사업장 명",Type:"Text",SaveName:"workplace_name",MinWidth:150},
			{Header:"부문코드",Type:"Text",SaveName:"fk_sector_code",MinWidth:70},
			{Header:"부문명",Type:"Text",SaveName:"sector_name",MinWidth:100},
			{Header:"사용기간",Type:"Date",SaveName:"dept_priodof",MinWidth:60, format:""},
			{Header:"입력자",Type:"Text",SaveName:"dept_int_user_id",MinWidth:80, Hidden:1},
			{Header:"입력일시",Type:"Text",SaveName:"dept_int_date",MinWidth:80, Hidden:1},
			{Header:"수정자",Type:"Text",SaveName:"dept_mod_user_id",MinWidth:80, Hidden:1},
			{Header:"수정일시",Type:"Text",SaveName:"dept_mod_date",MinWidth:80, Hidden:1},
		];   
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
			
		mySheet.DoSearch("${contextPath}/human/s0003/searchList.do"); // 부서등록 페이지로 가면 자동으로 searchList.do 실행 
				
		//숨김
		mySheet.SetColHidden([
	      {Col: 0, Hidden:1}, //상태
	    ]);
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
				//var param = FormQueryStringEnc(document.frm);
				//alert(param);
				//mySheet.DoSearch("${contextPath}/human/s0001/searchList.do", param);
				
				mySheet.DoSearch("${contextPath}/human/s0003/searchList.do");
				
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
				//현재는 테스트 하는 겸 해서 놔두지만 나중에는 주석 처리 해야됨 
				//save 를 하면서 중복 처리 됨 
				var tempStr = mySheet.GetSaveString();
				tempStr += alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet.DoSave("${contextPath}/human/s0003/insertData.do");
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
	            <h1 class="page-header"><i class="fa fa-folder fa-fw"> </i> 부서 등록 <p class='indent' />
	            <button type="submit" class="f1_btn_gray lightgray" onClick="">부문등록</button></h1>
	        </div>
   	 	</div>
  <div class="frame">
    <%-- //header 및 container 시작--%>
    	<div class="header">
    		<div class="header_child">
	        	 사업장  : <select id="workplace_name" name="workplace_name">
	        	 		<option value='aaaaa' hidden='1'></option><!-- 공백 -->
	        	 		</select>
	        	<img src='${contextPath}/resources/image/search_icon.png;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' />
	        </div>
	    </div><!-- //header -->
  <div class="container" style="padding:0px; margin-left:0px;">
	
  <%-- content (아래쪽 layout)시작 --%>
  <div class="nav"></div>
	    <div class="ib_function float_right">
		  <a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
		  <a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
		  <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
		  <a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
		</div>
		<!-- ibsheet 뿌려주는 부분  -->
		<div class="clear hidden"></div>
		<div class="ib_product" style="margin-left:10px;"><script>createIBSheet("mySheet", "100%", "100%");</script></div>

  </div><!-- //container -->
  </div><!-- //frame -->
  </div><!-- //page-wrapper -->
  </div><!-- //wrap -->
  
      
</body>
</html>