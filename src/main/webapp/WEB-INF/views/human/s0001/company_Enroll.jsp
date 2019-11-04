<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사등록</title>

<style>
	
	.frame {
		  width : 1550px;
		  margin: auto;
		  border : 1px solid lightblue;
	}

	.container {
  		overflow: hidden;
  		display: table;
	}


	.nav {
		  float: left;
		  width: 620px;
		  height: 600px;
		  border : 1px solid lightblue;
	}
	.content {
		  float: left;
		  width: 920px;
		  height: 600px;
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

</style>

<!-- 우편번호 관련된 script 추가 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- ibsheet,tab 관련된 script 및 link 추가  -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> 
  	<link href="${pageContext.request.contextPath}/resources/ibsheet/tab/ibtab-style.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibleaders.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibsheet.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/tab/ibtab.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/tab/ibtabinfo.js" type="text/javascript"></script>


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
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
			{Header:"코드",Type:"Text",SaveName:"pk_company_code",MinWidth:50,Align:"Center", KeyField:1},
			{Header:"회사명",Type:"Text",SaveName:"company_name",MinWidth:100,Align:"Center", KeyField:1},			
			{Header:"구분", Type:"Combo", MinWidth:80, SaveName:"company_division",Edit: 1, Align:"Center",KeyField:1
						, ComboText:"0. 법인|1. 개인" 
						, ComboCode:"A00|A01"},
			{Header:"회계년도1",Type:"Date",SaveName:"company_fiscal_year_o", Hidden:1},
			{Header:"회계년도2",Type:"Date",SaveName:"company_fiscal_year_t", Hidden:1},
			{Header:"사업자등록번호",Type:"Text",SaveName:"company_reg_num", Hidden:1},
			{Header:"법인등록번호",Type:"Text",SaveName:"company_corp_reg_num", Hidden:1},
			{Header:"대표자성명",Type:"Text",SaveName:"company_rep_name", Hidden:1},
			{Header:"외국인여부",Type:"Text",SaveName:"company_foreigner_whe", Hidden:1},
			{Header:"주민등록번호",Type:"Text",SaveName:"company_resi_reg_num", Hidden:1},
			{Header:"본점우편번호",Type:"Text",SaveName:"company_zip", Hidden:1},
			{Header:"본점주소",Type:"Text",SaveName:"company_address", Hidden:1},
			{Header:"본점상세주소",Type:"Text",SaveName:"company_detail_address", Hidden:1},			
			{Header:"본점전화번호",Type:"Text",SaveName:"company_tel", Hidden:1},
			{Header:"본점FAX",Type:"Text",SaveName:"company_fax", Hidden:1},
			{Header:"업태",Type:"Text",SaveName:"company_business", Hidden:1},
			{Header:"종목",Type:"Text",SaveName:"company_stocks", Hidden:1},
			{Header:"설립연월일",Type:"Date", Align:"Center", SaveName:"company_establishment_date", Format:"", Hidden:1},
			{Header:"개업연월일",Type:"Date", Align:"Center", SaveName:"company_open_date", Format:"", Hidden:1},
			{Header:"폐업연월일",Type:"Date", Align:"Center", SaveName:"company_closed_date", Format:"", Hidden:1},
			{Header:"입력자",Type:"Text",SaveName:"company_int_user_id", Hidden:1},
			{Header:"입력일시",Type:"Text",SaveName:"company_int_date", Format:"", Hidden:1},
			{Header:"수정자",Type:"Text",SaveName:"company_mod_user_id", Hidden:1},
			{Header:"수정일시",Type:"Text",SaveName:"company_mod_date",Format:"", Hidden:1},
		];  
		//sheet 초기화
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
	}
		
	//onClick 이벤트
	 var t_row = 0;
	 function mySheet_OnClick(row, col, value, cellx, celly, cellw, cellh) {
	  t_row = row;
      if (row == null || row < 0) return; // row가 null 이거나 0보다 작으면 바로 리턴
     
      var pk = mySheet.GetCellValue(row,2); // 마우스로 클릭한 셀의 value를 가져와서 pk에 저장
     
      var colArr =  Object.keys(mySheet.rX); // object.keys()메서드는 개체 고유 속성의 키를 배열로 반환, 
   											 // 배열순서는 일반반복문을 사용할 때와 동일 , rx는 매핑되려는 칼럼의 이름을 들고있다.
   	  
   	  $.each(colArr,function(k,v){ // .each - 배열을 반복문으로 돌림 key 와 value 값을 가진다. 
	  	  $("#"+v).val(mySheet.GetCellValue(row,k)); // ibsheet의 GetCellValue 메서드를 사용해 row 의 key value 를 가져옴 
	  })
 
   }
	 
	 $(document).on('change', 'input', function(e) {
		  var colArr =  Object.keys(mySheet.rX);
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
				mySheet.DoSearch("${contextPath}/human/s0001/searchList.do");
				//mySheet.DoSearch("${contextPath}/human/s0001/comEnrollView.do");
				
				//mySheet.DoSearch("transaction_data2.json");
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
				var tempStr = mySheet.GetSaveString();
				tempStr += 
				alert("서버로 전달되는 문자열 확인 :"+tempStr);
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
                document.getElementById('company_zip').value = data.zonecode; // 우편번호
                mySheet.SetCellValue(t_row,12, data.zonecode);
                
                document.getElementById('company_address').value = roadAddr; // 도로명주소
                mySheet.SetCellValue(t_row,13, roadAddr);
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){ // 상세주소
                    document.getElementById('company_detail_address').value = extraRoadAddr;
                	mySheet.SetCellValue(t_row,14,extraRoadAddr); // 변경이 있으면 mysheet에 setCellValue를 써서 값 입력
                } else {
                    document.getElementById('company_detail_address').value = '';
                    mySheet.SetCellValue(t_row,14,"");
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
</script>
</head>

<body onload="LoadPage()">
	<div class="page_title">
	    <span class="title"><b>등록정보관리 > 회사 등록</b></span>
	</div>
	<br>
<div class="frame">
	<!-- //header -->
  <div class="container">
  <div class="nav">
	  
	  <div class="main_content">
	    <div class="exp_product">
	    </div>
	    <div class="ib_function float_left">
		  <a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
		  <a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
		  <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
		  <a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
		</div>
		<!-- ibsheet 뿌려주는 부분  -->
		<div class="clear hidden"></div>
		<div class="ib_product"><script>createIBSheet("mySheet", "60%", "60%");</script></div>

	  </div> <!-- //nav  -->
	  </div> <!-- //onClick -->
	 <div class="content">
	 <table>
	 	<tr><td class="main_menu">기본등록사항</td></tr>
	 	<tr><td></td></tr>
	 </table>
  <form>
	  <table width="550px" height="550px">
	   <tr>
	   	<td align="right">회계 년도 : </td>
	   		<td> 
		   		<input type="text" name="company_fiscal_year_o" id="company_fiscal_year_o" size="12px" placeholder="_ _ _ _/_ _/_ _"> <a href=""><img src='${contextPath}/resources/ibsheet/Main/calendar.gif;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' /> 
		   		     ~  <input type="text" name="company_fiscal_year_t" id="company_fiscal_year_t" size="12px" placeholder="_ _ _ _/_ _/_ _"><img src='${contextPath}/resources/ibsheet/Main/calendar.gif;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' />
	   		</td>
	   </tr>
	   <tr>
	   	<td align="right">사업자 등록번호 : </td><td> <input type="text" name="company_reg_num" id="company_reg_num" size="30px" placeholder="_ _ _-_ _-_ _ _ _ _"> </td>
	   </tr>
	   <tr>
	   	<td align="right">법인 등록번호 : </td><td> <input type="text" name="company_corp_reg_num" id="company_corp_reg_num" size="30px" placeholder="_ _ _ _ _ _- _ _ _ _ _ _ _"> </td>
	   </tr>
	   <tr>
	   	<td align="right">대표자 성명 : </td><td> <input type="text" name="company_rep_name" id="company_rep_name" size="25px"> </td>
	   </tr>
	   <tr>
	   	<td align="right">외국인여부 : </td><td> 
	   				<select name='company_foreigner_whe'>
	  					<option value='내국인' >0.내국인</option>
	  					<option value='외국인' >1.외국인</option>
	  				</select>
	  	</td>
	   </tr>
	   <tr>
	   	<td align="right">주민등록번호 : </td><td> <input type="text" name="company_resi_reg_num" id="company_resi_reg_num" size="30px" placeholder="_ _ _ _ _ _- _ _ _ _ _ _ _"> </td>
	   </tr>
	   <tr><td></td><tr> <!-- 공백 -->
	   <tr>
	   	<td class="zipClass" align="right">본점 우편번호 : </td><td> <input type="text" id="company_zip" name="company_zip" size="10px"> 
	   		<!-- input type 예시  
	   			<input type="image" src="${contextPath}/resources/image/search_icon.png" onclick="sample4_execDaumPostcode()" width="20px"; height="15px" />
	   		    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호찾기" />
	   		-->
	   		<img src='${contextPath}/resources/image/search_icon.png;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' />
	   	</td>
	   </tr>
	   <tr>
	   	<td align="right">본점 주소 : </td><td> <input type="text"  name="company_address" id="company_address" size="50px"> </td>
	   </tr>
	   <tr>
	   	<td align="right">본점 상세주소 : </td><td> <input type="text" name="company_detail_address" id="company_detail_address" size="50px"> </td>
	   </tr>
	   <tr>
	   	<td align="right">본점 전화번호 : </td><td> <input type="text" name="company_tel" id="company_tel"> </td>
	   </tr>
	   <tr>
	   	<td align="right">본점 FAX : </td><td> <input type="text" name="company_fax" id="company_fax"> </td>
	   </tr>
	   <tr>
	   	<td align="right">업태 : </td><td> <input type="text" name="company_business" id="company_business"> </td>
	   </tr>
	   <tr>
	   	<td align="right">종목 : </td><td> <input type="text" name="company_stocks" id="company_stocks"> </td>
	   </tr>
	   <tr><td></td></tr><!-- 공백 -->
	   <tr>
	   	<td align="right">설립 연월일 : </td>
	   		<td> <input type="text" name="company_establishment_date" id="company_establishment_date" size="12px" placeholder="_ _ _ _/_ _/_ _">
	   			<img src='${contextPath}/resources/ibsheet/Main/calendar.gif;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' /> 
	   		</td>
	   </tr>
	   <tr>
	   	<td align="right">개업 연월일 : </td>
	   		<td> <input type="text" name="company_open_date" id="company_open_date" size="12px" placeholder="_ _ _ _/_ _/_ _"> 
	   			<img src='${contextPath}/resources/ibsheet/Main/calendar.gif;' onclick='sample4_execDaumPostcode();' style='cursor:pointer;' />
	   		</td>
	   </tr>
	   <tr>
	   	<td align="right">폐업 연월일 : </td>
	   		<td> 
	   			<input type="text" name="company_closed_date" id="company_closed_date" size="12px" placeholder="_ _ _ _/_ _/_ _"> 
	   			<a href=""><img src="${contextPath}/resources/ibsheet/Main/calendar.gif" alt="calendar_icon.png" /> </a>
	   		</td>
	   </tr>
	   <tr><td></td></tr><!-- 공백 -->
	  </table>
  </form>
  </div><!-- //content -->
  </div><!-- //container -->
  </div><!-- //frame -->
</body>
</html>