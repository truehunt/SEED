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
         {Header:"상태",Type:"Status",Width:60,SaveName:"STATUS", Align:"Center"},
   	     {Header:"삭제",Type:"DelCheck",Width:60,SaveName:"Delete",Align:"Center"},    
         {Header:"은행",Type:"Text",Width:110,SaveName:"sal_INFO_TRANS_AMOUNT_O",  Align:"Center"},
   	     {Header:"사원코드",Type:"Text",SaveName:"pk_SAWON_CODE",Width:80,Align:"Center"},
         {Header:"사원명",Type:"Text",SaveName:"sawon_NAME",Width:80,Align:"Center"},
         {Header:"계좌번호",Type:"Text",SaveName:"sal_INFO_ACC_NUM_ONE",Width:220,Align:"Center"},
         {Header:"지급항목",Type:"Text",SaveName:"salary_CAL_SALARY_ITEM",Width:100,Align:"Center"},
         {Header:"실지급액",Type:"AutoSum",Width:150,Format:"#,### 만원",SaveName:"salary_CAL_MONEY"},   
         {Header:"지급일자",Type:"Text",SaveName:"salary_CAL_PAYMENTDAY",Width:130,Align:"Center"}
       ];
      IBS_InitSheet(mySheet,initData);
   
      mySheet.SetSumValue(4,"합 계");
  	  mySheet.SetCellAlign(mySheet.LastRow(),0,"Center");
   
 
  	yearday();
    
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
      
    	    var xx = document.getElementById("yeardayd");
			var xy = xx.options[xx.selectedIndex].text; 
			
			var yy = document.getElementById("SiteList1");
			var yz = yy.options[yy.selectedIndex].text;
		
			
        if($("#SiteList").val() == "1"){
        	var param = "D_B_PAYMENT_DATE_ATTRIBUT=" + document.getElementById("yearday").value + "&SALARY_CAL_PAYMENTDAY=" + xy +"&FK_SAWON_WORKPLACE_CODE=" + $("#SiteList").val() + "&PK_WORKPLACE_CODE=" + document.getElementById("DeptList").value + "&SAL_INFO_TRANS_AMOUNT_O=" + yz ;      
  }else if($("#SiteList").val() == "2"){
        	 var param = "D_B_PAYMENT_DATE_ATTRIBUT=" + document.getElementById("yearday").value + "&SALARY_CAL_PAYMENTDAY=" + xy +"&FK_SAWON_WORKPLACE_CODE=" + $("#SiteList").val() + "&FK_DEPT_CODE=" + document.getElementById("DeptList").value + "&SAL_INFO_TRANS_AMOUNT_O=" + yz ;
        	 }
        
        
          console.log(param);
         mySheet.DoSearch("${contextPath}/pay/SALARY_bo_sta/searchList.do", param);
         
         //mySheet.DoSearch("transaction_data2.json");
         break;
      case "reload": //초기화
         mySheet.RemoveAll();
      
         break;
      case "save": // 저장
         //var tempStr = mySheet.GetSaveString();
         //alert("서버로 전달되는 문자열 확인 :"+tempStr);
         mySheet.DoSave("${contextPath}/pay/SALARY_bo_sta/saveData.do");
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
	 	var xx = document.getElementById("yeardayd");
	   	var xy = xx.options[xx.selectedIndex].text; 
	   	
	   	var xxx = document.getElementById("SiteList1");
	   	var xyy = xxx.options[xxx.selectedIndex].text;
	   	
	 
		x = "salary_CAL_PAYMENTDAY=" + xy + "&sal_INFO_TRANS_AMOUNT_O" + xyy;
      
      
      console.log(x);
      fk_ta_sawon_code = mySheet.GetCellValue(row,2);
      mySheet2.DoSearch("${pageContext.request.contextPath}/pay/SALARY_bo_sta/searchList.do",x);
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
	              yeardayd();
	          }
	       
	          
	          cal.beforeShow = function () {
	              var selectDate = $("#yearday").val().split("-");
	              var year = Number(selectDate[0]);
	              var month = Number(selectDate[1]) - 1;
	              $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
	          }

	        $("#yearday").datepicker(cal);

	        $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px'});  //아이콘(icon) 위치   
	        $('img.ui-datepicker-trigger').attr('align', 'absmiddle');
	   });
	   
	   
	   

	function yearday() {

	    $.ajax({

	             url : "${contextPath}/pay/SALARY_bo_sta/yearday.do",//목록을 조회 할 url

	             type : "POST",

	             dataType : "JSON",

	             success : function(data) {

	                for (var i = 0; i < data['Data'].length; i++) {
	                   
	                   

	                    var option = "<option class='' value='" + data['Data'][i].pk_D_B_PAYMENT_SEQ_CODE + "'>"
	                    + data['Data'][i].d_B_PAYMENT_DATE_ATTRIBUT 
	                    + "</option>";
	                   //대상 콤보박스에 추가
	             
	                   $('#yearday').append(option);

	                }
	                
	             },

	             error : function(jqxhr, status, error) {

	                alert("에러");

	             }

	          });

	 };

	 function yeardayd() {

	    var yearday = $('#yearday').val();
	    
	    //var x = $('#DeptList option[name='all']').find("option").val();
	    $
	          .ajax({

	             url : "${contextPath}/pay/SALARY_bo_sta/yeardayd.do",//목록을 조회 할 url

	             type : "POST",

	             data : {
	                "yearday" : yearday
	             },

	             dataType : "JSON",

	             success : function(data) {
	                //$(".1").remove();
	                //$("select#yeardayd option").append(x); // 이거 되는거 ㅎ
	                //$("#yeardayd").append(data);
	                //var y="<option value="" selected>전체</option>";
	                //$("select#DeptList").find(".1").remove().end().append(y);

	                for (var i = 0; i < data['Data'].length; i++)  {

	                      var option = "<option class='3' value='" + data['Data'][i].pk_D_B_PAYMENT_SEQ_CODE + "'>"
	                       + data['Data'][i].d_B_PAYMENT_DT
	                       + "</option>";
	 
	                   //대상 콤보박스에 추가
	                   $('#yeardayd').append(option);

	                }

	             },

	             error : function(jqxhr, status, error) {

	                alert("에러");

	             }

	          });

	 };
 </script>
  

   <script>
   function selectSite() {
	      var info4;
	      var info5;
	      $.ajax({ // 인사기초코드 조회
	            url : "${contextPath}/human/p0001/ISA_c.do",//목록을 조회 할 url
	            type : "POST",
	            dataType : "JSON",
	            success : function(data) {
	               for (var i = 0; i < data['Data'].length; i++) {
	                  var code_ = data['Data'][i].fk_PERSON_BC_CODE_NUM;
	                  
	                  var option = "<option class='' value='" + data['Data'][i].pk_PERSON_BC_DETAI_CODE_NUM + "'>"
	                + data['Data'][i].person_BC_DETAI_MNGEMENT_NAME
	                + "</option>";
	                
	                  switch(code_){
	                     case 'EL': // 
	                        $('#SiteList').append(option);
	                        break;
	                  }
	                  
	               }
	              
	            },
	            error : function(jqxhr, status, error) {
	               alert("에러");
	            }
	         });
	      };
	      

	   function selectDept() {

	      var SiteList = $('#SiteList').val();
	      
	      if(SiteList==1){
	      //var x = $('#DeptList option[name='all']').find("option").val();
	      $
	            .ajax({

	               url : "${contextPath}/pay/SALARY_bo_sta/DeptList.do",//목록을 조회 할 url

	               type : "POST",

	               data : {
	                  "SiteList" : SiteList
	               },

	               dataType : "JSON",

	               success : function(data) {
	                  $(".1").remove();
	                  //$("select#DeptList option").append(x); // 이거 되는거 ㅎ
	                  //$("#DeptList").append(data);
	                  //var y="<option value="" selected>전체</option>";
	                  //$("select#DeptList").find(".1").remove().end().append(y);
	                  
	            if(data['Data'][0].workplace_NAME!= null && data['Data'][0].workplace_NAME!= ''){
	               
	                  for (var i = 0; i < data['Data'].length; i++) {

	                     var option = "<option class='1' value='" + data['Data'][i].pk_WORKPLACE_CODE + "'>"
	                           + data['Data'][i].workplace_NAME
	                           + "</option>";
	                          
	                           

	                     //대상 콤보박스에 추가
	                     $('#DeptList').append(option);

	                  }
	               }
	   
	               },

	               error : function(jqxhr, status, error) {

	                  alert("에러");

	               }

	            });
	      } else { // 2일때 
	    	  $
	          .ajax({

	             url : "${contextPath}/pay/SALARY_bo_sta/DeptList2.do",//목록을 조회 할 url

	             type : "POST",

	             data : {
	                "SiteList" : SiteList
	             },

	             dataType : "JSON",

	             success : function(data) {
	                $(".1").remove();
	                //$("select#DeptList option").append(x); // 이거 되는거 ㅎ
	                //$("#DeptList").append(data);
	                //var y="<option value="" selected>전체</option>";
	                //$("select#DeptList").find(".1").remove().end().append(y);
	                
	          if(data['Data'][0].dept_NAME!= null && data['Data'][0].dept_NAME!= ''){
	             
	              for (var i = 0; i < data['Data'].length; i++) {

	                 var option = "<option class='1' value='" + data['Data'][i].pk_DEPT_CODE + "'>"
	                       + data['Data'][i].dept_NAME
	                       + "</option>";
	                      
	                       

	                 //대상 콤보박스에 추가
	                 $('#DeptList').append(option);

	              }
	           }
	          

	             },

	             error : function(jqxhr, status, error) {

	                alert("에러");

	             }

	          });
	      }

	   };
	   </script>
   
   <script>
   
   function selectSite1() {
	   var info4;
	   var info5;
	   $.ajax({ // 인사기초코드 조회
	         url : "${contextPath}/human/p0001/ISA_c.do",//목록을 조회 할 url
	         type : "POST",
	         dataType : "JSON",
	         success : function(data) {
	            for (var i = 0; i < data['Data'].length; i++) {
	               var code_ = data['Data'][i].fk_PERSON_BC_CODE_NUM;
	               
	               var option = "<option class='' value='" + data['Data'][i].pk_PERSON_BC_DETAI_CODE_NUM + "'>"
                + data['Data'][i].person_BC_DETAI_MNGEMENT_NAME
                + "</option>";
                
	               switch(code_){
	                  case 'EM': // 
	                	  $('#SiteList1').append(option);
	                     break;
	               }
	               
	            }
	           
	         },
	         error : function(jqxhr, status, error) {
	            alert("에러");
	         }
	      });
	   };
   
	   </script>


