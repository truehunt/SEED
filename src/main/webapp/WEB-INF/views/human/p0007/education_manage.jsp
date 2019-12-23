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

   .table{
    max-width: 200px;
    margin-left: 500px;
    margin-top: -171px;
    margin-bottom: 50px;
    margin-right: -500px;
    border: 2px solid #81BEF7;
    width: 200px;
    height: 400px;
    align: right;
     }
    .th,td{
    border: 1px solid #81BEF7;
    border-width: 50%;
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
   }
   .content {
        margin-left:400px;
        margin-top:-600px;
        float: right;
        width: 500px;
        height: 600px;
   }
   .main_content{
      width: 510px;
   }
   .main_menu {
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

		 var initdata = {};
	      initdata.Cfg = {SearchMode:smLazyLoad,ToolTip:1};
	      initdata.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
	      initdata.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
	         // MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
	         // Align : data 정렬값.
	         // keyfield : keyfield값 필수값 체크시 필요(미입력시 추가안됨.)
	         // MultiLineText:1  : 하나의 셀에 여러값을 넣을수 있음(shift+enter)
	         // Wrap:1 : 데이터
	         // FORMAT 형식 법인/사업자 등록번호 - Format:["IdNo", "SaupNo"], 전화번호/FAX번호 - Format: "PhoneNo", 
	         
	         {Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
	         {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50, Align:"Center"},
	         {Header:"교육코드",Type:"Text",SaveName:"pk_EDUCATION_MANA_CODE",MinWidth:100, Align:"Center"},
	         {Header:"교육명",Type:"Text",SaveName:"education_MANA_NAME",MinWidth:250, Align:"Center"},         
	         {Header:"시작일",Type:"Text",SaveName:"education_MANA_STA",MinWidth:110, Align:"Center", Hidden:1},
	         {Header:"종료일",Type:"Text",SaveName:"education_MANA_END",MinWidth:110, Align:"Center", Hidden:1},
	         
	         
	         
	         {Header:"교육일수",Type:"Text",SaveName:"education_MANA_DAYS",MinWidth:100, Hidden:1},
	         {Header:"교육목적",Type:"Text",SaveName:"education_MANA_PUR",MinWidth:300, Hidden:1},
	         {Header:"교육장소",Type:"Text",SaveName:"education_MANA_LOCA",MinWidth:80, KeyField:1, Hidden:1},
	         {Header:"담당강사",Type:"Text",SaveName:"education_MANA_TEA",MinWidth:60, Hidden:1},
	         {Header:"교육기관",Type:"Text",SaveName:"education_MANA_AGENCY",MinWidth:150, KeyField:1, Hidden:1},
	         {Header:"교육시간",Type:"Text",SaveName:"education_MANA_TIMES",MinWidth:100, Hidden:1}
	         
	         //{Header:"회사코드(com)",Type:"Text",SaveName:"pk_company_code",MinWidth:80, Hidden:1},
	         
	         
	      ];  
		IBS_InitSheet(mySheet,initdata);
		mySheet.prevElement = "HoBong";
		mySheet.nextElement = "mySheet2";
		
		
		
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
      
            
            mySheet.DoSearch("${contextPath}/human/p0007/searchList.do");
            
            //콤보박스에 값 불러오기 -> 행 추가(입력) 및 append 중복 추가 방지
            $('#pk_EDUCATION_MANA_CODE').html("   ");
            
            break;
         case "reload": //초기화
            mySheet.RemoveAll();
            break;
         case "save": // 저장
            //현재는 테스트 하는 겸 해서 놔두지만 나중에는 주석 처리 해야됨 
            //save 를 하면서 중복 처리 됨 
            var tempStr = mySheet.GetSaveString();
            mySheet.SetCellValue(t_row, 'education_MANA_DAYS' , $('#education_MANA_DAYS').val());
            
            tempStr += alert("서버로 전달되는 문자열 확인 :"+tempStr);
            mySheet.DoSave("${contextPath}/human/p0007/insertData.do");
            break;
         case "insert": //신규행 추가
            var row = mySheet.DataInsert();
         
            //콤보박스에 값 불러오기 -> 행 추가후 실행
            $('#pk_EDUCATION_MANA_CODE').html("   ");
            
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
      
      
      
      
      
      
      function call()
      {
          var sdd = document.getElementById("education_MANA_STA").value;
          var edd = document.getElementById("education_MANA_END").value;
          var ar1 = sdd.split('-');
          var ar2 = edd.split('-');
          var da1 = new Date(ar1[0], ar1[1], ar1[2]);
          var da2 = new Date(ar2[0], ar2[1], ar2[2]);
          var dif = da2 - da1;
          var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
          var cMonth = cDay * 30;// 월 만듬
          var cYear = cMonth * 12; // 년 만듬
       if(sdd && edd){
          document.getElementById("education_MANA_DAYS").value = parseInt(dif/cDay)
       }
      }

      
      
      
      </script>




<body onLoad="LoadPage()">

   <div id="wrapper">

        <div id="page-wrapper" style="margin: 0px; ">
      
      <div class="nav" style="width:100%; overflow:hidden;">
           <div class="main_content"  style="width:1300px;">
                <div class="ib_function float_right">
                 <a href="javascript:doAction('reload')" class="btn btn-outline btn-primary">초기화</a>
                 <a href="javascript:doAction('insert')" class="btn btn-outline btn-primary">추가</a>
                 <a href="javascript:doAction('search')" class="btn btn-outline btn-primary">조회</a>
                 <a href="javascript:doAction('save')" class="btn btn-outline btn-primary">저장</a>
               </div>
               
             <br><br><br>

 
     <div class="ib_product">
     <!-- content (오른쪽 layout시작)  -->
       
        <script type="text/javascript"> createIBSheet("mySheet", "150%", "calc(50% - 3px)"); </script>
       
       
     <table id="table" class="table" style="width: 620px;"  > 



     	<tr>
     		<td ><span class="title" style="font-size:15px; height:15px"><b>기본등록사항</b></span></td>
     	</tr>
     	
     	<tr>
     	<td  align="left">
     	 시작일 : <input type="text" name="education_MANA_STA" id="education_MANA_STA" onchange="call()">   ~   
           종료일 : <input type="text" name="education_MANA_END" id="education_MANA_END"onchange="call()"> <p></p>
     	</tr>
     	
     	
        <tr>
           <td align="left"> 교육일수 :
            <input type="text" name="education_MANA_DAYS" id="education_MANA_DAYS" size="30px" > 
            </td>
              
        </tr>
        <tr>
           <td align="left">교육목적 :  
           <input type="text" name="education_MANA_PUR" id="education_MANA_PUR" size="50px" > 
           </td>
             
        </tr>
        <tr>
           <td  align="left">교육장소 :
           <input type="text" name=education_MANA_LOCA id="education_MANA_LOCA" size="25px"> 
            </td>
               
        </tr>
        <tr>
           <td  align="left">담당강사 :
           <input type="text" name="education_MANA_TEA" id="education_MANA_TEA" size="25px" >
            </td>
               
        </tr>
        <tr>
           <td  align="left">교육기관 :
            <input type="text" name="education_MANA_AGENCY" id="education_MANA_AGENCY" size="50px" >
             </td>
              
        </tr>
        <tr>
           <td  align="left">교육시간 :
            <input type="text" name="education_MANA_TIMES" id="education_MANA_TIMES" size="50px" >
             </td>
            
        </tr>

       
        
     </table>
     
     

										
       
   
  
     

  </div>


</div>



		
      
      </div>
      <!--main_content-->
      </div>
      </div>

</body>
</html>
