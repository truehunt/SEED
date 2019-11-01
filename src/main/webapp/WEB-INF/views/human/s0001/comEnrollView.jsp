<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aa</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> 
  	<link href="${pageContext.request.contextPath}/resources/ibsheet/tab/ibtab-style.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibleaders.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibsheet.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/tab/ibtab.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/tab/ibtabinfo.js" type="text/javascript"></script>

<script language="javascript">
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
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
			
			{Header:"회계년도1",Type:"Date",SaveName:"company_fiscal_year_o",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"회계년도2",Type:"Date",SaveName:"company_fiscal_year_t",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"사업자등록번호",Type:"Text",SaveName:"company_reg_num",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"법인등록번호",Type:"Text",SaveName:"company_corp_reg_num",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"대표자성명",Type:"Text",SaveName:"company_rep_name",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"외국인여부",Type:"Text",SaveName:"company_foreigner_whe",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"주민등록번호",Type:"Text",SaveName:"company_resi_reg_num",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"본점우편번호",Type:"Text",SaveName:"company_zip",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"본점주소",Type:"Text",SaveName:"company_address",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"본점상세주소",Type:"Text",SaveName:"company_detail_address",MinWidth:100,Algn:"Center", hidden:1},			
			{Header:"본점전화번호",Type:"Text",SaveName:"company_tel",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"본점FAX",Type:"Text",SaveName:"company_fax",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"업태",Type:"Text",SaveName:"company_business",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"종목",Type:"Text",SaveName:"company_stocks",MinWidth:100,Algn:"Center", hidden:1},
			{Header:"설립연월일",Type:"Date", Align:"Center", SaveName:"company_establishment_date", Format:"", MinWidth:110, hidden:1},
			{Header:"개업연월일",Type:"Date", Align:"Center", SaveName:"company_open_date", Format:"", MinWidth:110, hidden:1},
			{Header:"폐업연월일",Type:"Date", Align:"Center", SaveName:"company_closed_date", Format:"", MinWidth:110, hidden:1},

		];   
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
			    var param = FormQueryStringEnc(document.frm);
				mySheet.DoSearch("${contextPath}/human/s0001/comEnrollView.do", param);
				//mySheet.DoSearch("transaction_data2.json");
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
				//var tempStr = mySheet.GetSaveString();
				//alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet.DoSave("${contextPath}/human/s0001/insertData.do");
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
  <div class="page_title">
    <span><a class="closeDepth" href="#">closeDepth</a></span> 
    <span class="title">기본기능 > <b>트랜젝션관리</b></span>
  </div>
  <div class="main_content">
    <div class="exp_product">각 행의 데이터를 수정하거나 입력,삭제시 상태컬럼의 변화를
			확인하고,저장 버튼 클릭시 서버로 전송되는 데이터를 확인한다.</div>
    <div class="exp_product">
      <form name='frm'>
        <input type='text' id="p_id" name="p_id" value="mySheet.GetCellValue(row,2)"/> 
      </form>
    </div>
    <div class="ib_function float_right">
	  <a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
	  <a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
	  <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
	  <a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
	</div>

	<div class="clear hidden"></div>
	<div class="ib_product"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
  </div>
</body>
</html>