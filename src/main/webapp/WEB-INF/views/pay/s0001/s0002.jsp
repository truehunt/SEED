<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
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
    <script src="${contextPath}/resources/js/datepicker/bootstrap-datepicker.js"></script>
    <script src="${contextPath}/resources/js/project9.js"></script>

<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
    function LoadPage() {

      
   
  	  
      var cfg = {FrozenCol:6,MergeSheet:msHeaderOnly };  
      mySheet.SetConfig(cfg); 
      
      var header = [
         {Text:"NO|직종|전체|월급|연봉|일급|시급",Align:"Center"},
         {Text:"NO|직종|입사자상여계산|입사자상여계산|퇴사자상여계산|퇴사자상여계산",Align:"Center"}
    
         ];  
      var info = {Sort:0,ColMove:1,ColResize:1};  
      mySheet.InitHeaders(header,info);  
      
      var cols = [   
        {Header:"NO",Type:"Seq",Width:20,SaveName:"fk_D_B_PAYMENT_SEQ_CODE", Align:"Center"},
          {Header:"급여구분",Type:"Text",SaveName:"pk_PAY_BEN_C_UNIQUE_NUM",Width:50,Align:"Center"},
         {Header:"방법",Type:"Combo", RowSpan:1,SaveName:"pay_BEN_C_RECRUIT_METHOD", ComboText:"평일정상근무일|토일정상근무일|주휴정상근무일|유휴정상근무일|무휴정상근무일", ComboCode:"평일정상근무일|토일정상근무일|주휴정상근무일|유휴정상근무일|무휴정상근무일"},          
         {Header:"기준일수",Type:"AutoSum",SaveName:"pay_BEN_C_DATE_RECRUIT", MinWidth:10, Align: "Center"},
         {Header:"방법",Type:"AutoSum",SaveName:"pay_BEN_C_RETIRE_BEN_METHOD", MinWidth:10, Align: "Center"},
         {Header:"기준일수",Type:"AutoSum",SaveName:"pay_BEN_C_DATE_RESIG", MinWidth:10, Align: "Center"}

   
          ]; 
      mySheet.InitColumns(cols); 
      mySheet.SetSumText(1,"합   계");
      
  	  
  	  //달력
      $('#term1').datepicker().on('changeDate', function(ev) {
          if (ev.viewMode=="days"){
              $('#term1').datepicker('hide');
          }
      });
      $('#term2').datepicker().on('changeDate', function(ev) {
          if (ev.viewMode=="days"){
              $('#term2').datepicker('hide');
          }
      });
    
  
    
    }



  
   
   




   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
      case "search": //조회
          var param = "ta_ATTRIBUTION=" + document.getElementById("attribute").value 
                   + "&ta_PAYMENTDAY=" + document.getElementById("payday").value
                   +"&salary_BO_STA_BANK_CODE=" + document.getElementById("salary_BO_STA_BANK_CODE").value 
                   +"&pk_TA_WORKPLACE_CODE=" + document.getElementById("workplace").value;
 
          console.log(param);
         mySheet.DoSearch("${contextPath}/pay/p0003/searchList.do", param);
         
         //mySheet.DoSearch("transaction_data2.json");
         break;
      case "reload": //초기화
         mySheet.RemoveAll();
      
         break;
      case "save": // 저장
         //var tempStr = mySheet.GetSaveString();
         //alert("서버로 전달되는 문자열 확인 :"+tempStr);
         mySheet.DoSave("${contextPath}/pay/p0003/saveData.do");
         break;         
      case "insert":
          mySheet.DataInsert(-1);
          //코드부분 들어가는 코딩
          var select_row = mySheet.GetSelectRow();
          var col = 3;
          mySheet.SetCellValue(select_row, col, fk_ta_sawon_code);
          break; 

   }
}
   
   
   
   
   
 
   
// 기타 이벤트 //마우스 클릭시
   function mySheet_OnSelectCell(oldrow,oldcol,row,col) {
      x = "FK_TA_SAWON_CODE=" + mySheet.GetCellValue(row,2);
      console.log(x);
      fk_ta_sawon_code = mySheet.GetCellValue(row,2);
      mySheet2.DoSearch("${pageContext.request.contextPath}/pay/p0003/searchList2.do",x);
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
   
   //버튼을 이용한 이동
   function move(to){
      var ToSheet,FromSheet;
      if(to=="toRight"){
         ToSheet = mySheet2;
         FromSheet = mySheet;

         //복사될 위치를 구한다.
         var ToRow = ToSheet.GetSelectRow();
         if(ToSheet.GetRowLevel(ToRow)<2){
            alert("오른쪽 시트에서 붙여넣을 팀을 선택해 주세요");
            return;
         }
         //원본 시트에 복사할 데이터 추출
         var data = FromSheet.GetSaveJson({StdCol:"chk"});
         //대상 시트에 데이터 복사
         ToSheet.LoadSearchChildData(ToRow,data,{Append: 1, WaitDlg: 1});
         
         //체크된 행이 있는지 찾아본다.
         var rows = FromSheet.FindCheckedRow("chk");
         
         //원본 데이터 삭제
         FromSheet.RowDelete(rows);
         
      }else{ //toLeft
         //반대방향으로 이동하는 것은 시트 모양이 안예뻐서 안 만들었음.
         ToSheet = mySheet;
         FromSheet = mySheet2;
      }   
   }
   

   
   
   
   
   
   
   
   
   
   
   
   

   
</script>

<body onload="LoadPage()">
  <div class="page_title">
   
  </div>
  <div class="main_content">
       <div class="exp_product"></div>
       <div class="exp_product">
         
      </div>
      <div class="ib_function float_right">
         <a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
         <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
         </div>
         <br>      <br>
         
            <br>
         <form class="form-inline">
  <div class="form-group">
    <label for="term1">귀속연월</label>
    <input type="text" class="form-control" id="term1" >
  </div>
  
 </form>

</div>


<br><br>
     <div class="clear hidden"></div>
      <!-- left단 사원리스트 -->
              <DIV class="ib_product" style="width:100%;float:center">
				<div style="height:50%;width:100%;float:center">
					<script type="text/javascript"> createIBSheet("mySheet", "90%", "70%"); selectSite();</script>
				</div>
			
			</div>
     
        
        <!--right단 정보입력 및 수정단 -->
      
      
 
          
   
    <!--main_content-->

</body>
</html>