<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

<script type="text/javascript" src="${contextPath}/resources/ibsheet/ibtab.js"></script>
<script type="text/javascript" src="${contextPath}/resources/ibsheet/ibtabinfo.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/ibtab-style.min.css">

<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
   function LoadPage() {
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1   };
      initData.Cols = [
      //{Header:"No",Type:"Seq", Align:"Center"},
         {Header:"NO",Type:"Seq", Align:"Center"},
         {Header:"",Type:"DummyCheck", SaveName:"chk", Width:35, Align:"Center",Edit:1,HeaderCheck:1},
         //{Header: "이미지", Type: "Image",SaveName:"productImage",Width:100,  Align: "Center",ImgWidth:60,ImgHeight:20},
		 {Header:"사원코드",Type:"Text",SaveName:"pk_SAWON_CODE",Width:60,Align:"Center"},
		 {Header:"사원명",Type:"Text",SaveName:"sawon_NAME",Width:50, Edit:0},
      ];
      IBS_InitSheet(mySheet,initData);
      mySheet.SetDataAutoTrim(0);
      doAction("list");
     
//      mySheet2.SetTheme("GMT","MainTree");
      /* initData.Cols = [
         {Header:"부서/성명",Type:"Text", SaveName:"sName", Width:150, Align:"Left",TreeCol:1},
         {Header:"직급",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
         
      ];
      
      IBS_InitSheet(mySheet2,initData);
      mySheet2.SetRowBackColorI("#EDEDED"); */
      
      	//mySheet3 //병역
      	initData.Cols = [
      		{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
      		{Header:"부서/성명",Type:"Text", SaveName:"sName", Width:150, Align:"Left",TreeCol:1},
			{Header:"직급",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
       	];
      
      	IBS_InitSheet(mySheet3,initData);
      	mySheet3.SetRowBackColorI("#EDEDED");

   		//mySheet4 //가족
		initData.Cols = [
			{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
			{Header:"성명",Type:"Text", SaveName:"sName", Width:150, Align:"Left",TreeCol:1},
          	{Header:"관계",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"동거여부",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"주민등록번호",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"수당여부",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"장애인구분",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"내외국인",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"생년월일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"양음구분",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"학력",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"졸업구분",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"직업",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"직장명",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
          	{Header:"직위",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
       	];
       
       	IBS_InitSheet(mySheet4,initData);
       	mySheet4.SetRowBackColorI("#EDEDED");
       	
		//mySheet5 //학력
       	initData.Cols = [
       		{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
            {Header:"학교명",Type:"Text", SaveName:"sName", Width:150, Align:"Left",TreeCol:1},
            {Header:"입학일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"졸업일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"구분",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"소재지",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"전공과목",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"부전공",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"학위구분",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"주야",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"본교",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
        ];
	
        IBS_InitSheet(mySheet5,initData);
        mySheet5.SetRowBackColorI("#EDEDED");
        
		//mySheet6 //경력
        initData.Cols = [
        	{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
            {Header:"직장명",Type:"Text", SaveName:"sName", Width:150, Align:"Left",TreeCol:1},
            {Header:"입사일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"퇴사일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"근무년한",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"담당업무",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"직위",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"급여",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"퇴직사유",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"근속기",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
        ];
         
		IBS_InitSheet(mySheet6,initData);
        mySheet6.SetRowBackColorI("#EDEDED");
        
		//mySheet7 //면허/자격
        initData.Cols = [
        	{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
            {Header:"자격종류",Type:"Text", SaveName:"sName", Width:150, Align:"Left",TreeCol:1},
            {Header:"취득일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"만료일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"자격증번호",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"발행기관",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
            {Header:"수당",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
        ];
          
		IBS_InitSheet(mySheet7,initData);
		mySheet7.SetRowBackColorI("#EDEDED");
		
		//mySheet8 //인사발령
		initData.Cols = [
			{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
			{Header:"발령호수",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"발령일자",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"제목",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"발령구분",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"발령내역",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"발령전정보",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"현정보",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"발령후정보",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"비고",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
		];
           
		IBS_InitSheet(mySheet8,initData);
		mySheet8.SetRowBackColorI("#EDEDED");
        
		//mySheet9 //인사고과
		initData.Cols = [
			{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
			{Header:"고과명",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"평가시작일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"평가종료일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"고과일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"고과자",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"반영률",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"점수",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"등급",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"비고",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
		];
           
		IBS_InitSheet(mySheet9,initData);
		mySheet9.SetRowBackColorI("#EDEDED");
		
		//mySheet10 //출장
		initData.Cols = [
			{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
			{Header:"출장국가",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"출장지",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"시작일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"종료일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"항공료",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"본인부담",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"회사부담",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"기타비용",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"총비용",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"목적",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
		];
           
		IBS_InitSheet(mySheet10,initData);
		mySheet10.SetRowBackColorI("#EDEDED");
		
		//mySheet11 //상벌관리
		initData.Cols = [
			{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
			{Header:"구분",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"포상/징계명",Type:"Text", SaveName:"sPos", Width:100, Align:"Center",Edit:0},
			{Header:"포상/징계일",Type:"Text", SaveName:"sPos", Width:100, Align:"Center",Edit:0},
			{Header:"포상/징계내역",Type:"Text", SaveName:"sPos", Width:100, Align:"Center",Edit:0},
			{Header:"시행처",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"금액",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
			{Header:"징계시작일",Type:"Text", SaveName:"sPos", Width:100, Align:"Center",Edit:0},
			{Header:"징계종료일",Type:"Text", SaveName:"sPos", Width:100, Align:"Center",Edit:0},
			{Header:"비고",Type:"Text", SaveName:"sPos", Width:60, Align:"Center",Edit:0},
		];
           
		IBS_InitSheet(mySheet11,initData);
		mySheet11.SetRowBackColorI("#EDEDED");
		
		PageLoad()
   }

   // ibtab
   function PageLoad(){
		var tabBar = document.getElementById("tab1"),
		contents = document.getElementById("tab_contents");
		createIBTab(tabBar,contents,"myTabs",{
			widthTabBar: "100%",
			widthContents:"100%",
			heightContents:"300px",
			allowCloseBTN: false
	    });
		
		var tabBar2 = document.getElementById("tab2"),
		contents2 = document.getElementById("tab_contents_2");
		createIBTab(tabBar2,contents2,"myTabs",{
			widthTabBar: "100%",
			widthContents:"100%",
			heightContents:"300px",
			allowCloseBTN: false
	    }); 
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
         //case "save":
        	//var param = 
            //mySheet.DoSave("${pageContext.request.contextPath}/human/p0001/upload.do");
           // break;
         case "insert":
            mySheet.DataInsert(); 
            break; 
         case "list":
             mySheet.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA.do");
        	 break;
         
      }
   }
   
   
   /* 
   function mySheet_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) {     //더블 클릭했을 때, 선택행의 값을 전달 어미 창으로 전달. 
		var selectRowJson = mySheet.GetRowData(Row);
   		parent.GetData(selectRowJson);
   		self.close();
   		return false; //창을 닫는 경우에는 false를 리턴해 줘야 함.
   } 
    */ 
/* 	function fnAppendLog(msg) {
		var evt_log = document.getElementById("evt_log");
		evt_log.value = msg + "\n" + evt_log.value;
	} 
	
	// 기타 이벤트 //마우스 더블클릭시
	function mySheet_OnDblClick(row,col) {
		var msg = "";
		if(col == 2){
			msg += "[" + mySheet.GetCellValue(row,col)+   "] ";
			console.log(mySheet.GetCellValue(row,col));
			mySheet.SetCellImage(3,2,"../../resources/image/bu_file_add.jpg");
			upload_flie();
			fnAppendLog(msg);
		}
	}  */
	function upload_flie(){
		    $('input[type=file]').click();
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
			<!-- left 사원리스트 -->
			<div style="height:100%;width:45%;float:left">
				<form name="image">
					<table class="tb01" style="width:25%; height:50%">
						<tr>
							<td class="bg02_c"">
								<img id="thumbnail" src="" width="100" height="100">
								<input type="file" id="file" name="file" accept="image/*" style="visibility: hidden" />
								<img id="iim" src="../../resources/image/bu_file_add.jpg" onclick="upload_flie()" />
							</td>
						</tr>
					</table>
				</form>
				<br><br>
				<script>createIBSheet("mySheet", "100%", "100%");</script>
			</div>
			
			<!-- right -->
			<div style="height:100%;width:45%;float:left">
				<div id="tab1" class="ib-tab-tab">
					<div class="ib-tab-tabs-item">
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">채용/거주</span></a> 
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">병역</span></a> 
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">가족</span></a>
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">학력</span></a>
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">경력</span></a>
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">면허/자격</span></a>
					</div>
				</div>
				
				<div id="tab_contents" class="ib-tab-contents" ><!-- style="height:100%; display: block; overflow: auto" -->
					<div class="ib-tab-contents__item">
						<table class="tb01" style="width: 100%; min-width:400px">
							<colgroup>
								<col style="width: 12%;"></col>
								<col style="width: 22%;"></col>
								<col style="width: 11%;"></col>
								<col style="width: 22%;"></col>
								<col style="width: 11%;"></col>
								<col style="width: 22%;"></col>
							</colgroup>
							<tr>
								<td class="bg01_r">한자이름</td>
								<td class="bg02_l"><input type="text" id="sawon_code" style="width: 98%; "></td>
								<td class="bg01_r">채용구분</td>
								<td class="bg02_l">
									<textarea style=
										"border: none;
										 width: 100%;
										 -webkit-box-sizing: border-box;
										 -moz-box-sizing: border-box;
										 box-sizing: border-box;
										 resize: none;">
									</textarea>
								</td>
								<td class="bg01_r">기수</td>
								<td class="bg02_l"></td>
							</tr>
							<tr>
								<td class="bg01_r">현주소</td>
								<td class="bg02_l" colspan="5">개발팀</td>
							</tr>
							<tr>
								<td class="bg01_r">등록기준지</td>
								<td class="bg02_l" colspan="5">과장</td>
							</tr>
							<tr>
								<td class="bg01_r">결혼여부</td>
								<td class="bg02_l">1996-02-23</td>
								<td class="bg01_r">주거구분</td>
								<td class="bg02_l"></td>
								<td class="bg01_r">생활수준</td>
								<td class="bg02_l"></td>
							</tr>

							<tr>
								<td class="bg01_r">부동산</td>
								<td class="bg02_l">비정규직</td>
								<td class="bg01_r">주거구분</td>
								<td class="bg02_l">010-7511-4581</td>
								<td class="bg01_r">생활수준</td>
								<td class="bg02_l">010-7511-4581</td>
							</tr>
							
							<tr>
								<td class="bg01_r">건평</td>
								<td class="bg02_l">비정규직</td>
								<td class="bg01_r">대지</td>
								<td class="bg02_l">010-7511-4581</td>
							</tr>
							
							<tr>
								<td class="bg01_r">종교</td>
								<td colspan="5" class="bg02_l" id="EMP_ADDRESS">서울시 강남구
									압구정동 한양 아파트 2동 909호</td>
							</tr>
							
							<tr>
								<td class="bg01_r">취미</td>
								<td colspan="5" class="bg02_l" id="EMP_ADDRESS">서울시 강남구
									압구정동 한양 아파트 2동 909호</td>
							</tr>
							
							<tr>
								<td class="bg01_r">특기</td>
								<td colspan="5" class="bg02_l" id="EMP_ADDRESS">서울시 강남구
									압구정동 한양 아파트 2동 909호</td>
							</tr>
						</table>
					</div>
					<div class="ib-tab-contents__item">
						<script type="text/javascript">
							createIBSheet("mySheet3", "100%", "100%");
						</script>
					</div>
					<div class="ib-tab-contents__item">
						<script type="text/javascript">
							createIBSheet("mySheet4", "100%", "100%");
						</script>
					</div>
					<div class="ib-tab-contents__item">
						<script type="text/javascript">
							createIBSheet("mySheet5", "100%", "100%");
						</script>
					</div>
					<div class="ib-tab-contents__item">
						<script type="text/javascript">
							createIBSheet("mySheet6", "100%", "100%");
						</script>
					</div>
					<div class="ib-tab-contents__item">
						<script type="text/javascript">
							createIBSheet("mySheet7", "100%", "100%");
						</script>
					</div>

				</div>
				
            	<div style="height:5%"></div>
            	
            	<!-- 아래 tab기능_2 -->
				<div id="tab2" class="ib-tab-tabs">
					<div class="ib-tab-tabs-item">
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">인사발령</span></a>
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">인사고과</span></a>
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">출장</span></a>
						<a class="ib-tab-tabs-item__link"> <span class="ib-tab-tabs-item__title">상벌관리</span></a>
					</div>
				</div>
				
				<div id="tab_contents_2" class="ib-tab-contents">
					<div class="ib-tab-contents__item"> 
						<script type="text/javascript"> createIBSheet("mySheet8", "100%", "100%");</script> 
					</div>
					
					<div class="ib-tab-contents__item"> 
						<script type="text/javascript"> createIBSheet("mySheet9", "100%", "100%"); </script> 
					</div>
					
					<div class="ib-tab-contents__item"> 
						<script type="text/javascript"> createIBSheet("mySheet10", "100%", "100%"); </script> 
					</div>
					
					<div class="ib-tab-contents__item">
						<script type="text/javascript"> createIBSheet("mySheet11", "100%", "100%"); </script> 
					</div>
				</div>
				
			</div>
		</div>
        
       <!-- file:///C:/Users/bit/Desktop/인사발령/ibsheet7_sample/sheet/index.jsp?pageindex=1 -->
       <!-- 동시저장 방식을 소개하고 있으니 확인할 것! -->
       <!-- ---------------------- 로그 나오는부분 ------------------------->
		
		<!-- 
				<div class="w50pro" style="height:100%">
					<div  style=";height:100%">
						<textarea id="evt_log" cols="40" style="width:100%;height:99%;border:1px solid #888888;"></textarea>
					</div>
				</div>  -->
        
	</DIV>
    <!--main_content-->

</body>
<script>
	var file = document.querySelector('#file');

	file.onchange = function() {
		var fileList = file.files;
		// 읽기
		var reader = new FileReader();
		reader.readAsDataURL(fileList[0]);

		//로드 한 후
		reader.onload = function() {
			//로컬 이미지를 보여주기
			//document.querySelector('#preview').src = reader.result;

			//썸네일 이미지 생성
			var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
			tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
			tempImage.onload = function() {
				//리사이즈를 위해 캔버스 객체 생성
				var canvas = document.createElement('canvas');
				var canvasContext = canvas.getContext("2d");

				//캔버스 크기 설정
				canvas.width = 100; //가로 100px
				canvas.height = 100; //세로 100px

				//이미지를 캔버스에 그리기
				canvasContext.drawImage(this, 0, 0, 100, 100);
				//캔버스에 그린 이미지를 다시 data-uri 형태로 변환
				var dataURI = canvas.toDataURL("image/jpeg");

				//썸네일 이미지 보여주기
				document.querySelector('#thumbnail').src = dataURI;
				console.log(dataURI);
				//썸네일 이미지를 다운로드할 수 있도록 링크 설정
				//document.querySelector('#download').href = dataURI;
				
			};
		};
	};
</script>

</html>