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
<title>인사정보등록-인적 정보</title>

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
		 padding-left:5em; 
		 margin-left:5%;
	}
	
	table{
		width:110%;
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
	var HG=""; // 내국인여부
	var R8=""; // 성별
	var S2=""; // 세대주 구분
	var RQ=""; // 장애인 구분
	var H5=""; // 국가(관리용)
	var HH=""; // 거주자 구분
	
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
			// type : Seq - 대상 db에 sequence 줄 때 사용 
			// 기능을 위해서 전부  hidden 처리 함
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50, Align:"Center"},
			{Header:"No",Type:"Seq",SaveName:"pk_person_info_unique_num",MinWidth:50, Align:"Center"},
			{Header:"사원 코드",Type:"Text",SaveName:"fk_sawon_code",MinWidth:90, Align:"Center"},
			{Header:"사진",Type:"Text",SaveName:"person_info_picture",MinWidth:100, Align:"Center"},
			{Header:"사원 명(영문)",Type:"Text",SaveName:"person_info_eng_name",MinWidth:80, Align:"Center"},
			{Header:"내외국인구분",Type:"Combo",SaveName:"person_info_domes_forei_pop",MinWidth:50, Align:"Center"},
			{Header:"주민등록번호",Type:"Text",SaveName:"person_info_res_reg_num",MinWidth:100, Align:"Center"},
			{Header:"외국인등록번호",Type:"Text",SaveName:"person_info_forei_reg_num",MinWidth:100, Align:"Center"},
			{Header:"성별",Type:"Combo",SaveName:"person_info_gender",MinWidth:50, Align:"Center"},
			{Header:"생년월일",Type:"Text",SaveName:"person_info_date_birth",MinWidth:100, Align:"Center"},			
			{Header:"전화번호",Type:"Text",SaveName:"person_info_tel",MinWidth:80, Align:"Center"},
			{Header:"비상연락망",Type:"Text",SaveName:"person_info_emerg_call",MinWidth:80, Align:"Center"},
			{Header:"최종학력코드",Type:"Text",SaveName:"person_info_final_edu_code",MinWidth:80, Align:"Center"},
			{Header:"최종학력이름",Type:"Text",SaveName:"person_info_final_edu_name",MinWidth:80, Align:"Center"},
			{Header:"우편번호",Type:"Text",SaveName:"person_info_zip",MinWidth:70, Align:"Center"},
			{Header:"주민등록주소",Type:"Text",SaveName:"person_info_resi_reg_address",MinWidth:150, Align:"Center"},
			{Header:"상세주소",Type:"Text",SaveName:"person_info_detail_address",MinWidth:100, Align:"Center"},
			{Header:"영문주소",Type:"Text",SaveName:"person_info_eng_address",MinWidth:150, Align:"Center"},
			{Header:"E-mail",Type:"Text",SaveName:"person_info_email",MinWidth:100, Align:"Center"},
			{Header:"출입카드No.",Type:"Text",SaveName:"person_info_access_card_no",MinWidth:100, Align:"Center"},
			{Header:"세대주여부",Type:"Combo",SaveName:"person_info_head_household",MinWidth:50, Align:"Center"},
			{Header:"장애인구분",Type:"Combo",SaveName:"person_info_dis_classifi",MinWidth:50, Align:"Center"},
			{Header:"국적(관리용)",Type:"Text",SaveName:"person_info_nation_mngement",MinWidth:70, Align:"Center"},
			{Header:"국적(신고용)코드",Type:"Text",SaveName:"person_info_nation_report_cd",MinWidth:70, Align:"Center"},
			{Header:"국적(신고용)명",Type:"Text",SaveName:"person_info_nation_report_nm",MinWidth:70, Align:"Center"},
			{Header:"거주자구분",Type:"Combo",SaveName:"person_info_resident_classifi",MinWidth:60, Align:"Center"},
			{Header:"거주지국코드",Type:"Text",SaveName:"person_info_coun_resi_code",MinWidth:60, Align:"Center"},
			{Header:"거주지국이름",Type:"Text",SaveName:"person_info_coun_resi_name",MinWidth:60, Align:"Center"},
			{Header:"pk_사원코드",Type:"Text",SaveName:"pk_sawon_code",MinWidth:60, Align:"Center"},
			{Header:"사진2",Type:"Text",SaveName:"photo",MinWidth:60, Align:"Center"},
			
			{Header:"입력자",Type:"Text",SaveName:"person_info_int_user_id",MinWidth:80, Align:"Center"},
			{Header:"입력일시",Type:"Text",SaveName:"person_info_int_date",MinWidth:80, Align:"Center"},
			{Header:"수정자",Type:"Text",SaveName:"person_info_mod_user_id",MinWidth:80, Align:"Center"},
			{Header:"수정일시",Type:"Text",SaveName:"person_info_mod_date",MinWidth:80, Align:"Center"},

		];   
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
				
		//doAction('search');

		////콤보박스에 값 불러오기 -> 페이지 로드 시 콤보박스 초기화
 		selectPerson();
		$('#person_info_domes_forei_pop').html("   ");
		$('#person_info_gender').html("   ");
		$('#person_info_head_household').html("   ");
		$('#person_info_dis_classifi').html("   ");
		$('#person_info_nation_mngement').html("   ");
		$('#person_info_resident_classifi').html("   "); 
		//var param = FormQueryStringEnc(document.frm);
		//mySheet.DoSearch("${contextPath}/system/p0002/searchList2.do",param); // 회사등록 페이지로 가면 자동으로 searchList.do 실행 
	
		//ibSheet 에서 col 지정해서 숨김
		/* mySheet.SetColHidden([//0~33번째 까지...실상 전 ibSheet 숨김
	      {Col: 0, Hidden:1}, {Col: 1, Hidden:1}, {Col: 2, Hidden:1}, {Col: 3, Hidden:1}, {Col: 4, Hidden:1}, {Col: 5, Hidden:1}, {Col: 6, Hidden:1}, 
	      {Col: 7, Hidden:1}, {Col: 8, Hidden:1}, {Col: 9, Hidden:1}, {Col: 10, Hidden:1}, {Col: 11, Hidden:1}, {Col: 12, Hidden:1}, {Col: 13, Hidden:1}, 
	      {Col: 14, Hidden:1}, {Col: 15, Hidden:1}, {Col: 16, Hidden:1}, {Col: 17, Hidden:1}, {Col: 18, Hidden:1}, {Col: 19, Hidden:1}, {Col: 20, Hidden:1}, 
	      {Col: 21, Hidden:1}, {Col: 22, Hidden:1}, {Col: 23, Hidden:1}, {Col: 24, Hidden:1}, {Col: 25, Hidden:1}, {Col: 26, Hidden:1}, {Col: 27, Hidden:1}, 
	      {Col: 28, Hidden:1}, {Col: 29, Hidden:1}, {Col: 30, Hidden:1}, {Col: 31, Hidden:1}, {Col: 32, Hidden:1}, {Col: 33, Hidden:1}, {Col: 34, Hidden:1},
	    ]);  */

	 // select박스 수정 시 실행되야 되는 함수들 
		  // select 태그에 person_info_domes_forei_pop인 값의 변경이 있을때 실행
		  $("#person_info_domes_forei_pop").change(function(e){ 
			  var colArr =  Object.keys(mySheet.SaveNameInfo);
			  var colNum = colArr.indexOf(e.target.id);	
			  t_row = 1; 
			  var forei = document.getElementById("person_info_domes_forei_pop");
			  var selectBox = forei.options[forei.selectedIndex].value;
			    console.log(selectBox); 
				mySheet.SetCellValue(t_row, colNum, e.target.value);
			})
			
		  // select 태그에 person_info_gender인 값의 변경이 있을때 실행
		  $("#person_info_gender").change(function(e){ 
			    var colArr =  Object.keys(mySheet.SaveNameInfo);
				var colNum = colArr.indexOf(e.target.id);	
				t_row = 1; 
			 /* var gender = document.getElementById("person_info_gender");
				var selectBox = gender.options[gender.selectedIndex].value;
				//console.log(selectBox); */
				  
				mySheet.SetCellValue(t_row, colNum, e.target.value);
			})
			
		  // select 태그에 person_info_head_household인 값의 변경이 있을때 실행
		  $("#person_info_head_household").change(function(e){ 
			    var colArr =  Object.keys(mySheet.SaveNameInfo);
				var colNum = colArr.indexOf(e.target.id);	
				t_row = 1; 
			 /* var household = document.getElementById("person_info_head_household");
				var selectBox = household.options[household.selectedIndex].value;
				//console.log(selectBox); */
				  
				mySheet.SetCellValue(t_row, colNum, e.target.value);
			})
			
		  // select 태그에 person_info_dis_classifi인 값의 변경이 있을때 실행
		  $("#person_info_dis_classifi").change(function(e){ 
			    var colArr =  Object.keys(mySheet.SaveNameInfo);
				var colNum = colArr.indexOf(e.target.id);	
				t_row = 1; 
			 /* var classifi = document.getElementById("person_info_dis_classifi");
				var selectBox = classifi.options[classifi.selectedIndex].value;
				//console.log(selectBox); */
				  
				mySheet.SetCellValue(t_row, colNum, e.target.value);
			})
			
		  // select 태그에 person_info_nation_mngement인 값의 변경이 있을때 실행
		  $("#person_info_nation_mngement").change(function(e){ 
			    var colArr =  Object.keys(mySheet.SaveNameInfo);
				var colNum = colArr.indexOf(e.target.id);	
				t_row = 1; 
			 /* var nation = document.getElementById("person_info_nation_mngement");
				var selectBox = nation.options[nation.selectedIndex].value;
				//console.log(selectBox); */
				  
				mySheet.SetCellValue(t_row, colNum, e.target.value);
			})
			
		  // select 태그에 person_info_resident_classifi인 값의 변경이 있을때 실행
		  $("#person_info_resident_classifi").change(function(e){ 
			    var colArr =  Object.keys(mySheet.SaveNameInfo);
				var colNum = colArr.indexOf(e.target.id);	
				t_row = 1; 
			 /* var resident = document.getElementById("person_info_resident_classifi");
				var selectBox = resident.options[resident.selectedIndex].value;
				//console.log(selectBox); */
				  
				mySheet.SetCellValue(t_row, colNum, e.target.value);
			})
			
		 // select박스 수정 시 실행되야 되는 함수들 끝
	}
	
	 function rowCheck(code){//메인화면에서 클릭한 row부분에 대한 사원코드 값 받아옴
			$('#sawon_code').val(code);
	 
			console.log($('#sawon_code'));
			doAction('search');
			//$("#person_info_gender").val("여성").attr("selected","selected");
	 }
	 
	 $(document).on('change', 'input', function(e) { // 수정할시에 state에 문구 저장 및 SetCellValue 실행
		  var colArr = Object.keys(mySheet.SaveNameInfo);
		  var colNum = colArr.indexOf(e.target.id);
   		  mySheet.SetCellValue(t_row, colNum ,e.target.value);
	 	
	 });
	 
	 // 공통_팝업에서  onClick 이벤트 후 값 입력
	 function fn_selectCode(code_num, code_name, code_id, code_nameId) {
			console.log("info:"+code_num);//코드
			console.log("info:"+code_name);//코드명
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
			
				var param = FormQueryStringEnc(document.frm);
				//alert("param : "+param);
				
				mySheet.DoSearch("${contextPath}/system/p0002/searchList2.do", param);
								
				//콤보박스에 값 불러오기 -> 행 추가(입력) 및 append 중복 추가 방지
				selectPerson();
				$('#person_info_domes_forei_pop').html("   ");
				$('#person_info_gender').html("   ");
				$('#person_info_head_household').html("   ");
				$('#person_info_dis_classifi').html("   ");
				$('#person_info_nation_mngement').html("   ");
				$('#person_info_resident_classifi').html("   ");
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
				//현재는 테스트 하는 겸 해서 놔두지만 나중에는 주석 처리 해야됨 
				//save 를 하면서 중복 처리 됨 
				var tempStr = mySheet.GetSaveString();
				tempStr += alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet.DoSave("${contextPath}/system/p0002/insertData2.do"); 
				break;
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();
			
				//콤보박스에 값 불러오기 -> 행 추가(입력) 및 append 중복 추가 방지
				selectPerson();
				$('#person_info_domes_forei_pop').html("   ");
				$('#person_info_gender').html("   ");
				$('#person_info_head_household').html("   ");
				$('#person_info_dis_classifi').html("   ");
				$('#person_info_nation_mngement').html("   ");
				$('#person_info_resident_classifi').html("   ");

				break;
		}
	}
	
	function selectPerson() { // 인사코드조회
		
		var person1 =""; // 내 외국인구분 
		var person2 =""; // 성별
		var person3 =""; // 세대주 여부
		var person4 =""; // 장애인 구분
		var person5 =""; // 국가(관리용)
		var person6 =""; // 거주자 구분
		
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
						case 'HG': // 내국인 여부 -> input box
							person1 = person1+info1; // 그리드에 저장
							$('#person_info_domes_forei_pop').append(MNGEMENT_NAME);//input box에 저장
							//console.log(person1);
							break;
						case 'R8': // 성별 -> input box
							person2 = person2+info1; // 그리드에 저장
							$('#person_info_gender').append(MNGEMENT_NAME);//input box에 저장
							//console.log(person2);
							break;
						case 'S2': // 세대주 구분 -> input box
							person3 = person3+info1; // 그리드에 저장
							$('#person_info_head_household').append(MNGEMENT_NAME);//input box에 저장
							//console.log(person3);
							break;
						case 'RQ': // 장애인 구분 -> input box
							person4 = person4+info1; // 그리드에 저장
							$('#person_info_dis_classifi').append(MNGEMENT_NAME);//input box에 저장
							//console.log(person4);
							break;
						case 'H5': // 국가(관리용) -> input box
							person5 = person5+info1; // 그리드에 저장
							$('#person_info_nation_mngement').append(MNGEMENT_NAME);//input box에 저장
							//console.log(person5);
							break;
						case 'HH': // 거주자 구분 -> input box
							person6 = person6+info1; // 그리드에 저장
							$('#person_info_resident_classifi').append(MNGEMENT_NAME);//input box에 저장
							//console.log(person6);
							break;
					}
					
				}
				this.Action();
			},
			Action: function(){	 // combo를 넣는 곳
				HG = {'ComboCode':person1,'ComboText':person1}; // 내국인 여부
				R8 = {'ComboCode':person2,'ComboText':person2}; // 성별
				S2 = {'ComboCode':person3,'ComboText':person3}; // 세대주 구분
				RQ = {'ComboCode':person4,'ComboText':person4}; // 장애인 구분
				H5 = {'ComboCode':person5,'ComboText':person5}; // 국가(관리용)
				HH = {'ComboCode':person6,'ComboText':person6}; // 거주자 구분
								
				for(var i = 1; i<=mySheet.RowCount(); i++){ // 조회할때 갯수 세어서 거기에 전부 넣기위해서 for문 돌립니다.
					console.log(i);
					mySheet.CellComboItem(i,6,HG); // 내국인여부 ( 내국인 , 외국인 )
					mySheet.CellComboItem(i,9,R8); // 성별 ( 남성 , 여성 )
					mySheet.CellComboItem(i,21,S2); // 세대주 구분 ( 부 , 여 )
					mySheet.CellComboItem(i,22,RQ); // 장애인 구분 ( 비해당 , 장애인복지법 , 국가유공자등 , 중증환자 )
					mySheet.CellComboItem(i,23,H5); // 국가(관리용) ( 대한민국 , 미국 , 중국 , 일본 )
					mySheet.CellComboItem(i,26,HH); // 거주자 구분 ( 거주자 , 비 거주자)
					
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
			 /*  $.each(colArr,function(k,v){ // .each - 배열을 반복문으로 돌림 key 와 value 값을 가진다. 
				  	$("#"+v).val(mySheet.GetCellValue(1,k)); // ibsheet의 GetCellValue 메서드를 사용해 row 의 key value 를 가져옴 
			  }) */
 			  $('#person_info_picture').val(mySheet.GetCellValue(1,4));
			  $('#person_info_eng_name').val(mySheet.GetCellValue(1,5));
			  $('#person_info_domes_forei_pop').val(mySheet.GetCellValue(1,6)).attr("selected","selected");
			  $('#person_info_res_reg_num').val(mySheet.GetCellValue(1,7));
			  $('#person_info_forei_reg_num').val(mySheet.GetCellValue(1,8));
			  $("#person_info_gender").val(mySheet.GetCellValue(1,9)).attr("selected","selected");
			  $('#person_info_date_birth').val(mySheet.GetCellValue(1,10));
			  $('#person_info_tel').val(mySheet.GetCellValue(1,11));
			  $('#person_info_emerg_call').val(mySheet.GetCellValue(1,12));
			  $('#person_info_final_edu_code').val(mySheet.GetCellValue(1,13));
			  $('#person_info_final_edu_name').val(mySheet.GetCellValue(1,14));
			  $('#person_info_zip').val(mySheet.GetCellValue(1,15));
			  $('#person_info_resi_reg_address').val(mySheet.GetCellValue(1,16));
			  $('#person_info_detail_address').val(mySheet.GetCellValue(1,17));
			  $('#person_info_eng_address').val(mySheet.GetCellValue(1,18));
			  $('#person_info_email').val(mySheet.GetCellValue(1,19));
			  $('#person_info_access_card_no').val(mySheet.GetCellValue(1,20));
			  $('#person_info_head_household').val(mySheet.GetCellValue(1,21)).attr("selected","selected");
			  $('#person_info_dis_classifi').val(mySheet.GetCellValue(1,22)).attr("selected","selected");
			  $('#person_info_nation_mngement').val(mySheet.GetCellValue(1,23)).attr("selected","selected");
			  $('#person_info_nation_report_cd').val(mySheet.GetCellValue(1,24));
			  $('#person_info_nation_report_nm').val(mySheet.GetCellValue(1,25));
			  $('#person_info_resident_classifi').val(mySheet.GetCellValue(1,26)).attr("selected","selected");
			  $('#person_info_coun_resi_code').val(mySheet.GetCellValue(1,27));
			  $('#person_info_coun_resi_name').val(mySheet.GetCellValue(1,28));
			  $('#pk_sawon_code').val(mySheet.GetCellValue(1,29));
			  $('#person_info_int_user_id').val(mySheet.GetCellValue(1,30));
			  $('#person_info_int_date').val(mySheet.GetCellValue(1,31));
			  $('#person_info_mod_user_id').val(mySheet.GetCellValue(1,32));
			  $('#person_info_mod_date').val(mySheet.GetCellValue(1,33));
			  photoCheck(mySheet.GetCellValue(1, 'photo'));
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
                document.getElementById('person_info_zip').value = data.zonecode; // 우편번호
                mySheet.SetCellValue(t_row,15, data.zonecode);
                
                document.getElementById('person_info_resi_reg_address').value = roadAddr; // 도로명주소
                mySheet.SetCellValue(t_row,16, roadAddr);
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){ // 상세주소
                    document.getElementById('person_info_detail_address').value = extraRoadAddr;
                	mySheet.SetCellValue(t_row,17,extraRoadAddr); // 변경이 있으면 mysheet에 setCellValue를 써서 값 입력
                } else {
                    document.getElementById('person_info_detail_address').value = '';
                    mySheet.SetCellValue(t_row,17,"");
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
    
    // 이미지 업로드
//	    <!-- 미리 보기 불러오는 곳 바뀔때마다 바뀜-->
    $(function(){
        $("#photofile").change(function(){
        	console.log($('#pk_sawon_code').val);
        	readImage(this);
        });
    });

//	    <!-- 미리 보기 불러오는 function -->
    function readImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                //$('#previewImg').attr('src', e.target.result);
            	photoCheck(e.target.result); // (사진에 값 넣기)
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    function fn_formSubmit(){ // 저장 및 업데이트
    	t_row=1;
    	alert("1.")
    	var form = $("#form1")[0];
    	var formData = new FormData(form);
    	if(document.getElementById('photofile').value != ''){
    		$.ajax({
	    		cache : false,
	    		url: "${contextPath}/system/p0002/imageSave",
	            processData: false,
	            contentType: false,
		        type:"POST", 
		        data: formData,
				success: function(result){
					mySheet.SetCellValue(t_row, 'photo', result);
					document.getElementById('photofile').value = '';
					var Status = mySheet.GetCellValue(t_row, 'STATUS');
					
					if(Status == "U"){
						mySheet.SetCellValue(t_row, "STATUS", "R");
					}
				},error:function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    },complete : function(data) {
			    	//  실패했어도 완료가 되었을 때 처리
				}
		    })
    	}
    } 
    
    //첨부파일 용량 제한 & 확장자 제한
    function checkSize(input) {
    	
    	var fileDir = input.value;
    	
        if (input.files && input.files[0].size > (1024 * 1024)) {
            alert("파일 사이즈가 1MB 를 넘습니다.");
            input.value = null;
            //$('#previewImg').attr('src', null);
            photoCheck(null); // (사진 초기화)
        } else if(fileDir.substring(fileDir.lastIndexOf(".")+1,fileDir.length).search("png") == -1){
       		alert("지정된 확장자의 파일만 업로드 가능합니다!");
       	  	input.value = null;
       	 	//$('#previewImg').attr('src', null);
    		photoCheck(null); // (사진 초기화)
        }
    }
  
  	//이미지 불러오기 및 다운로드 
    function mySheet_OnSelectCell(oldrow, oldcol, row, col) {
    	t_row=1;
    	photoCheck(mySheet.GetCellValue(t_row, 'photo'));
	}
  	
  	function photoCheck(imageName){
  		var image = "";
  		if(imageName != '' && imageName != '-1'){ // imageName 값이  null 이나 -1 이 아닐 때  
    		image = "/SEED/fileDownload?downname=" + imageName;
    	}else{// imageName 값이 없거나 그 외의 경우 
    		image = "${contextPath}/resources/image/noprofile_pic_icon.jpg";
    	}
  		$("#previewImg").attr("src", image); // previewImg 에 값 넣음
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
		        ,yearRange: "-120:+1" // 콤보박스에서 100년 전 부터 현재 년도 까지 표시되게 만듬
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
		    $("#person_info_date_birth").datepicker();                    

		});
	</script>

  <div class="frame">
    <%-- //header 및 container 시작--%>

  <div class="container" style="padding:0px; margin-left:0px;">
	<%-- nav (왼쪽 layout)시작 --%>

  <div class="nav">
	  
	  <div class="main_content">
	  		<div class="ib_function float_right">
			  
			</div>
	    <div class="exp_product">
	    </div>
		
		<!-- ibsheet 뿌려주는 부분  -->
		<div class="hidden">
				<div class="ib_product"><script>createIBSheet("mySheet", "50%", "50%");</script></div>	
		</div>
		<form name='frm'>
			<!-- 사원코드 값 가져오기 -->
			<input type='text' id="sawon_code" name="sawon_code" hidden="1" />		
		</form>
		<!-- 개인 정보 -->
		<div style="border:1px solid lightblue;">
			<table>
				<tr>
					<td rowspan="9" width="45px">
						<div style="writing-mode: tb-rl; width:40px; height:301px; border:1px solid lightblue; padding-right:10px;">
							<img src='${contextPath}/resources/ibsheet/Main/d_right2.gif' style="margin-top:5px; margin-left:-5px; width:15px; height:15px;" />
							개인 정보
						</div>
					</td>
					<td rowspan="9" align="center" style="border:1px solid lightblue; width:220px;" >
						&emsp; &emsp; &emsp; &emsp;
						<input type="button" class="btn btn-outline btn-primary" value="주의사항" onClick="alert('이미지 권장 크기는 가로(35px)*세로(35px)입니다.\n확장자는 이미지 파일(.png)만 업로드 가능합니다.\n용량은 1MB를 초과 할 수 없습니다.\n현재 페이지에서는 저장 및 수정만 가능합니다.')">
						<a href="javascript:fn_formSubmit();" class="btn btn-outline btn-primary">저장</a>
						<br><br>
						<form id="form1" name="form1" role="form" action="imageSave" method="post" enctype="multipart/form-data" >
								<div>
									<!--이미지 미리보기 되는 곳 -->
									<div>
										<img id="previewImg" src="${contextPath}/resources/image/noprofile_pic_icon.jpg" style="width:100px; height: 120px; max-width: 100px;" align="center"><br>
										<br>
										<input type="file" name="photofile" id="photofile" accept='image/*' onchange="checkSize(this)" style="width:200px;"/>
										<input type="hidden" name="pk_sawon_code" id="pk_sawon_code" />
									</div>
								</div>
							</form>
						
					</td>
					<td align="right" style="width:105px;">성명 (영문) : </td>
	    			<td style="width:270px;">
	    				<input type="text" name="person_info_eng_name" id="person_info_eng_name" size="33px">
	    			</td>
	    			<td align="left"> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp;
	    				<button class="btn btn-outline btn-primary" onclick="doAction('save')">저장</button>
	    			</td>
				</tr>
				<tr>
				  	<td align="right">내 외국인구분 : </td>
	    			<td>
	    				<select name="person_info_domes_forei_pop" id="person_info_domes_forei_pop">
	    					<option value='' hidden='1'></option><!-- 공백  -->
	    					<!-- <option value='1.내국인'>1.내국인</option>  -->
	    				</select>
	    			</td>
				</tr>
				<tr>
				  	<td align="right">주민 등록번호 : </td>
	    			<td>
	    				<input type="text" name="person_info_res_reg_num" id="person_info_res_reg_num" size="33px" placeholder="_ _ _ _ _ _-_ _ _ _ _ _ _">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">외국인 등록번호 : </td>
	    			<td>
	    				<input type="text" name="person_info_forei_reg_num" id="person_info_forei_reg_num" size="33px" placeholder="_ _ _ _ _ _-_ _ _ _ _ _ _">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">성별 : </td>
	    			<td>
	    				<select name="person_info_gender" id="person_info_gender">
	    					<option value='' hidden='1'></option><!-- 공백  -->
	    					<!-- <option value='1.남성'>1.남성</option>  -->
	    				</select>
	    			</td>
				</tr>
				<tr>
				  	<td align="right">생년월일 : </td>
	    			<td>
	    				<input type="text" name="person_info_date_birth" id="person_info_date_birth" size="12px" placeholder="_ _ _ _-_ _-_ _">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">전화번호 : </td>
	    			<td colspan="2">
	    				<input class="phoneNo" type="text" name="person_info_tel" id="person_info_tel" size="33px">
	    			</td>
				<tr>
				  	<td align="right">비상 연락(HP) : </td>
	    			<td>
	    				<input class="phoneNo" type="text" name="person_info_emerg_call" id="person_info_emerg_call" size="33px">
	    			</td>
				</tr>
				<tr>
				  	<td align="right">최종학력 : </td>
	    			<td>
	    				<input type="text" name="person_info_final_edu_code" id="person_info_final_edu_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("HB","person_info_final_edu_code", "person_info_final_edu_name", "#myTabs_contents-0-iframe");' style='cursor:pointer;' />
	    				<input type="text" name="person_info_final_edu_name" id="person_info_final_edu_name" size="18px" class="disabled">
	    			</td>
				</tr>
			</table>
		</div><div style="height:5px;"></div><!-- //개인 정보 -->
		
		<!-- 거주 정보 -->
		<div style="border:1px solid lightblue">
			<table>
				<tr>
					<td rowspan="10">
						<div style="writing-mode: tb-rl; width:40px; height:301px; border:1px solid lightblue; padding-right:10px;">
							<img src='${contextPath}/resources/ibsheet/Main/d_right2.gif' style="margin-top:5px; margin-left:-5px; width:15px; height:15px;"/>
							거주 정보
						</div>
					</td>
					<td></td>
					<td align="right" style="width:90px;">주민 등록주소 : </td>
		  			<td> <input type="text" name="person_info_zip" id="person_info_zip" size="10px" readonly>
		  				 <img src='${contextPath}/resources/image/search_icon.png;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' />
		  				 <input type="text" name="person_info_resi_reg_address" id="person_info_resi_reg_address" size="45px" readonly>
		  			</td>
				</tr>
				<tr>
					<td style="width:28px;"></td>
				   	<td align="right">상세 주소 : </td>
		  			<td> <input type="text" name="person_info_detail_address" id="person_info_detail_address" size="60px"> </td>
				</tr>
				<tr>
					<td></td>
				   	<td align="right">영문 주소 : </td>
		  			<td> <input type="text" name="person_info_eng_address" id="person_info_eng_address" size="60px"> </td>
				</tr>
				<tr>
					<td></td>
				   	<td align="right">E-MAIL : </td>
		  			<td> <input type="text" name="person_info_email" id="person_info_email" size="60px"> </td>
				</tr>
				<tr>
					<td></td>
				   	<td align="right">출입카드 No. : </td>
		  			<td> <input type="text" name="person_info_access_card_no" id="person_info_access_card_no" size="60px"> </td>
				</tr>
				<tr>
					<td></td>
				   	<td align="right">세대주 여부 : </td>
	    			<td>
	    				<select name="person_info_head_household" id="person_info_head_household">
	    					<option value='' hidden='1'></option><!-- 공백  -->
	    					<!-- <option value='1. 부'>1.부</option>  -->
	    				</select>
	    				<!-- 공백 -->
	    				&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
	    				&emsp; &emsp; &emsp; &nbsp;
	    				장애인 구분 : 
	    				<select name="person_info_dis_classifi" id="person_info_dis_classifi">
	    					<option value='' hidden='1'></option><!-- 공백  -->
	    					<!-- <option value='0.비해당'>0.비해당</option>
	    						<option value='1.장애인 복지법'>1.장애인 복지법</option>
	    					 -->
	    				</select>
	    			</td>
				</tr>
				<tr>
					<td></td>
				   	<td align="right">국적 (관리용) : </td>
		  			<td> 
						<select name="person_info_nation_mngement" id="person_info_nation_mngement">
	    					<option value='' hidden='1'></option><!-- 공백  -->
	    					<!-- <option value='1. 대한민국'>1.대한민국</option>  -->
	    				</select>
	    			</td>
				</tr>
				<tr>
					<td></td>
				   	<td align="right">국적 (신고용) : </td>
		  			<td> 
		  				<input type="text" name="person_info_nation_report_cd" id="person_info_nation_report_cd" size="10px">
		  				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("RR","person_info_nation_report_cd", "person_info_nation_report_nm", "#myTabs_contents-0-iframe");' style='cursor:pointer;' /> 
		  				<input type="text" name="person_info_nation_report_nm" id="person_info_nation_report_nm" size="45px" class="disabled">
		  			</td>
				</tr>
				<tr>
					<td></td>
				   	<td align="right">거주자 구분 : </td>
		  			<td>
	    				<select name="person_info_resident_classifi" id="person_info_resident_classifi">
	    					<option value='' hidden='1'></option><!-- 공백  -->
	    					<!-- <option value='1.거주자'>1.거주자</option>  -->
	    				</select>
	    			</td>
				</tr>
				<tr>
					<td></td>
				   	<td align="right">거주지국 코드 : </td>
		  			<td> 
		  				<input type="text" name="person_info_coun_resi_code" id="person_info_coun_resi_code" size="10px">
		  				<img src='${contextPath}/resources/image/search_icon.png;' onclick='window.parent.fn_Popup("RR","person_info_coun_resi_code", "person_info_coun_resi_name", "#myTabs_contents-0-iframe");' style='cursor:pointer;' /> 
		  				<input type="text" name="person_info_coun_resi_name" id="person_info_coun_resi_name" size="45px" class="disabled">
		  			</td>
				</tr>
			</table>
		</div><!-- //거주 정보 -->

	  </div> <!-- //nav  -->
	  </div> <!-- //onClick -->

  </div><!-- //container -->
  </div><!-- //frame -->   
</body>
</html>