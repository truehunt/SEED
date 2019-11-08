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

      
      
      var cfg = {FrozenCol:9,MergeSheet:msHeaderOnly };  
      mySheet.SetConfig(cfg); 
      
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1   };
      initData.Cols = [
      //{Header:"No",Type:"Seq", Align:"Center"},
         {Header:"상태",Type:"Status",Width:60,SaveName:"STATUS", Align:"Center"},
   	     {Header:"삭제",Type:"DelCheck",Width:60,SaveName:"Delete",Align:"Center"},    
         {Header:"은행",Type:"Text",Width:80,SaveName:"salary_BO_STA_BANK_CODE",  Align:"Center"},
   	     {Header:"사원코드",Type:"Text",SaveName:"fk_TA_SAWON_CODE",Width:80,Align:"Center"},
         {Header:"사원명",Type:"Text",SaveName:"ta_SAWON_NAME",Width:80,Align:"Center"},
         {Header:"계좌번호",Type:"Text",SaveName:"salary_BO_STA_ACC_NUMBER",Width:220,Align:"Center"},
         {Header:"실지급액",Type:"AutoSum",Width:150,Format:"#,### 만원",SaveName:"salary_BO_STA_ACT_PAY"},   
         {Header:"지급일자",Type:"Text",SaveName:"ta_PAYMENTDAY",Width:130,Align:"Center"}
       ];
      IBS_InitSheet(mySheet,initData);
   
      mySheet.SetSumValue(4,"합 계");
  	  mySheet.SetCellAlign(mySheet.LastRow(),0,"Center");
   
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





   //드레그 드롭 데이터 이동
   function mySheet2_OnDropEnd(FromSheet, FromRow, ToSheet, ToRow, X, Y, Type) {
      if(FromSheet!=ToSheet&&mySheet.CheckedRows("chk")>1){
                  
         //체크한 행의 데이터를 json형태로 얻음
         var rows = (mySheet.FindCheckedRow("chk")).split("|");
         var rowData = [];
         for(var i=rows.length-1;i>=0;i--){
            //삭제될 데이터를 임시 보관
            rowData.push(FromSheet.GetRowData(rows[i]) );
            //원본 데이터 삭제
            FromSheet.RowDelete(rows[i]);
         }
         
         //드롭 지점의 레벨을 확인
         var lvl = ToSheet.GetRowLevel(ToRow);
         
         //레벨이 부서 이상이면 리턴
         if(lvl<2) return;
         
         //행 데이터 복사(트리임으로 레벨을 고려할 것)
         for(var i=0;i<rowData.length;i++){
            ToSheet.SetRowData(ToRow+1 , rowData[i] ,{Add:1,Level:3} );   
         }
         
      }else{
         //드레그 한 행의 데이터를 json형태로 얻음
         var rowjson = FromSheet.GetRowData(FromRow);
         
         var posRow = FromRow;
         if(FromSheet==ToSheet&&ToRow<FromRow){
            //같은 시트내에서 이동은 신경을 써야 함.   
            posRow++;
         }
         
         //드롭 지점의 레벨을 확인
         var lvl = ToSheet.GetRowLevel(ToRow);
         
         //레벨이 부서 이상이면 리턴
         if(lvl<2) return;
         
         //행 데이터 복사(트리임으로 레벨을 고려할 것)
         ToSheet.SetRowData(ToRow+1 , rowjson ,{Add:1,Level:3} );

         //원본 데이터 삭제
         FromSheet.RowDelete(posRow);
      }
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
    <span><a class="closeDepth" href="#">closeDepth</a></span> 
    <span class="title">급여/퇴직정산관리> <b>급여이체현황</b></span>
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
         
         <div>
            <br>
         <form class="form-inline">
  <div class="form-group">
    <label for="term1">귀속연월</label>
    <input type="text" class="form-control" id="term1" >
  </div>
  
  &emsp; &emsp; &emsp;&emsp; &emsp; &emsp;&emsp; &emsp; &emsp;&emsp; &emsp; &emsp;&emsp; &emsp;
  
  <div class="form-group">
    <label for="term2">지급일</label>
    <input type="text" class="form-control" id="term2" >
  </div>
  </form>
      
         <br>
        <form class="form-inline">
          <label for="salary_BO_STA_BANK_CODE">은행코드</label>
          &ensp;<select name="salary_BO_STA_BANK_CODE" id="salary_BO_STA_BANK_CODE">
                      <option value="국민(040)">국민(040)</option>
                       <option value="외환(050)">외환(050)</option>
                        <option value="수협(070)">수협(070)</option>
                         <option value="농협(100)">농협(100)</option>
                          <option value="우리(200)">우리(200)</option>
                           <option value="신한(260)">신한(260)</option>
                           <option value="카카오뱅크(900)">카카오뱅크(900)</option>
                       
                           
                           </select>
         &ensp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp;&ensp;&emsp;&emsp; &emsp;&emsp; &emsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;
                     <label for="workplace">사업장</label>
                     &ensp;<select name="workplace" id="workplace">
                      <option value="본사">본사</option>
                       <option value="대리점">대리점</option>
                           </select>             
                  </form>
             
             
         
             </div>
             
             </div>
   




<br><br>
      <div class="clear hidden"></div>
      <!-- left단 사원리스트 -->
              <DIV class="ib_product" style="width:100%;float:left">
				<div style="height:100%;width:100%;float:left">
					<script type="text/javascript"> createIBSheet("mySheet", "100%", "100%"); </script>
				</div>
			
				
			</div>
               
      
        
        <!--right단 정보입력 및 수정단 -->
      
      
 
          
   
    <!--main_content-->

</body>
</html>