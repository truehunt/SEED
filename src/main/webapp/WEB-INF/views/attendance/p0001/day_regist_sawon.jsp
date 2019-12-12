<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일일 근태 등록</title>
<!----------------------------------------------------------------------------------------->
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/project9.js"></script>

<script language="javascript">
   //시트 높이 계산용
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
   function LoadPage() {
      mySheet.RemoveAll();
      //아이비시트 초기화
      var initSheet = {};
      initSheet.Cfg = {
         SearchMode : smLazyLoad,
         ToolTip : 1
      };
      initSheet.HeaderMode = {
         Sort : 1,
         ColMove : 1,
         ColResize : 1,
         HeaderCheck : 1
      };

      initSheet.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
      // MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
      // Align : data 정렬값.
      // keyfield : keyfield값 필수값 체크시 필요(미입력시 추가안됨.)
      // MultiLineText:1  : 하나의 셀에 여러값을 넣을수 있음(shift+enter)
      // Wrap:1 : 데이터
      {
         Header : "상태",
         Type : "Status",
         SaveName : "STATUS",
         MinWidth : 50
      }, {
         Header : "근무일자",
         Type : "Text",
         SaveName : "pk_DAILY_TA_WORKING_DATE",
         MinWidth : 100,
      }, {
         Header : "출근시각",
         Type : "Text",
         SaveName : "daily_TA_GO_TIME",
         MinWidth : 60
      }, {
         Header : "퇴근시각",
         Type : "Text",
         SaveName : "daily_TA_OFF_TIME",
         MinWidth : 60
      }, {
         Header : "근무시간",
         Type : "Text",
         SaveName : "daily_TA_WORK_TIME",
         MinWidth : 60
      }, {
         Header : "연장근로",
         Type : "Text",
         SaveName : "daily_TA_EXTEN_WORK",
         MinWidth : 60
      }, {
         Header : "지각시간",
         Type : "Text",
         SaveName : "daily_TA_LATE_TIME",
         MinWidth : 60
      }, {
         Header : "조퇴시간",
         Type : "Text",
         SaveName : "daily_TA_LEAVE_TIME",
         MinWidth : 60
      },{
          Header : "사원코드",
          Type : "Text",
          SaveName : "fk_DAILY_TA_SAWON_CODE",
          MinWidth : 60,
          Hidden :1
       },{
           Header : "비고",
           Type : "Text",
           SaveName : "num",
           MinWidth : 60,
           Hidden :1
        }  ];
      IBS_InitSheet(mySheet, initSheet);
      mySheet.SetEditable(false);
      mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분  (1: 수정가능  빈칸 : 수정불가)
      //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
      //doAction('search');
   }
   
   //------------------------------------------------------------------------------------
   /*Sheet 각종 처리*/
  function doAction(sAction) {
	  switch (sAction) {
      case "search": //조회
         var val = "PK_DAILY_TA_WORKING_DATE=" + document.getElementById("PK_DAILY_TA_WORKING_DATE").value
               + "&pk_SAWON_CODE=" + '<%=session.getAttribute("PK_SAWON_CODE")%>'
               + "&work =" + $('#work option:selected').val()
         mySheet.DoSearch("${contextPath}/attendance/p0001/searchList.do",val);
         break;

      //------------------------------------------------------------------------------------------------------------------------------   
      //조회조건 입력하면 자동으로 조회
      
      // 발령일자 및 제목
         function regist_sawon() {
            var val = "PK_DAILY_TA_WORKING_DATE=" + document.getElementById("PK_DAILY_TA_WORKING_DATE").value
            + "&pk_SAWON_CODE=" + '<%=session.getAttribute("PK_SAWON_CODE")%>'
            + "&work =" + $('#work option:selected').val()
            $.ajax({
               url : "searchList.do",//목록을 조회 할 url
                 type : "POST",
                 dataType : "JSON",
                 data : {bal_DIV : bal_DIV},
                 success : function(data) {
                    $('input[id=balDate]').val(data['Data'][0].bal_DATE);
                    $('input[id=balTitle]').val(data['Data'][0].bal_TITLE);
                 }, error : function(jqxhr, status, error) {
                    alert("에러");
               }
            });
         } 
      
      
      
      
      
      //출근
      case "gowork":
         //var select_row = mySheet.GetSelectRow();
         if(mySheet.GetCellValue(1,1) == -1 ){
             mySheet.DataInsert(-1);
             
             var Now = new Date();
             NowTime1 = Now.getHours();
             if (NowTime1 < 10) {
                NowTime1 = "0" + NowTime1;
             }
             NowTime2 = +Now.getMinutes();
             if (NowTime2 < 10) {
                NowTime2 = "0" + NowTime2;
             }
             var Time1 = NowTime1 + ":" + NowTime2; // ex) 
             var Time = NowTime1 - 9 + " :" + NowTime2;//지각시간
     
             mySheet.SetCellValue(1, 2, Time1);
             //======================================================================
             //지각시간
             if (NowTime1 >= 8 && NowTime1 <= 17) {
                mySheet.SetCellValue(1, 6, Time);//지각시간
                if (NowTime2 < 10) {
                   MowTime2 = "0" + NowTime2;
                }
             }
             
             var val2 = '<%=session.getAttribute("PK_SAWON_CODE")%>';
             mySheet.SetCellValue(1, 8, val2);
    			mySheet.SetCellValue(1, 1, getToday());
    			
         }else {
        	 alert("이미 출근하셨습니다");
         }
         break;
         
      case "save":
         mySheet.DoSave("${contextPath}/attendance/p0001/insertData.do");
         break;
      //----------------------------------------------------------------------------------------------------------------------------------

      case "gohome": //퇴근
         var select_row = mySheet.GetSelectRow();
         var Now = new Date();
         var NowTime3 = Now.getHours();
         if (NowTime3 < 10) {
            NowTime3 = "0" + NowTime3;
         }
         var NowTime4 = +Now.getMinutes();
         if (NowTime4 < 10) {
            NowTime4 = "0" + NowTime4;
         }
         var Time2 = NowTime3 + ":" + NowTime4;
         mySheet.SetCellValue(1, 3, Time2);
         
         //========================================================================
         //조퇴시간

         var Time2 = NowTime3 + ":" + NowTime4;
         var HTime = 18 - NowTime3;
         var MTime = 60 - NowTime4;
         if (NowTime4 > 0) {
            HTime = 17 - NowTime3;
            MTime = 60 - NowTime4;
            if (MTime < 10) {
               MTime = "0" + MTime;
            }
         }

         var Time = HTime + " : " + MTime;
         if (NowTime3 < 18) {
        	 mySheet.SetCellValue(1, 7, Time); //조퇴시간
         }
         //==========================================================================
         //연장근무
         var ExTime = NowTime3 - 18 + " : " + NowTime4;
         if (NowTime3 > 17) {
            mySheet.SetCellValue(1, 8, ExTime);
         }
         //============================================================================
		 var Get = mySheet.GetCellValue(1,2);
         var GetA = Get.split(':');
         var Hour = GetA[0];
         var Min = GetA[1];
         WorkTime1 = NowTime3 - Hour;//시간
         WorkTime2 = NowTime4 - Min;//분
         if (Min > NowTime4) {
        	 WorkTime1 =(NowTime3-1 -Hour)
             WorkTime2 = (NowTime4 + 60 - Min)
         } else {
             WorkTime1 = NowTime3 - Hour;//시간
             WorkTime2 = NowTime4 - Min;//분
         }
         var WorkTime = WorkTime1 + " : " + WorkTime2
         mySheet.SetCellValue(1, 4, WorkTime);//근무시간
         break;
      }
   }
   
 function getToday(){
             var now = new Date();
             var year = now.getFullYear();
             var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
             var date = now.getDate();

             if((month + "").length < 2){        //2자리가 아니면 0을 붙여줌.
                 month = "0" + month;
             }
             
             if((date + "").length < 2){        //2자리가 아니면 0을 붙여줌.
                 date = "0" + date;
             }
              // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.
             return today = ""+year+"-"+ month+"-" + date; 
             mySheet.SetCellValue(select_row, 1, today); //조퇴시간
         }
   

