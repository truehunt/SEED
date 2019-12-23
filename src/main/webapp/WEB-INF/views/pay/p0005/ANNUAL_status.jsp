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

      
      
    	var cfg = {FrozenCol:6,MergeSheet:msHeaderOnly };  
        mySheet.SetConfig(cfg); 
        
        var header = [
            {Text:"사원코드|이름|부서|직책|지급내역|지급내역",Align:"Center"},
            {Text:"사원코드|이름|부서|직책|지급항목|지급액",Align:"Center"}
            ];  
         var info = {Sort:0,ColMove:1,ColResize:1};  
         mySheet.InitHeaders(header,info);  
         
         var cols = [   
        	 {Header:"사원코드",Type:"Text",SaveName:"pk_SAWON_CODE",Width:180,Align:"Center", Edit:0},
        	 {Header:"이름",Type:"Text",SaveName:"sawon_NAME",Width:180,Align:"Center", Edit:0},
        	 {Header:"부서",Type:"Text",SaveName:"fk_DEPT_NAME",Width:140,Align:"Center", Edit:0},
        	 {Header:"직책",Type:"Text",SaveName:"rank_NAME",Width:160,Align:"Center", Edit:0},
             {Header:"구분",Type:"Text",SaveName:"salary_CAL_SALARY_ITEM",Width:210,Align:"Center", Edit:0},
             {Header:"지급액",Type:"AutoSum", RowSpan:1,SaveName:"salary_CAL_MONEY",Width:215, Edit:0,Format:"#,### 원"},         

      
            ]; 
        mySheet.InitColumns(cols); 
        mySheet.SetSumValue(0, "합  계");
        

        selectSite();
      }




   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
      case "search": //조회
  
    	  
      if($("#SiteList").val() == "1"){
    	var param = "salary_CAL_PAYMENTDAY=" + document.getElementById("yearday").value  +"&FK_SAWON_WORKPLACE_CODE=" + $("#SiteList").val() + "&PK_WORKPLACE_CODE=" + document.getElementById("DeptList").value;      
}else if($("#SiteList").val() == "2"){
    	 var param = "salary_CAL_PAYMENTDAY=" + document.getElementById("yearday").value  +"&FK_SAWON_WORKPLACE_CODE=" + $("#SiteList").val() + "&FK_DEPT_CODE=" + document.getElementById("DeptList").value;
    	 }
      
    
      
      
      
          console.log(param);
         mySheet.DoSearch("${contextPath}/pay/ANNUAL_status/searchList.do", param);
         
         //mySheet.DoSearch("transaction_data2.json");
         break;
      case "reload": //초기화
         mySheet.RemoveAll();
      
         break;
      case "save": // 저장
         //var tempStr = mySheet.GetSaveString();
         //alert("서버로 전달되는 문자열 확인 :"+tempStr);
         mySheet.DoSave("${contextPath}/pay/ANNUAL_status/saveData.do");
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
    	  sRow = Row;
      
         for(var i = 1; i<=mySheet.RowCount(); i++ ){
            mySheet.CellComboItem(i,4,PY); // 관계
            pk_SAWON_CODE = mySheet.GetCellValue(sRow, 'pk_SAWON_CODE');  // 사원코드
			salary_CAL_PAYMENTDAY = mySheet.GetCellValue(sRow, 'salary_CAL_PAYMENTDAY');  // 자급알자
         }
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
   
   
   
   
   
   
   





   $(function(){   
      var cal = {
            closeText : "닫기",
            //prevText : "이전달",
            //nextText : "다음달",
            currentText : "오늘",
            changeMonth: false, // 월을 바꿀 수 있는 셀렉트 박스
            changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스
            //monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            //monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",   "9월", "10월", "11월", "12월" ],
            //dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
            //dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
            //dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
            //weekHeader : "주",
            firstDay : 0,
            isRTL : false,
            showMonthAfterYear : true, // 연,월,일 순으로
            yearSuffix : '',
            
            showOn: 'both', // 텍스트와 버튼을 함께 보여준다
            buttonImage:'https://www.shareicon.net/data/27x27/2016/08/13/808501_calendar_512x512.png', //날짜 버튼 이미지
            buttonImageOnly: true,
            
            showButtonPanel: true
      };
        cal.closeText = "선택";
          cal.dateFormat = "yy";
          cal.onClose = function (dateText, inst) {
              //var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
              var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
              $(this).datepicker( "option", "defaultDate", new Date(year, 1) );
              $(this).datepicker('setDate', new Date(year, 1));
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

      </script>



<body onload="LoadPage()">
 <!-- 달력 datepicker  -->
   
<div id="wrapper">

        <div id="page-wrapper" style="margin: 0px;">
            <div class="row">
                <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-money fa-fw"></i> <s:message code="main.pay5"/></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

  <div class="main_content" style="padding-left: 0px; padding:0px;">
    <div class="ib_function float_right" style="padding:10 20">
         <a href="javascript:doAction('reload')" class="btn btn-outline btn-primary">초기화</a>
         <a href="javascript:doAction('search')" class="btn btn-outline btn-primary">조회</a>
   
   </div>
        
         <br>      <br>
         
         
         
            <br>
  <div class="ib_function border_sheet"  style="width: 1087px; height: 42px;">
     <div class="form-group">
    <form class="form-inline">
               <table class="ib_basic">

				   <tr>
				        <td width="170"></td>
						<td> <label for="yearday">연도</label></td>
						<td>    
			<div class="input-group">
                    <div class="input-group-append">
                     <input type="button" style="width:90px;" class="form-control" id="yearday" onchange="yeardayd()"> 
                  </div>
           </div>
                        </td>
			
			            <td width="170"></td> 
						<td> <label for="SiteList"  class="pull-left">조회조건 </label></td>
						<td><select id="SiteList"   onchange="selectDept()" class="form-control" >
                              <option value="" selected>전체</option>
                            </select>  
                       </td>
                       
                  
                     <td width="170"></td>
					 <td><label  for="DeptList">구분</label></td>
                     <td><select id="DeptList"  class="form-control">
                           <option value="" selected>전체</option>
                         </select>
                     </td>
					
					</tr>
				  
               </table> 
             </form>
            </div>
          
             
           </div>

 </div>



  
     <div class="clear hidden"></div>
      <!-- left단 사원리스트 -->
              <DIV class="ib_product" style="width:100%;float:left">
            <div style="height:100%;width:100%;float:left">
               <script type="text/javascript"> createIBSheet("mySheet", "100%", "100%"); </script>
            </div>
         
            
         
         </div>
     
     

        
        <!--right단 정보입력 및 수정단 -->
      
       </div>
    </div>
 
          
   
    <!--main_content-->

</body>
</html>