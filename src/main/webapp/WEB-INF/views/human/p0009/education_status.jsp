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
<title>교육관리</title>

<style>

   .div{
    max-width: 500px;
    margin-left: -20px;
    margin-bottom: 0px;
    margin-right: -550px;
     }
     
     
   .frame {
        width : 1200px;
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
        margin-left:400px;
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
   var pageheightoffset = 270;
	function LoadPage() {

		  var initData = {};
	      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1   };
	      initData.Cols = [
	      //{Header:"No",Type:"Seq", Align:"Center"},
	         {Header:"NO",Type:"Seq",SaveName:"Seq", Align:"Center"},
	         {Header:"",Type:"DummyCheck", SaveName:"chk", Width:40, Align:"Center",Edit:1,HeaderCheck:1},
	         {Header:"사원코드",Type:"Text",SaveName:"pk_EDUCATION_ADD_SAWON_CODE",MinWidth:80, Align:"Center", Edit:0},
	         {Header:"사원명",Type:"Text",SaveName:"fk_EDUCATION_EVAL_SAWON_NAME",MinWidth:60, MinWidth:80, Align:"Center", Edit:0}, 
          ];
	      IBS_InitSheet(mySheet,initData);
	      mySheet.SetDataAutoTrim(0);
	      mySheet.SetSumText(1,"총인원");
	  	  mySheet.SetCellAlign(mySheet.LastRow(),0,"Center");

	      
	      
	      
	      
        initdata = {};
		
		initdata.Cfg = {SearchMode:smLazyLoad,Page:50};
		initdata.Cols = [
			 {Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:30, Align:"Center"},
			 {Header:"교육코드",Type:"Text",SaveName:"pk_EDUCATION_MANA_CODE",MinWidth:50, Align:"Center", Edit:0},
			 {Header:"교육명",Type:"Text",SaveName:"education_MANA_NAME",MinWidth:100, Align:"Center"},
			 {Header:"시작일",Type:"Date",SaveName:"education_MANA_STA",MinWidth:80, Align:"Center"},
			 {Header:"종료일",Type:"Date",SaveName:"education_MANA_END",MinWidth:80, Align:"Center"},
			 {Header:"교육시간",Type:"Text",SaveName:"education_MANA_TIMES",MinWidth:50, Align:"Center"},
			 {Header:"교육일수",Type:"Text",SaveName:"education_MANA_DAYS",MinWidth:50, Align:"Center", DateDiff:"(d, |education_MANA_STA|, |education_MANA_END|)"},
			 {Header:"이수여부",Type:"Combo",SaveName:"education_EVAL_COMP",ComboCode:"여|부",MinWidth:40, Align:"Center"},
			 {Header:"출석점수(A)",Type:"Text",SaveName:"education_EVAL_ATTE",MinWidth:60, Align:"Center"},
	         {Header:"태도점수(B)",Type:"Text",SaveName:"education_EVAL_ATTI",MinWidth:60, Align:"Center"},
	         {Header:"평가점수(C)",Type:"Text",SaveName:"education_EVAL_SCORE",MinWidth:60, Align:"Center"},
	         {Header:"합계\nA+B+C",Type:"Text",SaveName:"education_EVAL_SUM",MinWidth:100, Align:"Center", CalcLogic:"|education_EVAL_ATTE|+|education_EVAL_ATTI|+|education_EVAL_SCORE|"}];
		IBS_InitSheet(mySheet2,initdata);
		
		
		
		
	}


	 //onClick 이벤트
    var t_row = 0;
    function mySheet_OnClick(row, col, value, cellx, celly, cellw, cellh) {
     t_row = row;
     if (row == null || row <= 0) return; // row가 null 이거나 0보다 같거나 작으면 바로 리턴
    
     var pk = mySheet.GetCellValue(row,2); // 마우스로 클릭한 셀의 value를 가져와서 pk에 저장
     
     var colArr =  Object.keys(mySheet.SaveNameInfo); // object.keys()메서드는 개체 고유 속성의 키를 배열로 반환,                                // 배열순서는 일반반복문을 사용할 때와 동일 , SaveNameInfo는 매핑되려는 칼럼의 이름을 들고있다.
       
       $.each(colArr,function(k,v){ // .each - 배열을 반복문으로 돌림 key 와 value 값을 가진다. 
          $("#"+v).val(mySheet.GetCellValue(row,k)); // ibsheet의 GetCellValue 메서드를 사용해 row 의 key value 를 가져옴 
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
      
            
            mySheet.DoSearch("${contextPath}/human/p0009/searchList.do");
            
            //콤보박스에 값 불러오기 -> 행 추가(입력) 및 append 중복 추가 방지
            selectHead();
            $('#pk_EDUCATION_MANA_CODE').html("   ");
            
            break;
         case "reload": //초기화
            mySheet.RemoveAll();
            break;
         case "save": // 저장
            //현재는 테스트 하는 겸 해서 놔두지만 나중에는 주석 처리 해야됨 
            //save 를 하면서 중복 처리 됨 
            var tempStr = mySheet.GetSaveString();
            tempStr += alert("서버로 전달되는 문자열 확인 :"+tempStr);
            mySheet.DoSave("${contextPath}/human/p0009/insertData.do");
            break;
         case "insert": //신규행 추가
            var row = mySheet.DataInsert();
         
            //콤보박스에 값 불러오기 -> 행 추가후 실행
            selectHead();
            $('#pk_EDUCATION_MANA_CODE').html("   ");
            
            break;
      }
   }
   // Validation 확인하기
   function mySheet_OnValidation(Row, Col, Value){
      console.log('확인');
      
      switch(Col){
         
         case 5: // 교육번호 
            //console.log(Value);
            //console.log(Value.length);
            if(Value.length >= 0 && Value.length < 4){
               alert("교육관리번호는 4자리로 입력하셔야 됩니다.");
               mySheet.ValidateFail(1); // Validation 실패
               document.getElementById('education_MANA_DAYS').focus(); //실패시 포커스 이동
            }
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
          $("#education_MANA_STA").datepicker();                    
          $("#education_MANA_END").datepicker();

      });
      </script>




<body onLoad="LoadPage()">
      
      <div class="nav" style="width:100%; overflow:hidden;">
           <div class="main_content"  style="width:1600px;">
                <div class="ib_function float_left">
                 <a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
                 <a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
                 <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
                 <a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
               </div>
               
            

     <div class="ib_product" style="width:60%;float:left">
     <!-- content (오른쪽 layout시작)  -->
       
  
     
				<div  style="height:100%;width:35%;float:left">
					<script type="text/javascript"> createIBSheet("mySheet", "70%", "100%");</script>
				</div>
			
				
				<div  style="height:100%;width:65%;float:left">
					<script type="text/javascript"> createIBSheet("mySheet2", "180%", "70%"); </script>
				</div>
        
   
  
     

  </div>


</div>



		
      
      </div>
      <!--main_content-->

</body>
</html>
