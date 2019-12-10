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
<title>인사정보등록-급여 정보</title>

<style>
	.frame {
		  width : 800px;
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
		  width: 800px;
		  height: 650px;
		  border : 1px solid lightblue;
	}
	
	.tab{
		width:500px;
	}
	.main_content{
		width: 800px;
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
	var S1=""; // 배우자공제, 부녀자공제
 
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
			{Header:"No",Type:"Seq",SaveName:"pk_sal_info_unique_num",MinWidth:100, Align:"Center"},
			{Header:"사원 코드",Type:"Text",SaveName:"fk_sawon_code",MinWidth:60, Align:"Center"},			
			{Header:"호봉 코드",Type:"Text",SaveName:"fk_hobong_code",MinWidth:150, Align:"Center"},
			{Header:"계정유형코드",Type:"Text",SaveName:"sal_info_acc_type_code",MinWidth:150, Align:"Center"},
			{Header:"계정유형명",Type:"Text",SaveName:"sal_info_acc_type_name",MinWidth:100, Align:"Center"},
			{Header:"급여 이체은행코드1",Type:"Text",SaveName:"sal_info_trans_amount_o_code",MinWidth:150, Align:"Center"},
			{Header:"급여 이체은행1",Type:"Text",SaveName:"sal_info_trans_amount_o",MinWidth:150, Align:"Center"},
			{Header:"계좌 번호1",Type:"Text",SaveName:"sal_info_acc_num_one",MinWidth:60, Align:"Center"},			
			{Header:"예금주1",Type:"Text",SaveName:"sal_info_acc_hold_one",MinWidth:60, Align:"Center"},
			{Header:"급여 이체은행코드2",Type:"Text",SaveName:"sal_info_trans_amount_t_code",MinWidth:60, Align:"Center"},
			{Header:"급여 이체은행2",Type:"Text",SaveName:"sal_info_trans_amount_t",MinWidth:100, Align:"Center"},			
			{Header:"계좌 번호2",Type:"Text",SaveName:"sal_info_acc_num_two",MinWidth:150, Align:"Center"},
			{Header:"예금주2",Type:"Text",SaveName:"sal_info_acc_hold_two",MinWidth:150, Align:"Center"},
			{Header:"배우자 공제",Type:"Text",SaveName:"sal_info_spouse_ded",MinWidth:150, Align:"Center"},
			{Header:"부녀자 공제",Type:"Text",SaveName:"sal_info_deduction",MinWidth:60, Align:"Center"},
			{Header:"20세이하",Type:"Text",SaveName:"sal_info_under_age_twen",MinWidth:100, Align:"Center"},
			{Header:"부양 60세 이상",Type:"Text",SaveName:"sal_info_depend_60years_older",MinWidth:60, Align:"Center"},
			{Header:"장애인",Type:"Text",SaveName:"sal_info_disabled_person",MinWidth:150, Align:"Center"},
			{Header:"수급자/위탁아동",Type:"Text",SaveName:"sal_info_reci_foster_child",MinWidth:60, Align:"Center"},
			{Header:"다자녀 추가공제",Type:"Text",SaveName:"sal_info_multi_child_ded",MinWidth:150, Align:"Center"},
			{Header:"pk_사원코드",Type:"Text",SaveName:"pk_sawon_code",MinWidth:60, Align:"Center"},
			
			{Header:"입력자",Type:"Text",SaveName:"sal_info_int_user_id",MinWidth:80, Align:"Center"},
			{Header:"입력일시",Type:"Text",SaveName:"sal_info_int_date",MinWidth:80, Align:"Center"},
			{Header:"수정자",Type:"Text",SaveName:"sal_info_mod_user_id",MinWidth:80, Align:"Center"},
			{Header:"수정일시",Type:"Text",SaveName:"sal_info_mod_date",MinWidth:80, Align:"Center"},

		];   
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
		
		mySheet.DoSearch("${contextPath}/system/p0002/searchList4.do"); // 회사등록 페이지로 가면 자동으로 searchList.do 실행 
	
		//콤보박스에 값 불러오기 -> searchList.do 뒤에 실행 
		selectSal();
		
		//ibSheet 에서 col 지정해서 숨김
		mySheet.SetColHidden([//0~26번째 까지...실상 전 ibSheet 숨김
	      {Col: 0, Hidden:1}, {Col: 1, Hidden:1}, {Col: 2, Hidden:1}, {Col: 3, Hidden:1}, {Col: 4, Hidden:1}, {Col: 5, Hidden:1}, {Col: 6, Hidden:1}, 
	      {Col: 7, Hidden:1}, {Col: 8, Hidden:1}, {Col: 9, Hidden:1}, {Col: 10, Hidden:1}, {Col: 11, Hidden:1}, {Col: 12, Hidden:1}, {Col: 13, Hidden:1}, 
	      {Col: 14, Hidden:1}, {Col: 15, Hidden:1}, {Col: 16, Hidden:1}, {Col: 17, Hidden:1}, {Col: 18, Hidden:1}, {Col: 19, Hidden:1}, {Col: 20, Hidden:1}, 
	      {Col: 21, Hidden:1}, {Col: 22, Hidden:1}, {Col: 23, Hidden:1}, {Col: 24, Hidden:1}, {Col: 25, Hidden:1}, {Col: 26, Hidden:1},  
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
	
		  // onClick 이벤트 중 select 태그에 sal_info_spouse_ded인 값의 변경이 있을때 실행
		  $("#sal_info_spouse_ded").change(function(e){ 
				var colNum = colArr.indexOf(e.target.id);	
				 
			 /* var spouse = document.getElementById("sal_info_spouse_ded");
				var selectBox = spouse.options[spouse.selectedIndex].value;
				//console.log(selectBox); */
				  
				mySheet.SetCellValue(t_row, colNum, e.target.value);
			})
	
		  // onClick 이벤트 중 select 태그에 sal_info_deduction인 값의 변경이 있을때 실행
		  $("#sal_info_deduction").change(function(e){ 
				var colNum = colArr.indexOf(e.target.id);	
				 
		     /* var deduction = document.getElementById("sal_info_deduction");
				var selectBox = deduction.options[deduction.selectedIndex].value;
				//console.log(selectBox); */
				  
				mySheet.SetCellValue(t_row, colNum, e.target.value);
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
				
				mySheet.DoSearch("${contextPath}/system/p0002/searchList4.do");
			
				//콤보박스에 값 불러오기 -> 행 추가(입력) 및 append 중복 추가 방지
				selectSal();
				$('#sal_info_spouse_ded').html("   ");
				$('#sal_info_deduction').html("   ");
				
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
				//현재는 테스트 하는 겸 해서 놔두지만 나중에는 주석 처리 해야됨 
				//save 를 하면서 중복 처리 됨 
				var tempStr = mySheet.GetSaveString();
				tempStr += alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet.DoSave("${contextPath}/system/p0002/insertData4.do");
				break;
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();	
			
				//콤보박스에 값 불러오기 -> 행 추가(입력) 및 append 중복 추가 방지
				selectSal();
				$('#sal_info_spouse_ded').html("   ");
				$('#sal_info_deduction').html("   ");
				
				break;
		}
	}
	
	function selectSal() { // 인사코드조회
		
		var sal1 =""; // 배우자 공제 
		var sal2 =""; // 부녀자 공제

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
						case 'S1': // 배우자 공제, 부녀자 공제 -> input box
							sal1 = sal1+info1; // 그리드에 저장
							sal2 = sal2+info1; // 그리드에 저장
							
							$('#sal_info_spouse_ded').append(MNGEMENT_NAME);//input box에 저장
							
							$('#sal_info_deduction').append(MNGEMENT_NAME);//input box에 저장
							
							//console.log(sal1);
							//console.log(sal2);
							break;
					}
					
				}
				this.Action();
			},
			Action: function(){	 // combo를 넣는 곳

				S1 = {'ComboCode':sal1,'ComboText':sal1}; // 배우자 공제
				S1 = {'ComboCode':sal2,'ComboText':sal2}; // 부녀자 공제

				
				for(var i = 1; i<=mySheet.RowCount(); i++){ // 조회할때 갯수 세어서 거기에 전부 넣기위해서 for문 돌립니다.
					//console.log(i);
					mySheet.CellComboItem(i,15,S1); // 배우자 공제 ( 비해당 , 해당 )
					mySheet.CellComboItem(i,16,S1); // 부녀자 공제 ( 비해당 , 해당 )

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
	
</script>
</head>
<body onload="LoadPage()">

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
		
			<div class="ib_function float_light">
				  <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
				  <a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
			</div>
		
			<div class="ib_product"><script>createIBSheet("mySheet", "80%", "80%");</script></div>
		</div>
		<form id="frm3">
		
			<div style="border:1px solid lightblue">
			<!-- 급여 항목 -->
			<table>
				<tr>
					<td rowspan="6">
						<div style="writing-mode: tb-rl; width:40px; height:201px; border:1px solid lightblue; padding-right:10px;">
							<img src='${contextPath}/resources/ibsheet/Main/d_right2.gif' style="margin-top:5px; margin-left:-5px; width:15px; height:15px;" />
							급여 항목
						</div>
					</td>
				  	<td align="right" style="width:130px;">호 봉 : </td>
	    			<td>
	    				<input type="text" name="fk_hobong_code" id="fk_hobong_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' />
	    			</td>
				</tr>
				<tr>
				  	<td align="right">계정 유형 : </td>
	    			<td>
	    				<input type="text" name="sal_info_acc_type_code" id="sal_info_acc_type_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' />
	    				<input type="text" name="sal_info_acc_type_name" id="sal_info_acc_type_name" size="45px" disabled>
	    			</td>
				</tr>
				<tr>
				  	<td align="right">급여 이체 은행 1: </td>
	    			<td>
	    				<input type="text" name="sal_info_trans_amount_o_code" id="sal_info_trans_amount_o_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' />
	    				<input type="text" name="sal_info_trans_amount_o" id="sal_info_trans_amount_o" size="45px" disabled>
	    			</td>
				</tr>
				<tr>
				  	<td align="right">계좌 번호 1 : </td>
	    			<td>
	    				<input type="text" name="sal_info_acc_num_one" id="sal_info_acc_num_one" size="15px">
	    			
	    			<!-- 공백 -->
    				&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp;
	    			
				  	예금주 1: 
	    				<input type="text" name="sal_info_acc_hold_one" id="sal_info_acc_hold_one" size="15px">
	    			</td>
				</tr>
				<tr>
					<td align="right">급여 이체 은행 2: </td>
	    			<td>
	    				<input type="text" name="sal_info_trans_amount_t_code" id="sal_info_trans_amount_t_code" size="10px">
	    				<img src='${contextPath}/resources/image/search_icon.png;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' />
	    				<input type="text" name="sal_info_trans_amount_t" id="sal_info_trans_amount_t" size="45px" disabled>
	    			</td>
				</tr>
				<tr>
					<td align="right">계좌 번호 2 : </td>
	    			<td>
	    				<input type="text" name="sal_info_acc_num_two" id="sal_info_acc_num_two" size="15px">
	    			
	    			<!-- 공백 -->
    				&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &nbsp;
	    			
				  	예금주 2: 
	    				<input type="text" name="sal_info_acc_hold_two" id="sal_info_acc_hold_two" size="15px">
	    			</td>
				</tr>		
			</table>
			</div><div style="height:5px;"></div><!-- //급여 항목 -->
			
			<div style="border:1px solid lightblue">
			<!-- 부양 가족 -->
			<table>
				<tr>
					<td rowspan="5" style="width:60px;"><!-- 1개는 여비로 놔둠 실제 데이터는 4줄까지-->
						<div style="writing-mode: tb-rl; width:40px; height:150px; border:1px solid lightblue; padding-right:10px;">
							<img src='${contextPath}/resources/ibsheet/Main/d_right2.gif' style="margin-top:5px; margin-left:-5px; width:15px; height:15px;" />
							부양 가족
						</div>
					</td>
				   	<td align="right" style="width:129px;">배우자 공제 : </td>
	    			<td style="width:200px;">
	    				<select name="sal_info_spouse_ded" id="sal_info_spouse_ded">
	    					<option value='' hidden='1'></option><!-- 공백  -->
	    					<!-- <option value='1. 비해당'>1. 비해당</option>  -->
	    				</select>
	
				   	<td align="right" style="width:113px;">부녀자 공제 : </td>
	    			<td>	    				 
	    				<select name="sal_info_deduction" id="sal_info_deduction" class="disabled">
	    					<!-- <option value='1.비해당'>1.비해당</option>  -->
	    				</select>
	    			</td>
				</tr>
				<tr>
				   	<td align="right">20세 이하: </td>
		  			<td> <input type="text" name="sal_info_under_age_twen" id="sal_info_under_age_twen" size="15px"> </td>
		  			
				   	<td align="right">부양 60세 이상 : </td>
		  			<td> <input type="text" name="sal_info_depend_60years_older" id="sal_info_depend_60years_older" size="15px"> </td>
				</tr>
				<tr>
				   	<td align="right">장애인: </td>
		  			<td> <input type="text" name="sal_info_disabled_person" id="sal_info_disabled_person" size="15px"> </td>
		  			
				   	<td align="right">수급자/위탁아동 : </td>
		  			<td> <input type="text" name="sal_info_reci_foster_child" id="sal_info_reci_foster_child" size="15px"> </td>
				</tr>
				<tr>
				   	<td align="right">다자녀 추가공제 : </td>
		  			<td> <input type="text" name="sal_info_multi_child_ded" id="sal_info_multi_child_ded" size="15px"> </td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="3" style="height:15px;"></td>
				</tr>
			</table> 
			</div><!-- //부양 가족 -->
		</form>

	  </div> <!-- //nav  -->
	  </div> <!-- //onClick -->

  </div><!-- //container -->
  </div><!-- //frame -->
      
</body>
</html>