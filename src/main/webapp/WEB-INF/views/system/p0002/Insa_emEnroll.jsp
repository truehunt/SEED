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
<title>인사정보등록-재직 정보</title>

<style>
	.frame {
		  width : 850px;
		  margin: 0px;
	}

	.container {
  		overflow: hidden;
  		display: table;
  		margin: 0px;
	}

	.nav {
		  float: left;
		  margin-left:0px;
		  width: 850px;
		  height: 650px;
		  border : 1px solid lightblue;
	}
	
	.tab{
		width:500px;
	}
	.main_content{
		width: 850px;
	}
	.main_menu {
		border : 1px solid lightblue;
	}
	
	.nav, .content {<!--메뉴바 꽉차게 만들기-->
  		display: table-cell;
	}
	
	img {
		width:20px;
		height:15px;
	}
	
	p.indent{
		 padding-left:2em; 
		 margin-left:5%;
	}
	
	table{
		width:100%;
	}
	
	.disabled {
    pointer-events: none;
    background-color: #eee;
    color: #555;
    opacity: 1;
	}
	/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
	.ui-datepicker-trigger{cursor: pointer;}
	
	/*datepicer input 롤오버 시 손가락 모양 표시*/
	.hasDatepicker{cursor: pointer;}
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
	  
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript">
	//시트 높이 계산용
	var pageheightoffset = 200;
	
	//Combo 값 위한 초기화
	var HE=""; // 재직구분
	var S2=""; // 수습적용
	var S6=""; // 근속기간 포함
	
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
			// 기능을 위해서 전부  hidden 처리 함
			
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50, Align:"Center"},
			{Header:"No",Type:"Seq",SaveName:"pk_em_info_uniq_num",MinWidth:50, Align:"Center"},
			{Header:"사원 코드",Type:"Text",SaveName:"fk_sawon_code",MinWidth:90, Align:"Center"},			
			{Header:"입사일",Type:"Text",SaveName:"em_info_join_date",MinWidth:100, Align:"Center"},
			{Header:"퇴직일",Type:"Text",SaveName:"em_info_resi_date",MinWidth:100, Align:"Center"},
			{Header:"재직구분",Type:"Combo",SaveName:"em_info_offi_division",MinWidth:60, Align:"Center"},
			{Header:"중도퇴사일",Type:"Text",SaveName:"em_info_date_retire",MinWidth:100, Align:"Center"},
			{Header:"수습적용",Type:"Combo",SaveName:"em_info_prob_appli",MinWidth:60, Align:"Center"},
			{Header:"수습만료일",Type:"Text",SaveName:"em_info_prob_expi_date",MinWidth:100, Align:"Center"},
			{Header:"근속기간포함",Type:"Combo",SaveName:"em_info_includ_work_peri",MinWidth:60, Align:"Center"},			
			{Header:"휴직기간1",Type:"Text",SaveName:"em_info_lea_absence_o",MinWidth:100, Align:"Center"},
			{Header:"휴직기간2",Type:"Text",SaveName:"em_info_lea_absence_t",MinWidth:100, Align:"Center"},
			{Header:"부서코드",Type:"Text",SaveName:"fk_dept_code",MinWidth:60, Align:"Center"},			
			{Header:"부서명",Type:"Text",SaveName:"dept_name",MinWidth:80, Align:"Center"},
			{Header:"고용형태 코드",Type:"Text",SaveName:"em_info_emply_form_cd",MinWidth:60, Align:"Center"},
			{Header:"고용형태 명",Type:"Text",SaveName:"em_info_emply_form_nm",MinWidth:80, Align:"Center"},
			{Header:"직종 코드",Type:"Text",SaveName:"fk_occupation_code",MinWidth:60, Align:"Center"},
			{Header:"직종 명",Type:"Text",SaveName:"occupation_name",MinWidth:80, Align:"Center"},
			{Header:"급여형태 코드",Type:"Text",SaveName:"fk_pay_form_code",MinWidth:60, Align:"Center"},			
			{Header:"급여형태 명",Type:"Text",SaveName:"pay_form_name",MinWidth:80, Align:"Center"},
			{Header:"프로젝트 코드",Type:"Text",SaveName:"em_info_project_code",MinWidth:60, Align:"Center"},
			{Header:"프로젝트 명",Type:"Text",SaveName:"em_info_project_name",MinWidth:80, Align:"Center"},
			{Header:"근무조 코드",Type:"Text",SaveName:"em_info_work_group_cd",MinWidth:60, Align:"Center"},			
			{Header:"근무조 명",Type:"Text",SaveName:"em_info_work_group_nm",MinWidth:80, Align:"Center"},
			{Header:"직급 코드",Type:"Text",SaveName:"fk_rank_code",MinWidth:60, Align:"Center"},
			{Header:"직급 명",Type:"Text",SaveName:"rank_name",MinWidth:80, Align:"Center"},
			{Header:"직책 코드",Type:"Text",SaveName:"em_info_position_code",MinWidth:60, Align:"Center"},
			{Header:"직책 명",Type:"Text",SaveName:"em_info_position_name",MinWidth:80, Align:"Center"},
			{Header:"직무 코드",Type:"Text",SaveName:"em_info_duty_code",MinWidth:60, Align:"Center"},			
			{Header:"직무 명",Type:"Text",SaveName:"em_info_duty_name",MinWidth:80, Align:"Center"},
			{Header:"분류 코드",Type:"Text",SaveName:"em_info_classifi_code",MinWidth:60, Align:"Center"},
			{Header:"분류 코드 명",Type:"Text",SaveName:"em_info_classifi_name",MinWidth:80, Align:"Center"},
			{Header:"퇴직사유 코드",Type:"Text",SaveName:"em_info_retire_reason_code",MinWidth:60, Align:"Center"},
			{Header:"퇴직사유 명",Type:"Text",SaveName:"em_info_retire_reason_name",MinWidth:80, Align:"Center"},
			{Header:"귀속연월",Type:"Text",SaveName:"em_info_attri",MinWidth:150, Align:"Center"},
			{Header:"pk_사원코드",Type:"Text",SaveName:"pk_sawon_code",MinWidth:100, Align:"Center"},
			{Header:"pk_부서코드",Type:"Text",SaveName:"pk_dept_code",MinWidth:100, Align:"Center"},

			{Header:"입력자",Type:"Text",SaveName:"em_info_int_user_id",MinWidth:100, Align:"Center"},
			{Header:"입력일시",Type:"Date",SaveName:"em_info_int_date",MinWidth:100, Align:"Center"},
			{Header:"수정자",Type:"Text",SaveName:"em_info_mod_user_id",MinWidth:100, Align:"Center"},
			{Header:"수정일시",Type:"Date",SaveName:"em_info_mod_date",MinWidth:100, Align:"Center"},

		];   
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		
		//로딩됨과 동시에 2019001 로 내용 채워짐 
		doAction('search');
		
		//mySheet.DoSearch("${contextPath}/system/p0002/searchList3.do"); // 회사등록 페이지로 가면 자동으로 searchList.do 실행 
		 
		//콤보박스에 값 불러오기 -> 페이지 로드 시 콤보박스 초기화
		selectEm();
		$('#em_info_offi_division').html("   ");
		$('#em_info_prob_appli').html("   ");
		$('#em_info_includ_work_peri').html("   ");
		
		//ibSheet 에서 col 지정해서 숨김
		 mySheet.SetColHidden([//0~39번째 까지...실상 전 ibSheet 숨김
	      {Col: 0, Hidden:1}, {Col: 1, Hidden:1}, {Col: 2, Hidden:1}, {Col: 3, Hidden:1}, {Col: 4, Hidden:1}, {Col: 5, Hidden:1}, {Col: 6, Hidden:1}, 
	      {Col: 7, Hidden:1}, {Col: 8, Hidden:1}, {Col: 9, Hidden:1}, {Col: 10, Hidden:1}, {Col: 11, Hidden:1}, {Col: 12, Hidden:1}, {Col: 13, Hidden:1}, 
	      {Col: 14, Hidden:1}, {Col: 15, Hidden:1}, {Col: 16, Hidden:1}, {Col: 17, Hidden:1}, {Col: 18, Hidden:1}, {Col: 19, Hidden:1}, {Col: 20, Hidden:1}, 
	      {Col: 21, Hidden:1}, {Col: 22, Hidden:1}, {Col: 23, Hidden:1}, {Col: 24, Hidden:1}, {Col: 25, Hidden:1}, {Col: 26, Hidden:1}, {Col: 27, Hidden:1}, 
	      {Col: 28, Hidden:1}, {Col: 29, Hidden:1}, {Col: 30, Hidden:1}, {Col: 31, Hidden:1}, {Col: 32, Hidden:1}, {Col: 33, Hidden:1}, {Col: 34, Hidden:1},
	      {Col: 35, Hidden:1}, {Col: 36, Hidden:1}, {Col: 37, Hidden:1}, {Col: 38, Hidden:1}, {Col: 39, Hidden:1}, {Col: 40, Hidden:1},
	    ]);
	 // onClick 이벤트 중 select 태그에 em_info_offi_division인 값의 변경이 있을때 실행
		  $("#em_info_offi_division").change(function(e){ 
			  var colArr =  Object.keys(mySheet.SaveNameInfo);
			  var colNum = colArr.indexOf(e.target.id);	
			  t_row = 1; 	
				 
			  mySheet.SetCellValue(t_row, colNum, e.target.value);
			})
			
		  // onClick 이벤트 중 select 태그에 em_info_prob_appli인 값의 변경이 있을때 실행
		  $("#em_info_prob_appli").change(function(e){ 
			  var colArr =  Object.keys(mySheet.SaveNameInfo);
			  var colNum = colArr.indexOf(e.target.id);	
			  t_row = 1; 
			    
			  mySheet.SetCellValue(t_row, colNum, e.target.value);
			})
			
		  // onClick 이벤트 중 select 태그에 em_info_includ_work_peri인 값의 변경이 있을때 실행
		  $("#em_info_includ_work_peri").change(function(e){ 
			  var colArr =  Object.keys(mySheet.SaveNameInfo);
			  var colNum = colArr.indexOf(e.target.id);	
			  t_row = 1; 
				
			  mySheet.SetCellValue(t_row, colNum, e.target.value);
			})
	}
	
	 function rowCheck(code){//메인화면에서 클릭한 row부분에 대한 사원코드 값 받아옴
			$('#sawon_code').val(code);
	 
	 		console.log("emEnroll : "+$('#sawon_code').val());
	 		doAction('search');		
	 }
	 
	 $(document).on('change', 'input', function(e) { // 수정할시에 state에 문구 저장 및 SetCellValue 실행
		  var colArr = Object.keys(mySheet.SaveNameInfo);
		  var colNum = colArr.indexOf(e.target.id);
			
  		  mySheet.SetCellValue(t_row, colNum ,e.target.value);
	 	
	 });
	 
	// 공통_팝업에서  onClick 이벤트 후 값 입력
	 function fn_selectCode(code_num, code_name, code_id, code_nameId) {
			console.log("info:"+code_num);//코드
			console.log("info:"+code_name);// 코드명
			console.log("info:"+code_id);//코드 id
			console.log("info:"+code_nameId);// 코드명 id
			
			//코드
			mySheet.SetCellValue(1, code_id, code_num);
			$("#"+code_id).val(code_num);
			
			//명
			mySheet.SetCellValue(1, code_nameId, code_name);
			$("#"+code_nameId).val(code_name);
			
		    //$("#popupUsers").modal("hide");
	}
	
	// 부서_팝업에서  onClick 이벤트 후 값 입력
	 function fn_Dept_Selected(code_num, code_name, code_id, code_nameId) {
			console.log("info:"+code_num);//코드
			console.log("info:"+code_name);// 코드명
			console.log("info:"+code_id);//코드 id
			console.log("info:"+code_nameId);// 코드명 id
			
			//코드
			mySheet.SetCellValue(1, code_id, code_num);
			$("#"+code_id).val(code_num);
			
			//명
			mySheet.SetCellValue(1, code_nameId, code_name);
			$("#"+code_nameId).val(code_name);
			
		    //$("#popupUsers").modal("hide");
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
				var param = FormQueryStringEnc(document.frm2);
				//alert(param);
				
				mySheet.DoSearch("${contextPath}/system/p0002/searchList3.do", param);
				
				//콤보박스에 값 불러오기 -> 행 추가(입력) 및 append 중복 추가 방지
				selectEm();
				$('#em_info_offi_division').html("   ");
				$('#em_info_prob_appli').html("   ");
				$('#em_info_includ_work_peri').html("   ");
				
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장

				var tempStr = mySheet.GetSaveString();

				//현재는 테스트 하는 겸 해서 놔두지만 나중에는 주석 처리 해야됨 
				//save 를 하면서 중복 처리 됨 
				//tempStr += alert("서버로 전달되는 문자열 확인 :"+tempStr);
				
				//console.log("save: "+$('#STATUS').val + "입니다.");
				mySheet.DoSave("${contextPath}/system/p0002/insertData3.do");
				break;
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();
				
				//콤보박스에 값 불러오기 -> 행 추가(입력) 및 append 중복 추가 방지
				selectEm();
				$('#em_info_offi_division').html("   ");
				$('#em_info_prob_appli').html("   ");
				$('#em_info_includ_work_peri').html("   ");
				
				break;
		}
	}

		function selectEm() { // 인사코드조회
			
			var em1 =""; // 재직 구분 
			var em2 =""; // 수습적용
			var em3 =""; // 근속기간 포함

			$.ajax({ // 인사기초코드 조회
				url : "${contextPath}/human/p0001/ISA_c.do",//목록을 조회 할 url 
				type : "POST",
				dataType : "JSON",
				success : function(data) {
					for (var i = 0; i < data['Data'].length; i++) {
						var MNGEMENT_NAME = "<option value='" + data['Data'][i].person_BC_DETAI_MNGEMENT_NAME + "'>" + data['Data'][i].person_BC_DETAI_MNGEMENT_NAME + "</option>"; 
						//이건 상관x => 여기는 일반 table에 넣어주는 코드입니다.
						var info1 = '|' + data['Data'][i].person_BC_DETAI_MNGEMENT_NAME; // 안건드려도 됩니다.
						
						var code_ = data['Data'][i].fk_PERSON_BC_CODE_NUM; //
						
						switch(code_){
							case 'HE': // 재직 구분 -> input box
								em1 = em1+info1; // 그리드에 저장
								$('#em_info_offi_division').append(MNGEMENT_NAME);//input box에 저장
								//console.log(em1);
								break;
							case 'S2': // 수습 적용 -> input box
								em2 = em2+info1; // 그리드에 저장
								$('#em_info_prob_appli').append(MNGEMENT_NAME);//input box에 저장
								//console.log(em2);
								break;
							case 'S6': // 근속기간 포함 -> input box
								em3 = em3+info1; // 그리드에 저장
								$('#em_info_includ_work_peri').append(MNGEMENT_NAME);//input box에 저장
								//console.log(em3);
								break;
						}
						
					}
					this.Action();
				},
				Action: function(){	 // combo를 넣는 곳

					HE = {'ComboCode':em1,'ComboText':em1}; // 재직 구분
					S2 = {'ComboCode':em2,'ComboText':em2}; // 수습 적용
					S6 = {'ComboCode':em3,'ComboText':em3}; // 근속기간 포함
					
					for(var i = 1; i<=mySheet.RowCount(); i++){ // 조회할때 갯수 세어서 거기에 전부 넣기위해서 for문 돌립니다.
						//console.log(i);
						mySheet.CellComboItem(i,6,HE); // 재직 구분 ( 재직 , 파견 , 휴직 , 대기 , 퇴직  )
						mySheet.CellComboItem(i,8,S2); // 수습 적용 ( 부 , 여 )
						mySheet.CellComboItem(i,10,S6); // 근속기간 포함 ( 안함 , 함 )

					}
					mySheet_OnSearchEnd();
				},
				error : function(jqxhr, status, error) {
					alert("에러");
				}
			});
		};
	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
		var pk = mySheet.GetCellValue(1,3);
		t_row = 1;
		var colArr = Object.keys(mySheet.SaveNameInfo);
 	    if(mySheet.GetCellValue(1,3) == -1){ // 데이터가 비어있을 시 실행
 	    	  $.each(colArr,function(k,v){ // .each - 배열을 반복문으로 돌림 key 와 value 값을 가진다. 
				  	$("#"+v).val(''); // ibsheet의 GetCellValue 메서드를 사용해 row 의 key value 를 가져옴 
			  })
		  }else if(mySheet.GetCellValue(1,3) != -1){ // 데이터가 있을 시 실행

 			  $('#em_info_join_date').val(mySheet.GetCellValue(1,4));
			  $('#em_info_resi_date').val(mySheet.GetCellValue(1,5));
			  $('#em_info_offi_division').val(mySheet.GetCellValue(1,6)).attr("selected","selected");
			  $('#em_info_date_retire').val(mySheet.GetCellValue(1,7));
			  $('#em_info_prob_appli').val(mySheet.GetCellValue(1,8)).attr("selected","selected");
			  $("#em_info_prob_expi_date").val(mySheet.GetCellValue(1,9));
			  $('#em_info_includ_work_peri').val(mySheet.GetCellValue(1,10)).attr("selected","selected");
			  $('#em_info_lea_absence_o').val(mySheet.GetCellValue(1,11));
			  $('#em_info_lea_absence_t').val(mySheet.GetCellValue(1,12));
			  $('#fk_dept_code').val(mySheet.GetCellValue(1,13));
			  $('#dept_name').val(mySheet.GetCellValue(1,14));
			  $('#em_info_emply_form_cd').val(mySheet.GetCellValue(1,15));
			  $('#em_info_emply_form_nm').val(mySheet.GetCellValue(1,16));
			  $('#fk_occupation_code').val(mySheet.GetCellValue(1,17));
			  $('#occupation_name').val(mySheet.GetCellValue(1,18));
			  $('#fk_pay_form_code').val(mySheet.GetCellValue(1,19));
			  $('#pay_form_name').val(mySheet.GetCellValue(1,20));
			  $('#em_info_project_code').val(mySheet.GetCellValue(1,21));
			  $('#em_info_project_name').val(mySheet.GetCellValue(1,22));
			  $('#em_info_work_group_cd').val(mySheet.GetCellValue(1,23));
			  $('#em_info_work_group_nm').val(mySheet.GetCellValue(1,24));
			  $('#fk_rank_code').val(mySheet.GetCellValue(1,25));
			  $('#rank_name').val(mySheet.GetCellValue(1,26));
			  $('#em_info_position_code').val(mySheet.GetCellValue(1,27));
			  $('#em_info_position_name').val(mySheet.GetCellValue(1,28));
			  $('#em_info_duty_code').val(mySheet.GetCellValue(1,29));
			  $('#em_info_duty_name').val(mySheet.GetCellValue(1,30));
			  $('#em_info_classifi_code').val(mySheet.GetCellValue(1,31));
			  $('#em_info_classifi_name').val(mySheet.GetCellValue(1,32));
			  $('#em_info_retire_reason_code').val(mySheet.GetCellValue(1,33));
			  $('#em_info_retire_reason_name').val(mySheet.GetCellValue(1,34));   
			  $('#em_info_attri').val(mySheet.GetCellValue(1,35)); 
			  $('#pk_sawon_code').val(mySheet.GetCellValue(1,36)); 
			  $('#pk_dept_code').val(mySheet.GetCellValue(1,37)); 
			  
			  $('#em_info_int_user_id').val(mySheet.GetCellValue(1,38)); 
			  $('#em_info_int_date').val(mySheet.GetCellValue(1,39)); 
			  $('#em_info_mod_user_id').val(mySheet.GetCellValue(1,40)); 
			  $('#em_info_mod_date').val(mySheet.GetCellValue(1,41));
		  }
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
	
	<!-- 달력 datepicker  -->
	<script>
		$(function() {
		    //모든 datepicker에 대한 공통 옵션 설정
		    $.datepicker.setDefaults({
		        dateFormat: 'yy-mm-dd' //Input Display Format 변경
		        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		        ,changeYear: true //콤보박스에서 년 선택 가능
		        ,changeMonth: true //콤보박스에서 월 선택 가능                
		        ,yearRange: "-3:+3" // 콤보박스에서 3년 전 부터 3년후 까지 표시되게 만듬
		        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		        ,buttonImage: "${contextPath}/resources/ibsheet/Main/calendar.gif;" //버튼 이미지 경로
		        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
		        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		        //,minDate: "-3Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		        //,maxDate: "+5M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
		    });
		    
		    //input을 datepicker로 선언
		    $("#em_info_join_date").datepicker();
		    $("#em_info_resi_date").datepicker();
		    $("#em_info_date_retire").datepicker();
		    $("#em_info_prob_expi_date").datepicker();
		    $("#em_info_lea_absence_o").datepicker();
		    $("#em_info_lea_absence_t").datepicker();

		});
	</script>

  <div class="frame">
    <%-- //header 및 container 시작--%>

  <div class="container" style="padding:0px; margin-left:0px;">
	<%-- nav (왼쪽 layout)시작 --%>

  <div class="nav">
	  
	  <div class="main_content">
	    <div class="exp_product">
	    </div>
	    
		<!-- ibsheet 뿌려주는 부분  -->
		<div class="hidden">
			<div class="ib_product"><script>createIBSheet("mySheet", "80%", "80%");</script></div>
		</div>

		<form name = 'frm2'>
			<!-- 사원코드 값 가져오기 -->
			<input type='text' id="sawon_code" name="sawon_code" hidden="1" />	
		</form>
			<div style="border:1px solid lightblue">
			<!-- 입사 정보 -->
			<table>
				<tr>
					<td rowspan="6">
						<div style="writing-mode: tb-rl; width:40px; height:201px; border:1px solid lightblue; padding-right:10px;">
							<img src='${contextPath}/resources/ibsheet/Main/d_right2.gif' style="margin-top:5px; margin-left:-5px; width:15px; height:15px;" />
							입사 정보
						</div>
					</td>
					<td align="right" style="width:90px;">입사 일 : </td>
	    			<td style="width:250px;">
	    				<input type="text" name="em_info_join_date" id="em_info_join_date" size="12px" placeholder="_ _ _ _-_ _-_ _">
	    			</td><td></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<button class="btn btn-outline btn-primary" onclick="doAction('save')">저장</button>
					</td>
				</tr>
				<tr>
					<td align="right">퇴직 일 : </td>
	    			<td>
	    				<input type="text" name="em_info_resi_date" id="em_info_resi_date" size="12px" placeholder="_ _ _ _-_ _-_ _">
	    			</td>
					
					<td align="right" style="width:90px;">재직 구분 : </td>
	    			<td>
	    				<select name="em_info_offi_division" id="em_info_offi_division">
	    					<option value='' hidden='1'></option><!-- 공백  -->
	    					<!-- <option value='1.재직'>1.재직</option>  -->
	    				</select>
	    			</td>
				</tr>
				<tr>
					<td align="right">중도 퇴사일 : </td>
	    			<td>
	    				<input type="text" name="em_info_date_retire" id="em_info_date_retire" size="12px" placeholder="_ _ _ _-_ _-_ _">
	    			</td>
					<td colspan="2"></td><!-- 빈 데이터 -->
				</tr>
				<tr>
					<td align="right">수습 적용 : </td>
	    			<td>
	    				<select name="em_info_prob_appli" id="em_info_prob_appli">
	    					<option value='' hidden='1'></option><!-- 공백  -->
	    					<!-- <option value='1.부'>1.부</option>  -->
	    				</select>
	    			</td>
	    			
					<td align="right">수습 만료일 : </td>
	    			<td>
	    				<input type="text" name="em_info_prob_expi_date" id="em_info_prob_expi_date" size="12px" placeholder="_ _ _ _-_ _-_ _">
	    			</td>
				</tr>				
				<tr>
					<td align="right">근속 기간포함 : </td>
	    			<td>
	    				<select name="em_info_includ_work_peri" id="em_info_includ_work_peri">
	    					<option value='' hidden='1'></option><!-- 공백  -->
	    					 <!-- <option value='1.안함'>1.안함</option>  -->
	    				</select>
	    			</td>
					<td colspan="2"></td>
				</tr>
				<tr>
				   	<td align="right">휴직 기간 : </td>
				   	<td> 
					   	<input type="text" name="em_info_lea_absence_o" id="em_info_lea_absence_o" size="12px" placeholder="_ _ _ _-_ _-_ _" readonly>
					   	~  <input type="text" name="em_info_lea_absence_t" id="em_info_lea_absence_t" size="12px" placeholder="_ _ _ _-_ _-_ _" readonly>
				   	</td>
					<td colspan="2"></td>
					
				</tr>
			</table>
			</div><div style="height:5px;"></div><!-- //입사정보 -->
			
			<div style="border:1px solid lightblue">
			<!-- 근무 정보 -->
			<table>
				<tr>
					<td rowspan="13"><!-- 2개는 여비로 놔둠 실제 데이터는 11줄까지-->
						<div style="writing-mode: tb-rl; width:40px; height:401px; border:1px solid lightblue; padding-right:10px;">
							<img src='${contextPath}/resources/ibsheet/Main/d_right2.gif' style="margin-top:5px; margin-left:-5px; width:15px; height:15px;" />
							근무 정보
						</div>
					</td>
				  	<td align="right" style="width:137px; margin-top:5px;">부 서 : </td>
	    			<td>
	    				<input type="text" name="fk_dept_code" id="fk_dept_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup_Dept("fk_dept_code", "dept_name", "#myTabs_contents-1-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="dept_name" id="dept_name" size="45px" class="disabled">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">고용 형태 : </td>
	    			<td>
	    				<input type="text" name="em_info_emply_form_cd" id="em_info_emply_form_cd" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("G1","em_info_emply_form_cd", "em_info_emply_form_nm", "#myTabs_contents-1-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="em_info_emply_form_nm" id="em_info_emply_form_nm" size="45px" class="disabled">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">직 종 : </td>
	    			<td>
	    				<input type="text" name="fk_occupation_code" id="fk_occupation_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("G2","fk_occupation_code", "occupation_name", "#myTabs_contents-1-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="occupation_name" id="occupation_name" size="45px" class="disabled">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">급여 형태 : </td>
	    			<td>
	    				<input type="text" name="fk_pay_form_code" id="fk_pay_form_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("P5","fk_pay_form_code", "pay_form_name", "#myTabs_contents-1-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="pay_form_name" id="pay_form_name" size="45px" class="disabled">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">프로젝트 : </td>
	    			<td>
	    				<input type="text" name="em_info_project_code" id="em_info_project_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("G5","em_info_project_code", "em_info_project_name", "#myTabs_contents-1-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="em_info_project_name" id="em_info_project_name" size="45px" class="disabled">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">근무조 : </td>
	    			<td>
	    				<input type="text" name="em_info_work_group_cd" id="em_info_work_group_cd" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("02","em_info_work_group_cd", "em_info_work_group_nm", "#myTabs_contents-1-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="em_info_work_group_nm" id="em_info_work_group_nm" size="45px" class="disabled">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">직 급 : </td>
	    			<td>
	    				<input type="text" name="fk_rank_code" id="fk_rank_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("G4","fk_rank_code", "rank_name", "#myTabs_contents-1-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="rank_name" id="rank_name" size="45px" class="disabled">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">직 책 : </td>
	    			<td>
	    				<input type="text" name="em_info_position_code" id="em_info_position_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("G3","em_info_position_code", "em_info_position_name", "#myTabs_contents-1-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="em_info_position_name" id="em_info_position_name" size="45px" class="disabled">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">직 무 : </td>
	    			<td>
	    				<input type="text" name="em_info_duty_code" id="em_info_duty_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("G5","em_info_duty_code", "em_info_duty_name", "#myTabs_contents-1-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="em_info_duty_name" id="em_info_duty_name" size="45px" class="disabled">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">분류 코드 : </td>
	    			<td>
	    				<input type="text" name="em_info_classifi_code" id="em_info_classifi_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("G5","em_info_classifi_code", "em_info_classifi_name", "#myTabs_contents-1-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="em_info_classifi_name" id="em_info_classifi_name" size="45px" class="disabled">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">퇴직 사유 : </td>
	    			<td>
	    				<input type="text" name="em_info_retire_reason_code" id="em_info_retire_reason_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("RL","em_info_retire_reason_code", "em_info_retire_reason_name", "#myTabs_contents-1-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="em_info_retire_reason_name" id="em_info_retire_reason_name" size="45px" class="disabled">
	    			</td>
				</tr>
				<tr>
					<td colspan="2" style="height:20px;"></td><!-- 빈 데이터 -->
				</tr>
				<tr>
					<td colspan="2" style="height:20px;"></td><!-- 빈 데이터 -->
				</tr>																																												
			</table>
			</div><!-- //근무 정보 -->

	  </div> <!-- //nav  -->
	  </div> <!-- //onClick -->

  </div><!-- //container -->
  </div><!-- //frame -->
      
</body>
</html>