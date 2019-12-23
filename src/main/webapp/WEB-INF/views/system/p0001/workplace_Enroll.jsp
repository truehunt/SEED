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
<title>사업장 등록</title>

<style>
	.frame {
		  width : 1365px;
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
		  width: 550px;
		  height: 600px;
		  border : 1px solid lightblue;
	}
	.content {
		  margin-left:570px;
		  margin-top:-600px;
		  float: right;
		  width: 800px;
		  height: 600px;
		  border : 1px solid lightblue;
	}
	.main_content{
		width: 510px;
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
	var S2="";
	
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
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50, Align:"Center"},
			{Header:"사업장코드",Type:"Text",SaveName:"pk_workplace_code",MinWidth:100, Align:"Center", KeyField:1, UpdateEdit:0},
			{Header:"회사코드",Type:"Text",SaveName:"fk_company_code",MinWidth:60, Hidden:1},			
			{Header:"사업장명",Type:"Text",SaveName:"workplace_name",MinWidth:150, Align:"Center", KeyField:1},
			{Header:"사업자등록번호",Type:"Text",SaveName:"workplace_com_reg_num",MinWidth:150, KeyField:1, Hidden:1},
			{Header:"법인등록번호",Type:"Text",SaveName:"workplace_corp_reg_num",MinWidth:150, Hidden:1},
			{Header:"대표자명",Type:"Text",SaveName:"workplace_rep_name",MinWidth:80, KeyField:1, Hidden:1},
			{Header:"사업장우편번호",Type:"Text",SaveName:"workplace_zip",MinWidth:60, Hidden:1},
			{Header:"사업장주소",Type:"Text",SaveName:"workplace_address",MinWidth:150, KeyField:1, Hidden:1},
			{Header:"사업장상세주소",Type:"Text",SaveName:"workplace_detail_address",MinWidth:100, Hidden:1},
			{Header:"사업장전화번호",Type:"Text",SaveName:"workplace_tel",MinWidth:60, Hidden:1},			
			{Header:"사업장fax",Type:"Text",SaveName:"workplace_fax",MinWidth:60, Hidden:1},
			{Header:"업태",Type:"Text",SaveName:"workplace_business",MinWidth:60, KeyField:1, Hidden:1},
			{Header:"종목",Type:"Text",SaveName:"workplace_stocks",MinWidth:60, KeyField:1, Hidden:1},
			{Header:"개업년월일",Type:"Text",SaveName:"workplace_open_date",MinWidth:60, Hidden:1},
			{Header:"폐업년월일",Type:"Text",SaveName:"workplace_closed_date",MinWidth:60, Hidden:1},
			{Header:"본점여부",Type:"Combo", MinWidth:80, SaveName:"workplace_headoff_whe",MinWidth:60, Hidden:1},
			{Header:"조회조건",Type:"Text",SaveName:"workplace_inquiry_code",MinWidth:80, Hidden:1},
			{Header:"입력자",Type:"Text",SaveName:"workplace_int_user_id",MinWidth:80, Hidden:1},
			{Header:"입력일시",Type:"Text",SaveName:"workplace_int_date",MinWidth:80, Hidden:1},
			{Header:"수정자",Type:"Text",SaveName:"workplace_mod_user_id",MinWidth:80, Hidden:1},
			{Header:"수정일시",Type:"Text",SaveName:"workplace_mod_date",MinWidth:80, Hidden:1},
			//{Header:"회사코드(com)",Type:"Text",SaveName:"pk_company_code",MinWidth:80, Hidden:1},
			
			
		];   
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
		
		mySheet.DoSearch("${contextPath}/human/s0002/searchList.do"); // 회사등록 페이지로 가면 자동으로 searchList.do 실행 
	
		//콤보박스에 값 불러오기 
		selectHead();
		
		//ibSheet 에서 col 지정해서 숨김
		mySheet.SetColHidden([
	      {Col: 0, Hidden:1}, //상태
	    ]);
	}
	
	//onClick 이벤트
	 var t_row = 0;
	 function mySheet_OnClick(row, col, value, cellx, celly, cellw, cellh) {
	  t_row = row;
     if (row == null || row <= 0) return; // row가 null 이거나 0보다 같거나 작으면 바로 리턴
    
     var pk = mySheet.GetCellValue(row,2); // 마우스로 클릭한 셀의 value를 가져와서 pk에 저장
     
     var colArr =  Object.keys(mySheet.SaveNameInfo); // object.keys()메서드는 개체 고유 속성의 키를 배열로 반환, 										 // 배열순서는 일반반복문을 사용할 때와 동일 , rx는 매핑되려는 칼럼의 이름을 들고있다.
  	  
  	  $.each(colArr,function(k,v){ // .each - 배열을 반복문으로 돌림 key 와 value 값을 가진다. 
	  	  $("#"+v).val(mySheet.GetCellValue(row,k)); // ibsheet의 GetCellValue 메서드를 사용해 row 의 key value 를 가져옴 
	  })
	  
	  // onClick 이벤트 중 select 태그에 workplace_headoff_whe인 값의 변경이 있을때 실행
	  $("#workplace_headoff_whe").change(function(e){ 
			var colNum = colArr.indexOf(e.target.id);	
			
			console.log("colNum :" + colNum);
			 
			var headoff = document.getElementById("workplace_headoff_whe");
			var selectBox = headoff.options[headoff.selectedIndex].value;
			
			/* var val = colNum+1; 
			   console.log(val);
			*/
			switch(selectBox){
			case "부" :
				console.log("본점여부 2 : "+ workplace_headoff_whe)
				//mySheet.GetCellValue(t_row, colNum+1) = 2;
				mySheet.SetCellValue(t_row, colNum+1, 1);
				break;
			case "여" :
				console.log("본점여부 1 : "+ workplace_headoff_whe)
				//mySheet.GetCellValue(t_row, colNum+1) = 1;
				mySheet.SetCellValue(t_row, colNum+1, 1);
				break;
			default:
				break;
			}
			
			mySheet.SetCellValue(t_row, colNum, e.target.value); // 본점여부
			
		})
		
  }
	 	 
	 $(document).on('change', 'input', function(e) { // 수정할시에 state에 문구 저장 및 SetCellValue 실행
		  var colArr = Object.keys(mySheet.SaveNameInfo);
		  var colNum = colArr.indexOf(e.target.id);
			
   		  mySheet.SetCellValue(t_row, colNum ,e.target.value);
	 	
	 });
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
				//var param = FormQueryStringEnc(document.frm);
				//alert(param);
				//mySheet.DoSearch("${contextPath}/human/s0001/searchList.do", param);
				
				mySheet.DoSearch("${contextPath}/human/s0002/searchList.do");
				
				//콤보박스에 값 불러오기 -> 행 추가(입력) 및 append 중복 추가 방지
				selectHead();
				$('#workplace_headoff_whe').html("   ");
				
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
				//var tempStr = mySheet.GetSaveString();
				
				//현재는 테스트 하는 겸 해서 놔두지만 나중에는 주석 처리 해야됨 
				//save 를 하면서 중복 처리 됨
				//tempStr += alert("서버로 전달되는 문자열 확인 :"+tempStr);
				
				mySheet.DoSave("${contextPath}/human/s0002/insertData.do");
				break;
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();
			
				//콤보박스에 값 불러오기 -> 행 추가후 실행
				selectHead();
				$('#workplace_headoff_whe').html("   ");
				
				break;
		}
	}
	// Validation 확인하기
	function mySheet_OnValidation(Row, Col, Value){
		console.log('확인');
		
		switch(Col){
			/*
				사업자 등록번호 length == 12
				법인 등록번호 length == 14
				전화번호 & 팩스 length == 12,11,13
			*/
			case 5: // 사업자 등록번호 
				//console.log(Value);
				//console.log(Value.length);
				if(Value.length >= 0 && Value.length < 12){
					alert("사업장 등록번호는 12자리로 입력하셔야 됩니다.");
					mySheet.ValidateFail(1); // Validation 실패
					document.getElementById('workplace_com_reg_num').focus(); //실패시 포커스 이동
				}
				break;
				
			case 6: // 법인 등록번호 
				//console.log(Value);
				//console.log(Value.length);
				if(Value.length == ''){ // null 값이면 
					mySheet.ValidateFail(0);
				}else if(Value.length >= 0 && Value.length < 14 ){
					alert("법인 등록번호는 입력 안하시거나 14자리로 입력하셔야 됩니다.");
					mySheet.ValidateFail(1);
					document.getElementById('workplace_corp_reg_num').focus();
				}
				break;
				
			case 11: // 사업장 전화번호
				//console.log(Value);
				//console.log(Value.length);
				if(Value.length == ''){ // null 값이면 
					mySheet.ValidateFail(0);
				}else if(Value.length != 11 && Value.length != 12 && Value.length != 13){
					alert("사업장 전화번호는 '-'을 제외한 9 or 10 or 11 자리로 입력하셔야 됩니다.");
					mySheet.ValidateFail(1);
					document.getElementById('workplace_tel').focus();
				}
				
				break;
			
			case 12: // 사업장 fax 번호
				//console.log(Value);
				//console.log(Value.length);
				if(Value.length == ''){ // null 값이면 
					mySheet.ValidateFail(0);
				}else if(Value.length != 11 && Value.length != 12 && Value.length != 13){
					alert("사업장 fax번호는 '-'을 제외한 9 or 10 or 11 자리로 입력하셔야 됩니다.");
					mySheet.ValidateFail(1);
					document.getElementById('workplace_fax').focus();
				}
				
				break;
		}
	}
	
	function selectHead() { // 인사코드조회
		
		var head=""; // 해당 여부 코드 ( 부, 여)

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
					
					//console.log(MNGEMENT_NAME);
					if(code_ == 'S2'){
						head = head + info1; 
						$('#workplace_headoff_whe').append(MNGEMENT_NAME);//input box에 저장
						//console.log(head);
					}
				}
				this.Action();
			},
			Action: function(){	 // combo를 넣는 곳
				
				S2 = {'ComboCode':head,'ComboText':head}; // 본점 여부
				
				for(var i = 1; i<=mySheet.RowCount(); i++){ // 조회할때 갯수 세어서 거기에 전부 넣기위해서 for문 돌립니다.
					//console.log(i);
					//console.log(mySheet.RowCount());
					//console.log("S2 : "+S2+" 입니다.");
					mySheet.CellComboItem(i,17,S2); // 해당 여부 코드 ( 부, 여)	
				}
			},
			error : function(jqxhr, status, error) {
				alert("에러");
			}
		});
	};
	
	
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
	
	//주소 관련된 function
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = '(' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('workplace_zip').value = data.zonecode; // 우편번호
                mySheet.SetCellValue(t_row,8, data.zonecode);
                
                document.getElementById('workplace_address').value = roadAddr; // 도로명주소
                mySheet.SetCellValue(t_row,9, roadAddr);
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){ // 상세주소
                    document.getElementById('workplace_detail_address').value = extraRoadAddr;
                	mySheet.SetCellValue(t_row,10,extraRoadAddr); // 변경이 있으면 mysheet에 setCellValue를 써서 값 입력
                } else {
                    document.getElementById('workplace_detail_address').value = '';
                    mySheet.SetCellValue(t_row,10,"");
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
            	}
                
                
            }
        }).open();
        
    } // 주소 api function end
    
  //Format 
	   $(document).ready(function () {
	   
	        //사업자등록번호
	         $(function () {    
	                  $('input[name=workplace_com_reg_num]').keydown(function (event) {
	                   var key = event.charCode || event.keyCode || 0;
	                   $text = $(this); 
	                   if (key !== 8 && key !== 9) {
	                       if ($text.val().length === 3) {
	                           $text.val($text.val() + '-');
	                       }
	                       if ($text.val().length === 6) {
	                           $text.val($text.val() + '-');
	                       }
	                   }
	                   return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
	               })
	         });
	        
	         //법인등록번호
	         $(function () {            
	            $('input[name=workplace_corp_reg_num]').keydown(function (event) {
	                 var key = event.charCode || event.keyCode || 0;
	                 $text = $(this); 
	                 if (key !== 8 && key !== 9) {
	                     if ($text.val().length === 6) {
	                         $text.val($text.val() + '-');
	                     }       
	                 }
	                   return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
	               })
	         });

	         //전화번호,팩스
		   $(function () { 
		         $('.phoneNo').keydown(function (event) {
		        var key = event.charCode || event.keyCode || 0;
		        $text = $(this);
		        if (key !== 8 && key !== 9) {
		           if($text.val().substr(0,2)=='02'){
		              if ($text.val().length === 2) {
		                    $text.val($text.val() + '-');
		                }
		                if ($text.val().length === 6) {
		                    $text.val($text.val() + '-');
		                }
		           }else{
		              if ($text.val().length === 3) {
		                    $text.val($text.val() + '-');
		                }
		                if ($text.val().length === 8) {
		                    $text.val($text.val() + '-');
		                }
		           }
		      
		        }
		        return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
		    })
	   }); 
  
	});//document.ready
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
		        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		        ,buttonImage: "${contextPath}/resources/ibsheet/Main/calendar.gif;" //버튼 이미지 경로
		        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
		        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		        ,minDate: "-3Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		        ,maxDate: "+5M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
		    });
		
		    //input을 datepicker로 선언
		    $("#workplace_open_date").datepicker();                    
		    $("#workplace_closed_date").datepicker();

		});
		</script>
	<div id="wrap" style="margin: 0px;">
	<div id="page-wrapper" style="margin: 0px;">
		<div class="row">
	        <div class="col-lg-12">
	            <h1 class="page-header"><i class="fa fa-folder fa-fw"></i> <s:message code="main.enroll2"/></h1>
	        </div>
   	 	</div>
  <div class="frame">
    <%-- //header 및 container 시작--%>
    	<div class="ib_function float_right">
    	  		  <button type="button" class="btn btn-primary" onclick="doAction('reload')">초기화</button>
				  <button type="button" class="btn btn-primary" onclick="doAction('insert')">추가</button>
				  <button class="btn btn-outline btn-primary" onclick="doAction('search')">조회</button>
				  <button class="btn btn-outline btn-primary" onclick="doAction('save')">저장</button>
		</div>
  <div class="container" style="padding:0px; margin-left:0px;">
	<%-- nav (왼쪽 layout)시작 --%>

  <div class="nav">
	  
	  <div class="main_content">
	    <div class="exp_product">
	    </div>
		<!-- ibsheet 뿌려주는 부분  -->
		<div class="clear hidden"></div>
		<div class="ib_product"><script>createIBSheet("mySheet", "68%", "60%");</script></div>

	  </div> <!-- //main_content  -->
  </div> <!-- //nav -->
	  <!-- content (오른쪽 layout시작)  -->
	 <div class="content" >
	 	<div class="page_title" style="height:40px;">
	 		<span class="title" style="font-size:15px; height:15px"><b>기본등록사항</b></span>
		</div>
  <form id="frm">
	  <table width="550px" height="550px">
	  	<tr>
	  		<td align="right">사업자 등록번호 : </td>
	  			<td> <input type="text" name="workplace_com_reg_num" id="workplace_com_reg_num" size="30px" placeholder="_ _ _-_ _-_ _ _ _ _"> </td>
	  	</tr>
	  	<tr>
	  		<td align="right">법인 등록번호 : </td>
	  			<td> <input type="text" name="workplace_corp_reg_num" id="workplace_corp_reg_num" size="30px" placeholder="_ _ _ _ _ _- _ _ _ _ _ _ _"> </td>
	  	</tr>
	  	<tr>
	  		<td align="right">대표자 명 : </td>
	  			<td> <input type="text" name="workplace_rep_name" id="workplace_rep_name" size="25px"> </td>
	  	</tr>
	  	<tr>
	  		<td align="right">사업장 우편번호 : </td>
	  			<td> <input type="text" name="workplace_zip" id="workplace_zip" size="10px" readonly>
	  				 <img src='${contextPath}/resources/image/search_icon.png;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' />
	  			</td>
	  	</tr>
	  	<tr>
	  		<td align="right">사업장 주소 : </td>
	  			<td> <input type="text" name="workplace_address" id="workplace_address" size="50px" readonly> </td>
	  	</tr>
	  	<tr>
	  		<td align="right">사업장 상세주소 : </td>
	  			<td> <input type="text" name="workplace_detail_address" id="workplace_detail_address" size="50px"> </td>
	  	</tr>
	  	<tr>
	  		<td align="right">사업장 전화번호 : </td>
	  			<td> <input class="phoneNo" type="text" name="workplace_tel" id="workplace_tel"> </td>
	  	</tr>
	  	<tr>
	  		<td align="right">사업장 FAX : </td>
	  			<td> <input class="phoneNo" type="text" name="workplace_fax" id="workplace_fax"> </td>
	  	</tr>
	  	<tr>
	  		<td align="right">업태 : </td>
	  			<td> <input type="text" name="workplace_business" id="workplace_business"> </td>
	  	</tr>
	  	<tr>
	  		<td align="right">종목 : </td>
	  			<td> <input type="text" name="workplace_stocks" id="workplace_stocks"> </td>
	  	</tr>
	  	<tr>
	  		<td align="right">개업년월일 : </td>
	  			<td>
	  				<input type="text" name="workplace_open_date" id="workplace_open_date" size="12px" placeholder="_ _ _ _-_ _-_ _">
	  			</td>
	  	</tr>
	  	<tr>
	  		<td align="right">폐업년월일 : </td>
	  			<td>
	  				<input type="text" name="workplace_closed_date" id="workplace_closed_date" size="12px" placeholder="_ _ _ _-_ _-_ _">
	  			</td>
	  	</tr>
	  	<tr><td></td></tr><!-- 공백 -->
	  	<tr>
	  		<td align="right">본점 여부 : </td><td>
	   				<select name="workplace_headoff_whe" id="workplace_headoff_whe">
	  						 <option value='' hidden='1'></option><!-- 공백  -->
	  					<!-- <option value='부' >0. 부</option>
	  						 <option value='여' >1. 여</option>
	  					 -->
	  				</select>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td align="right" hidden='1'>조회조건 : </td>
	  			<td>
	  				<input type="text" name="workplace_inquiry_code" id="workplace_inquiry_code" size="12px" hidden='1'>
	  			</td>
	  	</tr>
	  	

	  </table>
  </form>
  
  </div><!-- //content -->
  </div><!-- //container -->
  </div><!-- //frame -->
  </div><!-- //page-wrapper -->
  </div><!-- //wrap -->
  
      
</body>
</html>