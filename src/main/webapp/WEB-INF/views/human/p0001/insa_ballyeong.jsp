<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css">

<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
   function LoadPage() {
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1   };
      initData.Cols = [
      //{Header:"No",Type:"Seq", Align:"Center"},
         {Header:"NO",Type:"Seq", Align:"Center"},
         {Header:"발령호수",Type:"Text", SaveName:"chk", Width:50, Align:"Center",Edit:1,HeaderCheck:1},
         {Header:"제목", Type: "Text",SaveName:"productImage",Width:120,  Align: "Center",ImgWidth:60,ImgHeight:60},
		 {Header:"발령구분",Type:"Text",SaveName:"sPos",Width:60,Align:"Center"},
		 {Header:"발령일자",Type:"Text",SaveName:"sName",Width:60, Edit:0},
      ];
      IBS_InitSheet(mySheet,initData);
      mySheet.SetDataAutoTrim(0);

      
//      mySheet2.SetTheme("GMT","MainTree"); // 발령등록
      initData.Cols = [
         {Header:"부서/성명",Type:"Text", SaveName:"sName", Width:150, Align:"Left",TreeCol:1},
         {Header:"직급",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
         
      ];
      
      IBS_InitSheet(mySheet2,initData);
      mySheet2.SetRowBackColorI("#EDEDED");
      
      	//mySheet3 //대상자
      	initData.Cols = [
      		//체크박스 만들것
      		{Header:"사원코드",Type:"Text",SaveName:"Seq", Align:"Center"},
      		{Header:"사원명",Type:"Text", SaveName:"sName", Width:150, Align:"Left",TreeCol:1},
			{Header:"부서",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"직책",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
       	];
      
      	IBS_InitSheet(mySheet3,initData);
      	mySheet3.SetRowBackColorI("#EDEDED");

//      mySheet.SetSelectionMode(3);

   }


   function mySheet_OnDropEnd(FromSheet, FromRow, ToSheet, ToRow, X, Y, Type) {
      //같은 시트에서는 데이터이동 안됨.
      //if(FromSheet == ToSheet) return;
      
      var rowjson = FromSheet.GetRowData(FromRow);
      
      //행 데이터 복사
      ToSheet.SetRowData(ToRow+1 , rowjson ,{Add:1} );
      
      //원본 데이터 삭제
      if(ToRow<FromRow) FromRow++;
      FromSheet.RowDelete(FromRow);
      
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
   
   	function mySheet3_OnDropEnd(FromSheet, FromRow, ToSheet, ToRow, X, Y, Type) {
	      //같은 시트에서는 데이터이동 안됨.
	      //if(FromSheet == ToSheet) return;
	      
	      var rowjson = FromSheet.GetRowData(FromRow);
	      
	      //행 데이터 복사
	      ToSheet.SetRowData(ToRow+1 , rowjson ,{Add:1} );
	      
	      //원본 데이터 삭제
	      if(ToRow<FromRow) FromRow++;
	      FromSheet.RowDelete(FromRow);
	      
	   }
   
	var toggle = 1;
   	function mySheet_OnDragStart(row,col){
    	  if(toggle){
        	 if(row == 3) {
            
//            mySheet.SetRowDraggable(3,0);
//            setTimeout(function(){mySheet.SetRowDraggable(3,1);},100);
            	toggle=0;
         }
      }
      if(mySheet.CheckedRows("chk")>1)
      return "<div style='background-color:#FFFFFF;border:2px solid #666'> <h2>이동 중...<h2> </div>";
   }



   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
         case "search":
            mySheet.DoSearch("tree_move_data.json");
            mySheet2.DoSearch("tree_move_data2.json");
            break;
         case "reload":
            mySheet.RemoveAll();
            break;
         case "save":      
            mySheet.DoAllSave("save.jsp","str=1234");
            alerㄹt(str);
            break;
         case "insert":
            mySheet.DataInsert(); 
            break; 
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
   
   //tab기능_1
   function openTab(evt, tabName) { 
		var i, tabcontent, tablinks; tabcontent = document.getElementsByClassName("tabcontent"); // 컨텐츠를 불러옵니다.
		for (i = 0; i < tabcontent.length; i++) { 
			tabcontent[i].style.display = "none"; //컨텐츠를 모두 숨깁니다. 
		}
		
		tablinks = document.getElementsByClassName("tablinks"); //탭을 불러옵니다.
		
		for (i = 0; i < tablinks.length; i++) { 
			tablinks[i].className = tablinks[i].className.replace(" active", ""); //탭을 초기화시킵니다. 
		}
		
		document.getElementById(tabName).style.display = "block"; //해당되는 컨텐츠만 보여줍니다.
		evt.currentTarget.className += " active"; //클릭한 탭을 활성화시킵니다. 
	}
   
 	//tab기능_2
	function openTab2(evt, tabName) { 
		var i, tabcontent, tablinks; tabcontent = document.getElementsByClassName("tabcontent2"); // 컨텐츠를 불러옵니다.
		
		for (i = 0; i < tabcontent.length; i++) { 
			tabcontent[i].style.display = "none"; //컨텐츠를 모두 숨깁니다. 
		} 
		
		tablinks = document.getElementsByClassName("tablinks"); //탭을 불러옵니다.
		
		for (i = 0; i < tablinks.length; i++) { 
			tablinks[i].className = tablinks[i].className.replace(" active", ""); //탭을 초기화시킵니다. 
		}
		
		document.getElementById(tabName).style.display = "block"; //해당되는 컨텐츠만 보여줍니다.
		evt.currentTarget.className += " active"; //클릭한 탭을 활성화시킵니다. 
	}

   
</script>

<body onload="LoadPage()">
  <div class="page_title">
    <span><a class="closeDepth" href="#">closeDepth</a></span> 
    <span class="title">인사관리> <b>인사기록카드</b></span>
  </div>
  <div class="main_content">
  		<!-- 검색 -->
    	<div class="exp_product">
      		<form name='frm'>
        		사원명: <input type='text' id="p_id" name="p_id" /> 
			</form>
		</div>
		
		<!-- 버튼 -->
		<div class="ib_function float_right">
			<a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
			<a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
			<a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
			<a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
		</div>

		<div class="clear hidden"></div>
		
		<div class="ib_product" style="width:100%;float:left">
			<!-- left -->
			<div style="height:100%;width:45%;float:left">
				<script>createIBSheet("mySheet", "100%", "100%");</script>
			</div>
			
			<!-- 좌우를 나누는 빈공간 -->
			<div style="height:100%;width:5%;float:left"></div>
			
			<!-- right -->
			<div style="height:100%;width:45%;float:left">
				<!-- 위 -->
				<!-- tab기능_1 -->
				<div class="tab_1">
					<button class="tablinks active" onclick="openTab(event, 'tab1')">발령자</button> <!-- 처음 보여줄 탭 -->
				</div>
				
				<div id="tab1" class="tabcontent" style="height:100%; display: block;">
					<script type="text/javascript"> createIBSheet("mySheet2", "100%", "100%"); </script>
				</div>
				
				<!-- 위아래를 나누는 빈공간 -->
            	<div style="height:5%"></div>
            	
            	<!-- 아래 -->
            	<!-- tab기능_2 -->
				<div class="tab_2">
					<button class="tablinks active" onclick="openTab2(event, 'tab2')">대상자</button>
				</div>
				<div id="tab2" class="tabcontent2" style="height:45%; display: block;"> 
					<script type="text/javascript"> createIBSheet("mySheet3", "100%", "100%"); </script> 
				</div>
			</div>
		</div>
        
       <!-- file:///C:/Users/bit/Desktop/인사발령/ibsheet7_sample/sheet/index.jsp?pageindex=1 -->
       <!-- 동시저장 방식을 소개하고 있으니 확인할 것! -->
	</DIV>
    <!--main_content-->

</body>
</html>