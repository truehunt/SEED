<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

 <link href="${contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/resources/js/datepicker/datepicker.css" rel="stylesheet" type="text/css">

    <script src="${contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
   <script src="${contextPath}/resources/js/project9.js"></script>    

    <script src="${contextPath}/resources/js/jquery-ui.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 

<style> 
table.ui-datepicker-calendar { display:none; }
</style>

<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
    function LoadPage() {

      
      
      var cfg = {FrozenCol:9,MergeSheet:msHeaderOnly };  
      mySheet.SetConfig(cfg); 
      
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1   };
      initData.Cols = [
      //{Header:"No",Type:"Seq", Align:"Center"},
         {Header:"NO",Type:"pk_D_B_PAYMENT_SEQ_CODE",Width:20,SaveName:"pk_D_B_PAYMENT_SEQ_CODE", Align:"Center"},
         {Header:"상태",Type:"Status",Width:60,SaveName:"STATUS", Align:"Center"},
           {Header:"삭제",Type:"DelCheck",Width:60,SaveName:"Delete",Align:"Center"},    
           {Header:"귀속연월",Type:"Text",SaveName:"d_B_PAYMENT_DATE_ATTRIBUT",Width:100,Align:"Center"},
         {Header:"지급일자",Type:"Date",SaveName:"d_B_PAYMENT_DT",Width:100,Align:"Center"},
         {Header:"동시발행",Type:"Combo",Width:80,SaveName:"d_B_PAYMENT_SIMULTANE_ISSUE", Align:"Center", ComboCode:"분리|동시"},
           {Header:"대상자선정",Type:"Text",SaveName:"d_B_PAYMENT_TARGET_SELECT",Width:200,Align:"Center"}
       ];
      IBS_InitSheet(mySheet,initData);
   
      mySheet.SetSumValue(4,"합 계");
       mySheet.SetCellAlign(mySheet.LastRow(),0,"Center");
   
       
       
       
      selectSite();
    
    }




   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
      case "search": //조회
          var param = "d_B_PAYMENT_DATE_ATTRIBUT=" + document.getElementById("d_B_PAYMENT_DATE_ATTRIBUT").value; 
               
          console.log(param);
         mySheet.DoSearch("${contextPath}/pay/SET_payday/searchList.do", param);
         
         //mySheet.DoSearch("transaction_data2.json");
         break;
      case "reload": //초기화
         mySheet.RemoveAll();
      
         break;
      case "save": // 저장
         //var tempStr = mySheet.GetSaveString();
         //alert("서버로 전달되는 문자열 확인 :"+tempStr);
         mySheet.DoSave("${contextPath}/pay/SET_payday/saveData.do");
         break;         
      case "insert":
         mySheet.DataInsert();
          var i = mySheet.RowCount();
          mySheet.CellComboItem(i,4,PY); // 관계
          //코드부분 들어가는 코딩
          var select_row = mySheet.GetSelectRow();
          var col = 3;
          break; 

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
 
   //팝업 호출
   function search1() {
      
      
      w = 500; //팝업창의 너비          //달력정보가져오는 부분
      h = 500; //팝업창의 높이

      //중앙위치 구해오기
      LeftPosition=(screen.width-w)/2;
      TopPosition=(screen.height-h)/2;
      
   window.open("s0002.do", "s0002", "width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
   }
   
  
   
   

   function selectSite() {
      var info4;
      var info5;
      $.ajax({ // 인사기초코드 조회
            url : "${contextPath}/human/p0001/ISA_c.do",//목록을 조회 할 url
            type : "POST",
            dataType : "JSON",
            success : function(data) {
               for (var i = 0; i < data['Data'].length; i++) {
                  var info1 = '|' + data['Data'][i].person_BC_DETAI_MNGEMENT_NAME;
                  
                  var code_ = data['Data'][i].fk_PERSON_BC_CODE_NUM;
                  switch(code_){
                     case 'PY': // 
                        info4 = info4 + info1;
                        break;
                  }
               }
               this.Action();
            },
            Action: function(){    // combo를 넣는 곳
               PY = {'ComboCode':info4,'ComboText':info4}; // 관계
            },
            error : function(jqxhr, status, error) {
               alert("에러");
            }
         });
      };

   
   // mySheet 조회 끝나기 직전 이벤트 
      function mySheet_OnSearchEnd() { // 가족
         for(var i = 1; i<=mySheet.RowCount(); i++ ){
            mySheet.CellComboItem(i,4,PY); // 관계
         }
      }
   
   
 
   
</script>




  <script>

   $(function(){   
      var cal = {
            closeText : "닫기",
            prevText : "이전달",
            nextText : "다음달",
            currentText : "오늘",
            changeMonth: true, // 월을 바꿀 수 있는 셀렉트 박스
            changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스
            monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",   "9월", "10월", "11월", "12월" ],
            dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
            dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
            dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
            weekHeader : "주",
            firstDay : 0,
            isRTL : false,
            showMonthAfterYear : true, // 연,월,일 순으로
            yearSuffix : '',
            
            showOn: 'both', // 텍스트와 버튼을 함께 보여준다
            buttonImage:'https://www.shareicon.net/data/16x16/2016/08/13/808501_calendar_512x512.png', //날짜 버튼 이미지
            buttonImageOnly: true,
            
            showButtonPanel: true
      };
        cal.closeText = "선택";
          cal.dateFormat = "yymm";
          cal.onClose = function (dateText, inst) {
              var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
              var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
              $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
              $(this).datepicker('setDate', new Date(year, month, 1));
          }
       
          cal.beforeShow = function () {
              var selectDate = $("#d_B_PAYMENT_DATE_ATTRIBUT").val().split("-");
              var year = Number(selectDate[0]);
              var month = Number(selectDate[1]) - 1;
              $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
          }

        $("#d_B_PAYMENT_DATE_ATTRIBUT").datepicker(cal);

        $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px'});  //아이콘(icon) 위치   
        $('img.ui-datepicker-trigger').attr('align', 'absmiddle');
   });

      </script>




<body onload="LoadPage()">
 <!-- 달력 datepicker  -->
   
 

  <div class="page_title">
    <span><a class="closeDepth" href="#">closeDepth</a></span> 
    <span class="title">기초환경설정 > <b>급여지급일자등록</b></span>
  </div>
  <div class="main_content">
    <div class="ib_function float_right" style="padding:10 20">
         <a href="javascript:doAction('reload')" class="btn btn-outline btn-primary">초기화</a>
         <a href="javascript:doAction('insert')" class="btn btn-outline btn-primary">추가</a>
         <a href="javascript:doAction('save')" class="btn btn-outline btn-primary">저장</a>
         <a href="javascript:doAction('search')" class="btn btn-outline btn-primary">조회</a>
   
   </div>
         </div>
         <br>      <br>
         
         
         
            <br>
         <form class="form-inline">
  <div class="form-group">
    <label for="d_B_PAYMENT_DATE_ATTRIBUT">귀속연월</label>
    <input type="text" class="form-control" id="d_B_PAYMENT_DATE_ATTRIBUT" >
    
  </div>
  
 </form>





   
   
   

<br><br>
     <div class="clear hidden"></div>
      <!-- left단 사원리스트 -->
              <DIV class="ib_product" style="width:100%;float:left">
            <div style="height:100%;width:45%;float:left">
               <script type="text/javascript"> createIBSheet("mySheet", "90%", "70%"); </script>
            </div>
         
            
         
         </div>
     
     
       <div id="popupset" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" 
    aria-labelledby="myLargeModalLabel"></div>   
        
        <!--right단 정보입력 및 수정단 -->
      
      
 
          
   
    <!--main_content-->

</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

 <link href="${contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/resources/js/datepicker/datepicker.css" rel="stylesheet" type="text/css">

    <script src="${contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
   <script src="${contextPath}/resources/js/project9.js"></script>    

    <script src="${contextPath}/resources/js/jquery-ui.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 

<style> 
table.ui-datepicker-calendar { display:none; }
</style>

<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
    function LoadPage() {

      
      
      var cfg = {FrozenCol:9,MergeSheet:msHeaderOnly };  
      mySheet.SetConfig(cfg); 
      
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1   };
      initData.Cols = [
      //{Header:"No",Type:"Seq", Align:"Center"},
         {Header:"NO",Type:"pk_D_B_PAYMENT_SEQ_CODE",Width:20,SaveName:"pk_D_B_PAYMENT_SEQ_CODE", Align:"Center"},
         {Header:"상태",Type:"Status",Width:60,SaveName:"STATUS", Align:"Center"},
           {Header:"삭제",Type:"DelCheck",Width:60,SaveName:"Delete",Align:"Center"},    
           {Header:"귀속연월",Type:"Text",SaveName:"d_B_PAYMENT_DATE_ATTRIBUT",Width:100,Align:"Center"},
         {Header:"지급일자",Type:"Date",SaveName:"d_B_PAYMENT_DT",Width:100,Align:"Center"},
         {Header:"동시발행",Type:"Combo",Width:80,SaveName:"d_B_PAYMENT_SIMULTANE_ISSUE", Align:"Center", ComboCode:"분리|동시"},
           {Header:"대상자선정",Type:"Text",SaveName:"d_B_PAYMENT_TARGET_SELECT",Width:200,Align:"Center"}
       ];
      IBS_InitSheet(mySheet,initData);
   
      mySheet.SetSumValue(4,"합 계");
       mySheet.SetCellAlign(mySheet.LastRow(),0,"Center");
   
       
       
       
      selectSite();
    
    }




   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
      case "search": //조회
          var param = "d_B_PAYMENT_DATE_ATTRIBUT=" + document.getElementById("d_B_PAYMENT_DATE_ATTRIBUT").value; 
               
          console.log(param);
         mySheet.DoSearch("${contextPath}/pay/SET_payday/searchList.do", param);
         
         //mySheet.DoSearch("transaction_data2.json");
         break;
      case "reload": //초기화
         mySheet.RemoveAll();
      
         break;
      case "save": // 저장
         //var tempStr = mySheet.GetSaveString();
         //alert("서버로 전달되는 문자열 확인 :"+tempStr);
         mySheet.DoSave("${contextPath}/pay/SET_payday/saveData.do");
         break;         
      case "insert":
         mySheet.DataInsert();
          var i = mySheet.RowCount();
          mySheet.CellComboItem(i,4,PY); // 관계
          //코드부분 들어가는 코딩
          var select_row = mySheet.GetSelectRow();
          var col = 3;
          break; 

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
 
   //팝업 호출
   function search1() {
      
      
      w = 500; //팝업창의 너비          //달력정보가져오는 부분
      h = 500; //팝업창의 높이

      //중앙위치 구해오기
      LeftPosition=(screen.width-w)/2;
      TopPosition=(screen.height-h)/2;
      
   window.open("s0002.do", "s0002", "width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
   }
   
  
   
   

   function selectSite() {
      var info4;
      var info5;
      $.ajax({ // 인사기초코드 조회
            url : "${contextPath}/human/p0001/ISA_c.do",//목록을 조회 할 url
            type : "POST",
            dataType : "JSON",
            success : function(data) {
               for (var i = 0; i < data['Data'].length; i++) {
                  var info1 = '|' + data['Data'][i].person_BC_DETAI_MNGEMENT_NAME;
                  
                  var code_ = data['Data'][i].fk_PERSON_BC_CODE_NUM;
                  switch(code_){
                     case 'PY': // 
                        info4 = info4 + info1;
                        break;
                  }
               }
               this.Action();
            },
            Action: function(){    // combo를 넣는 곳
               PY = {'ComboCode':info4,'ComboText':info4}; // 관계
            },
            error : function(jqxhr, status, error) {
               alert("에러");
            }
         });
      };

   
   // mySheet 조회 끝나기 직전 이벤트 
      function mySheet_OnSearchEnd() { // 가족
         for(var i = 1; i<=mySheet.RowCount(); i++ ){
            mySheet.CellComboItem(i,4,PY); // 관계
         }
      }
   
   
 
   
</script>




  <script>

   $(function(){   
      var cal = {
            closeText : "닫기",
            prevText : "이전달",
            nextText : "다음달",
            currentText : "오늘",
            changeMonth: true, // 월을 바꿀 수 있는 셀렉트 박스
            changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스
            monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",   "9월", "10월", "11월", "12월" ],
            dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
            dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
            dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
            weekHeader : "주",
            firstDay : 0,
            isRTL : false,
            showMonthAfterYear : true, // 연,월,일 순으로
            yearSuffix : '',
            
            showOn: 'both', // 텍스트와 버튼을 함께 보여준다
            buttonImage:'https://www.shareicon.net/data/16x16/2016/08/13/808501_calendar_512x512.png', //날짜 버튼 이미지
            buttonImageOnly: true,
            
            showButtonPanel: true
      };
        cal.closeText = "선택";
          cal.dateFormat = "yymm";
          cal.onClose = function (dateText, inst) {
              var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
              var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
              $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
              $(this).datepicker('setDate', new Date(year, month, 1));
          }
       
          cal.beforeShow = function () {
              var selectDate = $("#d_B_PAYMENT_DATE_ATTRIBUT").val().split("-");
              var year = Number(selectDate[0]);
              var month = Number(selectDate[1]) - 1;
              $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
          }

        $("#d_B_PAYMENT_DATE_ATTRIBUT").datepicker(cal);

        $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px'});  //아이콘(icon) 위치   
        $('img.ui-datepicker-trigger').attr('align', 'absmiddle');
   });

      </script>




<body onload="LoadPage()">
 <!-- 달력 datepicker  -->
   
 

  <div class="page_title">
    <span><a class="closeDepth" href="#">closeDepth</a></span> 
    <span class="title">기초환경설정 > <b>급여지급일자등록</b></span>
  </div>
  <div class="main_content">
    <div class="ib_function float_right" style="padding:10 20">
         <a href="javascript:doAction('reload')" class="btn btn-outline btn-primary">초기화</a>
         <a href="javascript:doAction('insert')" class="btn btn-outline btn-primary">추가</a>
         <a href="javascript:doAction('save')" class="btn btn-outline btn-primary">저장</a>
         <a href="javascript:doAction('search')" class="btn btn-outline btn-primary">조회</a>
   
   </div>
         </div>
         <br>      <br>
         
         
         
            <br>
         <form class="form-inline">
  <div class="form-group">
    <label for="d_B_PAYMENT_DATE_ATTRIBUT">귀속연월</label>
    <input type="text" class="form-control" id="d_B_PAYMENT_DATE_ATTRIBUT" >
    
  </div>
  
 </form>





   
   
   

<br><br>
     <div class="clear hidden"></div>
      <!-- left단 사원리스트 -->
              <DIV class="ib_product" style="width:100%;float:left">
            <div style="height:100%;width:45%;float:left">
               <script type="text/javascript"> createIBSheet("mySheet", "90%", "70%"); </script>
            </div>
         
            
         
         </div>
     
     
       <div id="popupset" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" 
    aria-labelledby="myLargeModalLabel"></div>   
        
        <!--right단 정보입력 및 수정단 -->
      
      
 
          
   
    <!--main_content-->

</body>
>>>>>>> refs/remotes/origin/master
</html>