</script>
</head>
<body onload="LoadPage()">
	<div id="wrapper">

		<div id="page-wrapper" style="margin: 0px;">

			<!--tab 하단의 메인 타이틀(제목) 들어가는 부분 -->
			<div class="row">
				<div class="col-lg-12">
					<!-- 해당 메뉴의 아이콘 -->
					<!-- 해당 메인 타이틀(제목) 들어가는 부분 -->
					<h1 class="page-header">
						<i class="fa fa-user fa-fw"></i>
						<s:message code="main.dailyReg" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>

			<div class="main_content">
				 <label for="fromDate">근무일자</label> <input type='date'
					id="PK_DAILY_TA_WORKING_DATE" name="PK_DAILY_TA_WORKING_DATE" />
					선택조건
	
				<select id="work", id = "work">
					<option value="" selected="selected">선택</option>
					<option value="late">지각</option>
					<option value="early" >조퇴</option>
					<option value="long" >연장</option>
				</select>
				<!-------------------- 달력 -------------------------------->


				<div class="ib_function float">
					<a href="javascript:doAction('save')" class="f1_btn_gray lightgray"
						type="HH:MM" style="float: right;">저장</a><a
						href="javascript:doAction('search')" class="f1_btn_gray lightgray"
						style="float: right;">조회</a> <a
						href="javascript:doAction('gohome')" class="f1_btn_gray lightgray"
						style="float: right;">퇴근</a> <a
						href="javascript:doAction('gowork')" class="f1_btn_gray lightgray"
						type="HH:MM" style="float: right;">출근</a> <br> <br>

					<div class="exp_product"></div>
					<!-- 공간을 넓게 -->
					<div class="ib_product">
						<!-- 없으면 크기가 작아짐(3줄정도로 바뀜 -->
						<script>
							createIBSheet("mySheet", "100%", "100%");
						</script>
					</div>
					<!-- /#page-wrapper -->

				</div>
				<!-- /#wrapper -->
</body>
</html>

<!-- 오늘 날짜가 아니면 출근 날짜 못찍음 
if문 써서 text박스 안에 날짜가 NowDate != 이면 출근 퇴근 버튼 동작안하게 -->