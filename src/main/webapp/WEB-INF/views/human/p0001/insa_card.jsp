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
<link rel="stylesheet" href="${contextPath}/resources/css/ibtab-style.min.css">

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script type="text/javascript" src="${contextPath}/resources/ibsheet/ibtab.js"></script>
<script type="text/javascript" src="${contextPath}/resources/ibsheet/ibtabinfo.js"></script>


<!-- 우편번호 관련된 script 추가 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<!-- popup관련 -->
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>    

<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>


<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
   	function LoadPage() {
	   //ibtab 생성
		createIBTab($('#tab1')[0], $('#tab_contents')[0], 'myTabs', {
			themes: {
				tabs: "simple_under_blue",
		       	contents: "simple_under_blue",
		       	contextMenu: "simple_under_blue"
		    },
			allowCloseBTN: false
		});
		
		//ibtab2 생성
		createIBTab($('#tab2')[0], $('#tab_contents_2')[0], 'myTabs', {
		    themes: {
		        tabs: "simple_under_blue",
		        contents: "simple_under_blue",
		        contextMenu: "simple_under_blue"
		    },
		    allowCloseBTN: false
		});
		 
		 
		var initData = {};
      	initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1,SearchSync:1};
      	initData.Cols = [
      	//{Header:"No",Type:"Seq", Align:"Center"},
         	{Header:"NO",Type:"Seq", Align:"Center"},
         	{Header:"",Type:"DummyCheck", SaveName:"chk", Width:35, Align:"Center",Edit:1,HeaderCheck:1},
         	//{Header: "이미지", Type: "Image",SaveName:"productImage",Width:100,  Align: "Center",ImgWidth:60,ImgHeight:20},
		 	{Header:"사원코드",Type:"Text",SaveName:"pk_SAWON_CODE",Width:60,Align:"Center"},
		 	{Header:"사원명",Type:"Text",SaveName:"sawon_NAME",Width:50, Edit:0}
      	];
      	IBS_InitSheet(mySheet,initData);
      	mySheet.SetDataAutoTrim(0);
      	doAction("list");
		
   		//mySheet4 //가족
		initData.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
			{Header:"NO",Type:"Seq", Align:"Center"},
			{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50},
			{Header:"", Type:"Text", SaveName:"pk_FAM_CODE", Align:"Center"},
			{Header:"성명",Type:"Text", SaveName:"fam_NAME", Width:100, Align:"Left", Align:"Center"},
          	{Header:"관계",Type:"Combo", SaveName:"fam_RELATIONS", Width:60, Align:"Center"},
          	{Header:"동거여부",Type:"Combo", SaveName:"fam_LIVE", Width:60, Align:"Center"},
          	{Header:"주민등록번호",Type:"Text", SaveName:"fam_RES_NUM", Format:"########******", Width:120, Align:"Center"},
          	{Header:"수당여부",Type:"Combo", SaveName:"fam_SUDANG", Width:60, Align:"Center"},
          	{Header:"장애인구분",Type:"Combo", SaveName:"fam_DISABLED_CODE", ComboText:"|비해당|장애인복지법|국가유공자|중증환자", ComboCode:"|비해당|장애인복지법|국가유공자|중증환자", Width:120, Align:"Center"},
          	{Header:"내외국인",Type:"Combo", SaveName:"fam_LOCAL_CODE", ComboText:"|내국인|외국인", ComboCode:"|내국인|외국인" ,Width:60, Align:"Center"},
          	{Header:"생년월일",Type:"Text", SaveName:"fam_BIRTH_DATE", Width:60, Align:"Center"},
          	{Header:"양음구분",Type:"Combo", SaveName:"fam_SOLAR_CODE", Width:60, Align:"Center"},
          	{Header:"학력",Type:"Combo", SaveName:"fam_HAGLYEOG_CODE", Width:60, Align:"Center"},
          	{Header:"졸업구분",Type:"Combo", SaveName:"fam_GRADUATION_CODE", Width:60, Align:"Center"},
          	{Header:"직업",Type:"Text", SaveName:"fam_JOB", Width:60, Align:"Center"},
          	{Header:"직장명",Type:"Text", SaveName:"fam_WORK_NAME", Width:60, Align:"Center"},
          	{Header:"직위",Type:"Text", SaveName:"fam_POSITION", Width:60, Align:"Center"}
       	];
		
		createIBSheet2($("#ib-container1")[0],"mySheet4", "100%", "300px");
       	IBS_InitSheet(mySheet4,initData);
		mySheet4.DataInsert();
		
		//숨김
		mySheet4.SetColHidden([
	      {Col: 0, Hidden:1}, //상태
	      {Col: 3, Hidden:1} // pk값
	    ]);
       	
		//mySheet5 //학력
       	initData.Cols = [
       		{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
			{Header:"NO",Type:"Seq", Align:"Center"},
			{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50},
			{Header:"", Type:"Text", SaveName:"pk_HL_CODE", Align:"Center"},
            {Header:"학교명",Type:"ComboEdit", SaveName:"hl_SCHOOL_CODE", Width:100, Align:"Center"},
            {Header:"입학일",Type:"Date", SaveName:"hl_STA_DATE", Width:120, Align:"Center"},
            {Header:"졸업일",Type:"Date", SaveName:"hl_END_DATE", Width:120, Align:"Center"},
            {Header:"구분",Type:"Combo", SaveName:"hl_SORT_CODE", Width:60, Align:"Center"},
            {Header:"소재지",Type:"Text", SaveName:"hl_LOCATION", Width:60, Align:"Center"},
            {Header:"전공과목",Type:"ComboEdit", SaveName:"hl_MAJOR_CODE", Width:60, Align:"Center"},
            {Header:"부전공",Type:"ComboEdit", SaveName:"hl_MINOR_CODE", Width:60, Align:"Center"},
            {Header:"학위구분",Type:"Text", SaveName:"hl_DEGREE", Width:60, Align:"Center"},
            {Header:"주야",Type:"Combo", SaveName:"hl_JUYA_CODE", Width:60, Align:"Center"},
            {Header:"본교",Type:"Combo", SaveName:"hl_MAIN_CODE", Width:60, Align:"Center"},
        ];
	
       	createIBSheet2($("#ib-container2")[0],"mySheet5", "100%", "300px");
       	IBS_InitSheet(mySheet5,initData);
       	mySheet5.DataInsert();
       	
       	//숨김
       	mySheet5.SetColHidden([
  	      {Col: 0, Hidden:1}, //상태
  	      {Col: 3, Hidden:1} // pk값
  	    ]);
       	
		//mySheet6 //경력
        initData.Cols = [
        	{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
        	{Header:"NO",Type:"Seq", Align:"Center"},
        	{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50},
        	{Header:"경력코드",Type:"Text",SaveName:"pk_CAR_CODE", Align:"Center"},
            {Header:"직장명",Type:"Text", SaveName:"car_NAME", Width:150, Align:"Center"},
            {Header:"입사일",Type:"Text", SaveName:"car_STA_DATE", Width:60, Align:"Center"},
            {Header:"퇴사일",Type:"Text", SaveName:"car_END_DATE", Width:60, Align:"Center"},
            {Header:"근무년한",Type:"Text", SaveName:"car_DATE", Width:60, Align:"Center"},
            {Header:"담당업무",Type:"Text", SaveName:"car_DANDANG", Width:60, Align:"Center"},
            {Header:"직위",Type:"Text", SaveName:"car_POSITION", Width:60, Align:"Center"},
            {Header:"급여",Type:"Int", SaveName:"car_SALARY", "Format": "#,### 원", Width:60, Align:"Center"},
            {Header:"퇴직사유",Type:"Text", SaveName:"car_RESIGN", Width:60, Align:"Center"},
            {Header:"근속기",Type:"Text", SaveName:"car_GEUNSOG_CODE", Width:60, Align:"Center"},
        ];
         
        createIBSheet2($("#ib-container3")[0],"mySheet6", "100%", "300px");
		IBS_InitSheet(mySheet6,initData);
		mySheet6.DataInsert();
		
		//숨김
       	mySheet6.SetColHidden([
  	     // {Col: 0, Hidden:1}, //상태
  	      //{Col: 3, Hidden:1} // pk값
  	    ]);
		
		//mySheet7 //면허/자격
        initData.Cols = [
        	{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
        	{Header:"NO",Type:"Seq", Align:"Center"},
        	{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50},
        	{Header:"자격코드",Type:"Text",SaveName:"pk_CERTIFICATE_CODE", Align:"Center"},
            {Header:"자격종류",Type:"Text", SaveName:"certificate_SORT_CODE", Width:150, Align:"Left"},
            {Header:"취득일",Type:"Text", SaveName:"certificate_STA_DATE", Width:60, Align:"Center"},
            {Header:"만료일",Type:"Text", SaveName:"certificate_END_DATE", Width:60, Align:"Center"},
            {Header:"자격증번호",Type:"Text", SaveName:"certificate_NUM", Width:60, Align:"Center"},
            {Header:"발행기관",Type:"Text", SaveName:"certificate_ISSUER_CODE", Width:60, Align:"Center"},
            {Header:"수당",Type:"Text", SaveName:"certificate_SUDANG_CODE", Width:60, Align:"Center"},
        ];
          
        createIBSheet2($("#ib-container4")[0],"mySheet7", "100%", "300px");
        IBS_InitSheet(mySheet7,initData);
        mySheet7.DataInsert();
        
    	//숨김
       	mySheet7.SetColHidden([
  	      {Col: 0, Hidden:1}, //상태
  	      {Col: 3, Hidden:1} // pk값
  	    ]);
        
		//mySheet8 //인사발령
		initData.Cols = [
			{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
			{Header:"발령호수",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"발령일자",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"제목",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"발령구분",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"발령내역",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"발령전정보",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"현정보",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"발령후정보",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"비고",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
		];
           
		createIBSheet2($("#ib-container5")[0],"mySheet8", "100%", "300px");
		IBS_InitSheet(mySheet8,initData);
		
		//mySheet9 //인사고과
		initData.Cols = [
			{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
			{Header:"고과명",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"평가시작일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"평가종료일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"고과일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"고과자",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"반영률",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"점수",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"등급",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"비고",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
		];
           
		createIBSheet2($("#ib-container6")[0],"mySheet9", "100%", "300px");
		IBS_InitSheet(mySheet9,initData);
		mySheet9.DataInsert();
		
		//mySheet10 //출장
		initData.Cols = [
			{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
			{Header:"출장국가",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"출장지",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"시작일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"종료일",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"항공료",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"본인부담",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"회사부담",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"기타비용",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"총비용",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"목적",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
		];
           
		createIBSheet2($("#ib-container7")[0],"mySheet10", "100%", "300px");
		IBS_InitSheet(mySheet10,initData);
		mySheet10.DataInsert();
		
		//mySheet11 //상벌관리
		initData.Cols = [
			{Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center"},
			{Header:"구분",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"포상/징계명",Type:"Text", SaveName:"sPos", Width:100, Align:"Center"},
			{Header:"포상/징계일",Type:"Text", SaveName:"sPos", Width:100, Align:"Center"},
			{Header:"포상/징계내역",Type:"Text", SaveName:"sPos", Width:100, Align:"Center"},
			{Header:"시행처",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"금액",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
			{Header:"징계시작일",Type:"Text", SaveName:"sPos", Width:100, Align:"Center"},
			{Header:"징계종료일",Type:"Text", SaveName:"sPos", Width:100, Align:"Center"},
			{Header:"비고",Type:"Text", SaveName:"sPos", Width:60, Align:"Center"},
		];
           
		createIBSheet2($("#ib-container8")[0],"mySheet11", "100%", "300px");
		IBS_InitSheet(mySheet11,initData);
		mySheet11.DataInsert();
		
// 		selectSite();
   }

  
   
	// 기타 이벤트 //마우스 클릭시
	function mySheet_OnSelectCell(oldrow, oldcol, row, col) {
		fk_fam_sawon_code = "fk_FAM_SAWON_CODE=" + mySheet.GetCellValue(row, 2); // mysheet에 있는 사원코드
		fk_hl_sawon_code = "fk_HL_SAWON_CODE=" + mySheet.GetCellValue(row, 2); // mysheet에 있는 사원코드
		fk_car_sawon_code = "fk_CAR_SAWON_CODE=" + mySheet.GetCellValue(row, 2); // mysheet에 있는 사원코드
		fk_cert_sawon_code = "fk_CERTIFICATE_SAWON_CODE=" + mySheet.GetCellValue(row, 2); // mysheet에 있는 사원코드
		x = mySheet.GetCellValue(row, 2);
		
		mySheet4.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_fam.do", fk_fam_sawon_code);
		mySheet5.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_hl.do", fk_hl_sawon_code);
		mySheet6.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_car.do", fk_car_sawon_code);
		mySheet7.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_cert.do", fk_cert_sawon_code);
		//mySheet8.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_fam.do", x);
		//mySheet9.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_fam.do", x);
		//mySheet10.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_fam.do", x);
		//mySheet11.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_fam.do", x);
	}
	
	function mySheet_OnBeforeSearch() {  
// 	function selectSite() { // 인사코드조회
		var info4 = ""; // 관계
		var info5 = ""; // 졸업
		var info6 = ""; // 학력
		var info10 = ""; // 학교명
		var info11 = ""; // 전공코드
		var info12 = ""; // 주야구분
		var info13 = ""; // 본분교구분
		
		var info7 = ""; //여부코드(함/안함)
		var info8 = ""; //여부코드(해당/비해당)
		var info9 = ""; //양음구분(양/음)
		
		$.ajax({ // 인사기초코드 조회
			url : "${contextPath}/human/p0001/ISA_c.do",//목록을 조회 할 url
			type : "POST",
			dataType : "JSON",
			success : function(data) {
				for (var i = 0; i < data['Data'].length; i++) {
					var MNGEMENT_NAME = "<option value='" + data['Data'][i].person_BC_DETAI_MNGEMENT_NAME + "'>" + data['Data'][i].person_BC_DETAI_MNGEMENT_NAME + "</option>";
					var info1 = '|' + data['Data'][i].person_BC_DETAI_MNGEMENT_NAME;
					
					var code_ = data['Data'][i].fk_PERSON_BC_CODE_NUM;
					switch(code_){
						case 'H1': // 관계
							info4 = info4 + info1;
							break;
						case 'HW': // 졸업구분
							info5 = info5 + info1;
							break;
						case 'HB': // 졸업구분
							info6 = info6 + info1;
							break;
						case 'HX': // 학교
							info10 = info10 + info1;
							break;
						case 'HY': // 전공코드
							info11 = info11 + info1;
							break;
						case 'HZ': // 주야구분
							info12 = info12 + info1;
							break;
						case 'R1': // 본분교구분
							info13 = info13 + info1;
							break;
			//---------------------------------------------------------------------	
						case 'HT': // 채용구분
							$('#isa_HIRE_CODE').append(MNGEMENT_NAME);
							break;
						case 'HP': // 주거구분
							$('#isa_HOUSE_CODE').append(MNGEMENT_NAME);
							break;
						case 'HI': // 생활수준
							$('#isa_LIVING_CODE').append(MNGEMENT_NAME);
							break;
						case 'HA': // 종교
							$('#isa_RELIGION_CODE').append(MNGEMENT_NAME);
							break;
						case 'HU': // 취미
							$('#isa_HOBBY_CODE').append(MNGEMENT_NAME);
							break;
						case 'HV': // 특기
							$('#isa_SPECIALTY_CODE').append(MNGEMENT_NAME);
							break;
					}
				}
				H1 = {'ComboCode':info4,'ComboText':info4}; // 관계
				HB = {'ComboCode':info6,'ComboText':info6}; // 학력
				HW = {'ComboCode':info5,'ComboText':info5}; // 졸업구분
				HX = {'ComboCode':info10,'ComboText':info10}; // 학교
				HY = {'ComboCode':info11,'ComboText':info11}; // 전공코드
				HZ = {'ComboCode':info12,'ComboText':info12}; // 주야구분
				R1 = {'ComboCode':info13,'ComboText':info13}; // 본분교구분
			},
			error : function(jqxhr, status, error) {
				alert("에러");
			}
		});
		$.ajax({ // 공통코드조회
			url : "${contextPath}/human/p0001/COM_CODE.do",//목록을 조회 할 url
			type : "POST",
			dataType : "JSON",
			success : function(data) {
				for (var i = 0; i < data['Data'].length; i++) {
					var info1 = '|' + data['Data'][i].codenm;
					
					var code_ = data['Data'][i].classno;
					switch(code_){
						case '7': // 여부코드(함/안함)
							info7 = info7 + info1;
							break;
						case '8': // 여부코드(해당/비해당)
							info8 = info8 + info1;
							break;
						case '10': // 양음구분코드(양/음)
							info9 = info9 + info1;
							break;
					
					}
				}
				this.Action();
			},
			Action: function(){	 // combo를 넣는 곳
				S1 = {'ComboCode':info7,'ComboText':info7}; // 여부코드(함/안함)
				S2 = {'ComboCode':info8,'ComboText':info8}; // 여부코드(해당/비해당)
				S3 = {'ComboCode':info9,'ComboText':info9}; // 양음구분(양/음)
			},
			error : function(jqxhr, status, error) {
				alert("에러");
			}
		});
	};
	function selectSite() {
		$.ajax({ // 
			url : "${contextPath}/human/p0001/ISA_hl.do",//목록을 조회 할 url
			type : "POST",
			dataType : "JSON",
			data : {"fk_HL_SAWON_CODE":x},
			success : function(data) {
				var SCHOOL_CODE = ""; // 학교명 
				var MAJOR_CODE = ""; // 전공코드
				var MINOR_CODE = ""; // 부전공코드
				for (var i = 0; i < data['Data'].length; i++) {
						SCHOOL_CODE = SCHOOL_CODE + "|" + data['Data'][i].hl_SCHOOL_CODE;
						MAJOR_CODE = MAJOR_CODE + "|" + data['Data'][i].hl_MAJOR_CODE;
						MINOR_CODE = MINOR_CODE + "|" + data['Data'][i].hl_MINOR_CODE;
					}
				var school = SCHOOL_CODE.split("|");
				var major = MAJOR_CODE.split("|");
				var minor = MINOR_CODE.split("|");
				for(var i in school){
					arr1 = school[i].split(",");
					arr2 = major[i].split(",");
					arr3 = minor[i].split(",");
					if(i != 0){
						console.log(arr2);
						if(arr1[0] == "null" ){ 
							arr1[0] = "" 
						};
						if(arr2[0] == "null" ){ 
							arr2[0] = "" 
						};
						if(arr3[0] == "null" ){
							arr3[0] = "" 
						};
						mySheet5.SetCellValue(i,4,arr1[0]);
						mySheet5.SetCellValue(i,9,arr2[0]);
						mySheet5.SetCellValue(i,10,arr3[0]);
					}
				}
				
			},
			error : function(jqxhr, status, error) {
				alert("에러");
			}
		});
	}
	
	 /*Sheet 각종 처리*/
	   function doAction(sAction) {
	      switch(sAction) {
	         case "search":
	        	var param = FormQueryStringEnc(document.frm);
				console.log(param);
				//mySheet.DoSearch("${contextPath}/hm/s0002/searchList.do", param);
	            break;
	         case "reload":
	            mySheet.RemoveAll();
	            break;
	         case "save":
	            //mySheet.DoSave("${pageContext.request.contextPath}/human/p0001/upload.do");
	        	//mySheet4.DoSave("${pageContext.request.contextPath}/human/p0001/insertFam.do", fk_fam_sawon_code);
	        	mySheet5.DoSave("${pageContext.request.contextPath}/human/p0001/insertHL.do", fk_hl_sawon_code);
	        	//mySheet6.DoSave("${pageContext.request.contextPath}/human/p0001/insertCar.do", fk_car_sawon_code);
	        	//mySheet7.DoSave("${pageContext.request.contextPath}/human/p0001/insertCert.do", fk_cert_sawon_code);
	           break;
	         case "insert":
				//mySheet4.DataInsert(-1); 
				mySheet5.DataInsert(-1);
				mySheet6.DataInsert(-1);
				mySheet7.DataInsert(-1);
				var i = mySheet4.RowCount();
				mySheet4.CellComboItem(i,5,H1); // 관계
				mySheet4.CellComboItem(i,13,HB); // 학력
				mySheet4.CellComboItem(i,14,HW); // 졸업구분
				
				mySheet4.CellComboItem(i,6,S1); // 함/안함
				mySheet4.CellComboItem(i,8,S2); // 해당/비해당
				mySheet4.CellComboItem(i,12,S3); // 양/음
	            break; 
	         case "list":
	             mySheet.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA.do");
	        	 break;
	      }
	   }
	 
	// mySheet 조회 끝나기 직전 이벤트 
	function mySheet4_OnSearchEnd() { // 가족
// 		selectSite();
		mySheet4.DataInsert(-1); 
		for(var i = 1; i<=mySheet4.RowCount(); i++ ){
			mySheet4.CellComboItem(i,5,H1); // 관계
			mySheet4.CellComboItem(i,13,HB); // 학력
			mySheet4.CellComboItem(i,14,HW); // 졸업구분
			
			mySheet4.CellComboItem(i,6,S1); // 함/안함
			mySheet4.CellComboItem(i,8,S2); // 해당/비해당
			mySheet4.CellComboItem(i,12,S3); // 양/음
		}
	}
	
	function mySheet5_OnSearchEnd() { // 학력
		for(var i = 1; i<=mySheet5.RowCount(); i++ ){
			mySheet5.CellComboItem(i,4,HX); // 학교명
			mySheet5.CellComboItem(i,7,HW); // 졸업구분
 			mySheet5.CellComboItem(i,9,HY); // 전공코드
			mySheet5.CellComboItem(i,10,HY); // 전공코드
			mySheet5.CellComboItem(i,12,HZ); // 주야구분
			mySheet5.CellComboItem(i,13,R1); // 본분교구분
		}
		selectSite();
	}
	// 기타이벤트 // 키보드 버튼이 올라올 시
	function mySheet4_OnKeyDown(Row, Col, KeyCode, Shift) {
			if (KeyCode == 13 && Col == 4 && Row == 2) { //엔터를 누름 -> col이 성명에 있고, row가 마지막일때
				mySheet4.SetCellEditable(2, 7, 0);
				//mySheet4.SetCellEditable(2, 7, 1);
			}
	}
	
	 function Postcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('company_zip').value = data.zonecode; // 우편번호
	                document.getElementById('company_address').value = roadAddr; // 도로명주소
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){ // 상세주소
	                    document.getElementById('company_detail_address').value = extraRoadAddr;
	                } else {
	                    document.getElementById('company_detail_address').value = '';
	                }
	                
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	            	}
	            }
	        }).open();
	    } // 주소 api function end
	    
	    function Postcode2() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('company_zip2').value = data.zonecode; // 우편번호
	                document.getElementById('company_address2').value = roadAddr; // 도로명주소
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){ // 상세주소
	                    document.getElementById('company_detail_address2').value = extraRoadAddr;
	                } else {
	                    document.getElementById('company_detail_address2').value = '';
	                }
	                
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	            	}
	            }
	        }).open();
	    } // 주소 api function end
	 
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
					<!-- 채용/거주 -->
					<div class="ib-tab-contents__item">
						<form name='frm'>
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
									<td class="bg01_r">한자이름</td><!-- 이름 변경해야함 -->
									<td class="bg02_l"><input type="text" id="ISA_HANJA_NAME" style="width: 98%; "></td>
									<td class="bg01_r">채용구분</td>
									<td class="bg02_l">
										<select name="selectBox" id="isa_HIRE_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
										</select>
									</td>
									<td class="bg01_r">기수</td>
									<td class="bg02_l"><input type="text" id="ISA_NUM" style="width: 98%; "></td>
								</tr>
								<tr>
									<td class="bg01_r">현주소</td>
									<!-- 이름 변경해야함 -->
									<td>
										<input type="text" id="company_zip" name="company_zip" size="10px">
										<img src='${contextPath}/resources/image/search_icon.png;' onclick='Postcode();' style='cursor:pointer;' />
									</td>
									<td class="bg02_l" colspan="4">
										<input type="text" id="ISA_ADDRESS" size="50px" style="width:100%;">
									</td>
								</tr>
	   							<tr>
		   							<td class="bg01_r"></td><!-- 이름 변경해야함 -->
		   							<td class="bg02_l" colspan="5"><input type="text" name="company_detail_address" id="company_detail_address" size="50px" style="width:100%;"></td>
	   							</tr>
								<tr>
									<td class="bg01_r">등록기준지</td><!-- 이름 변경해야함 -->
									<td>
										<input type="text" id="ISA_PERMANENT_ADDR" size="10px">
										<img src='${contextPath}/resources/image/search_icon.png;' onclick='Postcode2();' style='cursor:pointer;' />
									</td>
									<td class="bg02_l" colspan="5"><input type="text" name="company_address2" id="company_address2" size="50px" style="width:100%;"></td>
								</tr>
								<tr><!-- 이름 변경해야함 -->
									<td class="bg01_r"></td><!-- 이름 변경해야함 -->
									<td class="bg02_l" colspan="5"><input type="text" name="company_detail_address2" id="company_detail_address2" size="50px" style="width:100%;"></td>
								</tr>
								<tr>
									<td class="bg01_r">결혼여부</td>
									<td class="bg02_l">
										<select name="selectBox" id="isa_MARRIAGE_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
												<option value="미혼">미혼</option>
												<option value="기혼">기혼</option>
										</select>
									</td>
									<td class="bg01_r">주거구분</td>
									<td class="bg02_l">
										<select name="selectBox" id="isa_HOUSE_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
										</select>
									</td>
									<td class="bg01_r">생활수준</td>
									<td class="bg02_l">
										<select name="selectBox" id="isa_LIVING_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
										</select>
									</td>
								</tr>

								<tr>
									<td class="bg01_r">부동산</td>
									<td class="bg02_l"><input type="text" id="ISA_ESTATE" style="width: 98%; "></td>
									<td class="bg01_r">동산</td>
									<td class="bg02_l"><input type="text" id="ISA_MOVABLES" style="width: 98%; "></td>
									<td class="bg01_r">합계</td>
									<td class="bg02_l"><input type="text" id="ISA_SUM" style="width: 98%; "></td>
								</tr>
							
								<tr>
									<td class="bg01_r">건평</td>
									<td class="bg02_l"><input type="text" id="ISA_GEONPYEONG" style="width: 98%; "></td>
									<td class="bg01_r">대지</td>
									<td class="bg02_l"><input type="text" id="ISA_SITE" style="width: 98%; "></td>
								</tr>
								
								<tr>
									<td class="bg01_r">종교</td>
									<td class="bg02_l">
										<select name="selectBox" id="isa_RELIGION_CODE" style="width: 80px;" class="select_02">
											<option value=""></option>
										</select>
									</td>
									<td colspan="4" class="bg02_l" id="EMP_ADDRESS">서울시 강남구 압구정동 한양 아파트 2동 909호</td>
								</tr>
							
								<tr>
									<td class="bg01_r">취미</td>
									<td class="bg02_l">
										<select name="selectBox" id="isa_HOBBY_CODE" style="width: 80px;" class="select_02">
											<option value=""></option>
										</select>
									</td>
									<td colspan="4" class="bg02_l" id="EMP_ADDRESS">서울시 강남구 구정동 한양 아파트 2동 909호</td>
								</tr>
							
								<tr>
									<td class="bg01_r">특기</td>
									<td class="bg02_l">
										<select name="selectBox" id="isa_SPECIALTY_CODE" style="width: 80px;" class="select_02">
											<option value=""></option>
											<option value="기타">기타</option>
										</select>
									</td>
									<td colspan="4" class="bg02_l" id="EMP_ADDRESS">
										<!-- if문을 사용하여 option 값이 기타일 경우 input type=text를 사용하게끔 -->
									</td>
								</tr>
							</table>
						</form>
					</div>
					
					<!-- 병역 -->
					<div class="ib-tab-contents__item">
						
					</div>
					
					<!-- 가족 -->
					<div class="ib-tab-contents__item">
						<div id='ib-container1'></div>
					</div>
					
					<!-- 학력 -->
					<div class="ib-tab-contents__item">
						<div id='ib-container2'></div>
					</div>
					
					<!-- 경력 -->
					<div class="ib-tab-contents__item">
						<div id='ib-container3'></div>
					</div>
					
					<!-- 면허/자격 -->
					<div class="ib-tab-contents__item">
						<div id='ib-container4'></div>
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
					<!-- 인사발령 -->
					<div class="ib-tab-contents__item"> 
						<div id='ib-container5'></div> 
					</div>
					
					<!-- 인사고과 -->
					<div class="ib-tab-contents__item"> 
						<div id='ib-container6'></div> 
					</div>
					
					<!-- 출장 -->
					<div class="ib-tab-contents__item"> 
						<div id='ib-container7'></div> 
					</div>
					
					<!-- 상벌관리 -->
					<div class="ib-tab-contents__item">
						<div id='ib-container8'></div> 
					</div>
				</div>
				
			</div>
		</div>
	</DIV>

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