<body onload="LoadPage()">
<div id="wrapper">

        <div id="page-wrapper" style="margin: 0px;">
            <div class="row">
                <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-money fa-fw"></i> <s:message code="main.pay3"/></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
  <div class="main_content">
    <div class="exp_product">
     <div class="ib_function float_right">
         <a href="javascript:doAction('reload')" class="btn btn-outline btn-primary">초기화</a>
         <a href="javascript:doAction('search')" class="btn btn-outline btn-primary">조회</a>
         </div>
     </div>
      
   
         <br>      <br>
         
      
            <br>
       <form class="form-inline">
                     <div class="row">
                                <label for="yearday" class="pull-left">
                               &ensp;&ensp;    귀속연월 &ensp;
                                </label>
                         
                                  <input type="text" class="form-control" id="yearday" onchange="yeardayd()"> 
                             
                      
                     
                                 <label>
      &emsp; &emsp;&emsp;&ensp;&emsp;  &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;        지급일 &ensp;
                                </label>
                            <div class="input-group custom-search-form col-lg-3">
                                 <div class="input-group">
                                 <select id="yeardayd"  class="form-control">
                                       <option value="" id="yeardayd" selected>전체</option>
                                 </select>
                                
                                 </div>
                                        
                             </div>
                         </div>
                         </form>
      &emsp;&emsp;&ensp;
         <br>
        <form class="form-inline">
          <label for="SiteList1">은행코드</label>
          &ensp;<select name="SiteList1" id="SiteList1" class="form-control">
               <option value="" selected>전체</option>
                       
                           </select>
                         
       &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&emsp;
       
         <label for="SiteList">조회조건</label>
        &ensp;<select id="SiteList"   onchange="selectDept()" class="form-control" >
         <option value="" selected>전체</option>
      </select>   
       &emsp;&emsp;&ensp;&emsp;&emsp;&emsp;   
      
       <label for="DeptList">구분</label>
      &ensp; <select id="DeptList"  class="form-control">
         <option value="" selected>전체</option>
      </select>
            </form>
                 
             
             
         
             
             </div>
   




<br><br>
      <div class="clear hidden"></div>
      <!-- left단 사원리스트 -->
                <DIV class="ib_product" style="width:100%;float:left">
            <div style="height:100%;width:45%;float:left">
               <script type="text/javascript"> createIBSheet("mySheet", "200%", "100%"); selectSite(); selectSite1()</script>
            </div>
			
		</DIV>
        
        <!--right단 정보입력 및 수정단 -->
      
      
 </div>
 </div>
 
          
   
    <!--main_content-->

</body>
</html>