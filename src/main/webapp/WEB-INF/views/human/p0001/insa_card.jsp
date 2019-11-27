<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title><s:message code="common.pageTitle"/></title>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script type="text/javascript" src="${contextPath}/resources/ibsheet/ibtab.js"></script>
<script type="text/javascript" src="${contextPath}/resources/ibsheet/ibtabinfo.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<!-- 우편번호 관련된 script 추가 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
<link rel="stylesheet" href="${contextPath}/resources/css/ibtab-style.min.css">

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
		createIBTab($('#tab1')[0], $('#tab_contents')[0], 'myTabs1', {
			themes: {
				tabs: "simple_under_blue",
		       	contents: "simple_under_blue",
		       	contextMenu: "simple_under_blue"
		    },
			allowCloseBTN: false
		});
	   
// 		myTab.setEventListener("beforeGoTo", function(event){ 
// 			console.log("beforeGoTo"); 
// 			return true; 
// 		})
// 		myTab.tabs.items(0).setTitle("제목"); 
			
		//ibtab2 생성
		createIBTab($('#tab2')[0], $('#tab_contents_2')[0], 'myTabs2', {
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
      		{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
         	{Header:"NO",Type:"Seq", Align:"Center"},
         	{Header:"",Type:"DummyCheck", SaveName:"chk", Width:35, Align:"Center",Edit:1,HeaderCheck:1},
		 	{Header:"사원코드",Type:"Text",SaveName:"pk_SAWON_CODE",Width:60,Align:"Center"},
		 	{Header:"사원명",Type:"Text",SaveName:"sawon_NAME",Width:50, Edit:0},
		 	
		 	{Header:"",Type:"Text",SaveName:"fk_ISA_SAWON_CODE",Width:60,Align:"Center"},
		 	{Header:"",Type:"Text",SaveName:"isa_HANJA_NAME",Width:60,Align:"Center"},
		 	{Header:"",Type:"Text",SaveName:"isa_HIRE_CODE",Width:60,Align:"Center"},
		 	{Header:"",Type:"Text",SaveName:"isa_NUM",Width:60,Align:"Center"},
		 	
		 	{Header:"",Type:"Text",SaveName:"isa_ADDR_ZIP",Width:60,Align:"Center"},
		 	{Header:"",Type:"Text",SaveName:"isa_ADDRESS",Width:60,Align:"Center"},
		 	{Header:"",Type:"Text",SaveName:"isa_ADDR_DETAIL",Width:60,Align:"Center"},
		 	
		 	{Header:"",Type:"Text",SaveName:"isa_PER_ADDR_ZIP",Width:60,Align:"Center"},
		 	{Header:"",Type:"Text",SaveName:"isa_PERMANENT_ADDR",Width:60,Align:"Center"},
		 	{Header:"",Type:"Text",SaveName:"isa_PER_ADDR_DETAIL",Width:60,Align:"Center"},
		 	
		 	{Header:"",Type:"Text",SaveName:"isa_MARRIAGE_CODE",Width:60,Align:"Center" },
		 	{Header:"",Type:"Text",SaveName:"isa_HOUSE_CODE",Width:60,Align:"Center" },
		 	{Header:"",Type:"Text",SaveName:"isa_LIVING_CODE",Width:60,Align:"Center" },
		 	
		 	{Header:"",Type:"Text",SaveName:"isa_RELIGION_CODE",Width:60,Align:"Center"},
		 	{Header:"",Type:"Text",SaveName:"isa_HOBBY_CODE",Width:60,Align:"Center" },
		 	{Header:"",Type:"Text",SaveName:"isa_SPECIALTY_CODE",Width:60,Align:"Center"},
		 	
		 	{Header:"",Type:"Text",SaveName:"religion_DETAI",Width:60,Align:"Center"},
		 	{Header:"",Type:"Text",SaveName:"hobby_DETAI",Width:60,Align:"Center" },
		 	{Header:"",Type:"Text",SaveName:"specialty_DETAI",Width:60,Align:"Center"},
		 	
		 	{Header:"",Type:"Text",SaveName:"isa_MILITARY_CODE",Width:60,Align:"Center", Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_MYEONJE",Width:60,Align:"Center"},
		 	{Header:"",Type:"Text",SaveName:"isa_MIL_NUM",Width:60,Align:"Center", Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_MILI_STA_DATE",Width:60,Align:"Center", Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_MILI_END_DATE",Width:60,Align:"Center", Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_POS_CODE",Width:60,Align:"Center", Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_GUNBYEOL_CODE",Width:60,Align:"Center", Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_BOTS_CODE",Width:60,Align:"Center", Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_YEBIGUN_CODE",Width:60,Align:"Center", Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_DISCHARGE_CODE",Width:60,Align:"Center", Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_MILITARY_CLASS_CODE",Width:60,Align:"Center", Hidden:1},
		 	
		 	{Header:"사진",Type:"Text",SaveName:"photo",Width:50, Edit:0}
      	];
      	IBS_InitSheet(mySheet,initData);
      	mySheet.SetDataAutoTrim(0);
//       	mySheet.SetColHidden([
// 			{Col: 5, Hidden:1},
// 			{Col: 6, Hidden:1},
// 			{Col: 7, Hidden:1},
// 			{Col: 8, Hidden:1},
// 			{Col: 9, Hidden:1},
// 			{Col: 10, Hidden:1},
// 			{Col: 11, Hidden:1},
// 			{Col: 12, Hidden:1},
// 			{Col: 13, Hidden:1},
// 			{Col: 14, Hidden:1},
// 			{Col: 15, Hidden:1},
// 			{Col: 16, Hidden:1},
// 			{Col: 17, Hidden:1},
// 			{Col: 18, Hidden:1},
// 			{Col: 19, Hidden:1},
// 			{Col: 20, Hidden:1},
// 			{Col: 'religion_DETAI', Hidden:1},
// 			{Col: 'hobby_DETAI', Hidden:1},
// 			{Col: 'specialty_DETAI', Hidden:1}
// // 			{Col: 'photo', Hidden:1}
//   	    ]);
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
          	{Header:"주민등록번호",Type:"Text", SaveName:"fam_RES_NUM", Format: "IdNo", Width:120, Align:"Center"},
          	{Header:"수당여부",Type:"Combo", SaveName:"fam_SUDANG", Width:60, Align:"Center"},
          	{Header:"장애인구분",Type:"Combo", SaveName:"fam_DISABLED_CODE", ComboText:"|비해당|장애인복지법|국가유공자|중증환자", ComboCode:"|비해당|장애인복지법|국가유공자|중증환자", Width:120, Align:"Center"},
          	{Header:"내외국인",Type:"Combo", SaveName:"fam_LOCAL_CODE", ComboText:"|내국인|외국인", ComboCode:"|내국인|외국인" ,Width:60, Align:"Center"},
          	{Header:"생년월일",Type:"Text", SaveName:"fam_BIRTH_DATE", Width:60, Align:"Center"},
          	{Header:"양음구분",Type:"Combo", SaveName:"fam_SOLAR_CODE", Width:60, Align:"Center"},
          	{Header:"학력",Type:"Combo", SaveName:"fam_HAGLYEOG_CODE", Width:60, Align:"Center"},
          	{Header:"졸업구분",Type:"Combo", SaveName:"fam_GRADUATION_CODE", Width:60, Align:"Center"},
          	{Header:"직업",Type:"Text", SaveName:"fam_JOB", Width:60, Align:"Center"},
          	{Header:"직장명",Type:"Text", SaveName:"fam_WORK_NAME", Width:60, Align:"Center"},
          	{Header:"직위",Type:"Text", SaveName:"fam_POSITION", Width:60, Align:"Center"},
          	{Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center"}
       	];
		
		createIBSheet2($("#ib-container1")[0],"mySheet4", "100%", "300px");
       	IBS_InitSheet(mySheet4,initData);
		
// 		//숨김
// 		mySheet4.SetColHidden([
// 	      {Col: 0, Hidden:1}, //상태
// 	      {Col: 3, Hidden:1} // pk값
// 	    ]);
       	
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
            {Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center"}
        ];
	
       	createIBSheet2($("#ib-container2")[0],"mySheet5", "100%", "300px");
       	IBS_InitSheet(mySheet5,initData);
       	
//        	//숨김
//        	mySheet5.SetColHidden([
//   	      {Col: 0, Hidden:1}, //상태
//   	      {Col: 3, Hidden:1} // pk값
//   	    ]);
       	
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
            {Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center"}
        ];
         
        createIBSheet2($("#ib-container3")[0],"mySheet6", "100%", "300px");
		IBS_InitSheet(mySheet6,initData);
		
// 		//숨김
//        	mySheet6.SetColHidden([
//   	     // {Col: 0, Hidden:1}, //상태
//   	      //{Col: 3, Hidden:1} // pk값
//   	    ]);
		
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
            {Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center"}
        ];
          
        createIBSheet2($("#ib-container4")[0],"mySheet7", "100%", "300px");
        IBS_InitSheet(mySheet7,initData);
        
//     	//숨김
//        	mySheet7.SetColHidden([
//   	      {Col: 0, Hidden:1}, //상태
//   	      {Col: 3, Hidden:1} // pk값
//   	    ]);
        
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
			{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
        	{Header:"NO",Type:"Seq", Align:"Center"},
        	{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50},
        	{Header:"고과코드",Type:"Text",SaveName:"pk_ASS_CODE", Align:"Center"},
			{Header:"고과명",Type:"Text", SaveName:"ass_NAME", Width:60, Align:"Center"},
			{Header:"평가시작일",Type:"Text", SaveName:"ass_STA_DATE", Width:60, Align:"Center"},
			{Header:"평가종료일",Type:"Text", SaveName:"ass_END_DATE", Width:60, Align:"Center"},
			{Header:"고과일",Type:"Text", SaveName:"ass_DATE", Width:60, Align:"Center"},
			{Header:"고과자",Type:"Text", SaveName:"fk_ASS_PER_CODE", Width:60, Align:"Center"},
			{Header:"반영률",Type:"Text", SaveName:"ass_REFLECTANCE", Width:60, Align:"Center"},
			{Header:"점수",Type:"Text", SaveName:"ass_SCORE", Width:60, Align:"Center"},
			{Header:"등급",Type:"Text", SaveName:"ass_CLASS", Width:60, Align:"Center"},
			{Header:"비고",Type:"Text", SaveName:"ass_NOTE", Width:60, Align:"Center"},
			{Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center"}
		];
           
		createIBSheet2($("#ib-container6")[0],"mySheet9", "100%", "300px");
		IBS_InitSheet(mySheet9,initData);
		
		//mySheet10 //출장
		initData.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
        	{Header:"NO",Type:"Seq", Align:"Center"},
        	{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50},
        	{Header:"출장코드",Type:"Text",SaveName:"pk_CHJ_CODE", Align:"Center"},
			{Header:"출장국가",Type:"Text", SaveName:"chj_COUNTRY_CODE", Width:60, Align:"Center"},
			{Header:"출장지",Type:"Text", SaveName:"chj_AREA", Width:60, Align:"Center"},
			{Header:"시작일",Type:"Text", SaveName:"chj_STA_YMD", Width:60, Align:"Center"},
			{Header:"종료일",Type:"Text", SaveName:"chj_END_YMD", Width:60, Align:"Center"},
			{Header:"항공료",Type:"Text", SaveName:"chj_AIRFARE", Width:60, Align:"Center"},
			{Header:"본인부담",Type:"Text", SaveName:"chj_OWN", Width:60, Align:"Center"},
			{Header:"회사부담",Type:"Text", SaveName:"chj_COMPANY", Width:60, Align:"Center"},
			{Header:"기타비용",Type:"Text", SaveName:"chj_OTHER", Width:60, Align:"Center"},
			{Header:"총비용",Type:"Text", SaveName:"chj_TOTAL", Width:60, Align:"Center"},
			{Header:"목적",Type:"Text", SaveName:"chj_PURPOSE", Width:60, Align:"Center"},
			{Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center"}
		];
           
		createIBSheet2($("#ib-container7")[0],"mySheet10", "100%", "300px");
		IBS_InitSheet(mySheet10,initData);
		
		//mySheet11 //상벌관리
		initData.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
        	{Header:"NO",Type:"Seq", Align:"Center"},
        	{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50},
        	{Header:"상벌코드",Type:"Text",SaveName:"pk_SB_CODE", Align:"Center"},
			{Header:"구분",Type:"Text", SaveName:"sb_DIVISION", Width:60, Align:"Center"},
			{Header:"포상/징계명",Type:"Text", SaveName:"sb_NAME", Width:100, Align:"Center"},
			{Header:"포상/징계일",Type:"Text", SaveName:"sb_DATE", Width:100, Align:"Center"},
			{Header:"포상/징계내역",Type:"Text", SaveName:"sb_DETAILS", Width:100, Align:"Center"},
			{Header:"시행처",Type:"Text", SaveName:"sb_SIHAENGCHEO", Width:60, Align:"Center"},
			{Header:"금액",Type:"Text", SaveName:"sb_AMOUNT", Width:60, Align:"Center"},
			{Header:"징계시작일",Type:"Text", SaveName:"sb_STA_DATE", Width:100, Align:"Center"},
			{Header:"징계종료일",Type:"Text", SaveName:"sb_END_DATE", Width:100, Align:"Center"},
			{Header:"비고",Type:"Text", SaveName:"sb_NOTE", Width:60, Align:"Center"},
			{Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center"}
		];
           
		createIBSheet2($("#ib-container8")[0],"mySheet11", "100%", "300px");
		IBS_InitSheet(mySheet11,initData);
		
		
		$("#religion_DETAI").hide();
		$("#hobby_DETAI").hide();
		$("#specialty_DETAI").hide();
		
		// tab 이동전에 발생
	 	myTabs1.setEvents({ 
			beforeGoToTab: function(event) {
				var index = event.indexActive;
// 				var sRow = mySheet.FindStatusRow('U|I'); // Status 상태가 I나 U인 것의 row를 구한다. 
				switch(index){
					case 0:
						SetValue();
// 						console.log(mySheet.FindStatusRow('U|I'));
						if(mySheet.FindStatusRow('U|I') != "")
							mySheet.DoSave("${pageContext.request.contextPath}/human/p0001/insertData.do");
						break;
					case 1:
						SetValue();
						if(mySheet.FindStatusRow('U|I') != "")
							mySheet.DoSave("${pageContext.request.contextPath}/human/p0001/insertData.do");
						break;
					case 2:
						if(mySheet4.FindStatusRow('U|I') != "")
						mySheet4.DoSave("${pageContext.request.contextPath}/human/p0001/insertFam.do", fk_fam_sawon_code);
						break;
					case 3:
						if(mySheet5.FindStatusRow('U|I') != "")
						mySheet5.DoSave("${pageContext.request.contextPath}/human/p0001/insertHL.do", fk_hl_sawon_code);
						break;
					case 4:
						if(mySheet6.FindStatusRow('U|I') != "")
						mySheet6.DoSave("${pageContext.request.contextPath}/human/p0001/insertCar.do", fk_car_sawon_code);
						break;
					case 5:
						if(mySheet7.FindStatusRow('U|I') != "")
						mySheet7.DoSave("${pageContext.request.contextPath}/human/p0001/insertCert.do", fk_cert_sawon_code);
						break;
				}
					
	   			return true; 
			} 
	   	});
	}
  
  

	// 기타 이벤트 //마우스 클릭시
	function mySheet_OnSelectCell(oldrow, oldcol, row, col) {
		fk_fam_sawon_code = "fk_FAM_SAWON_CODE=" + mySheet.GetCellValue(row, 3); // mysheet에 있는 사원코드
		fk_hl_sawon_code = "fk_HL_SAWON_CODE=" + mySheet.GetCellValue(row, 3); // mysheet에 있는 사원코드
		fk_car_sawon_code = "fk_CAR_SAWON_CODE=" + mySheet.GetCellValue(row, 3); // mysheet에 있는 사원코드
		fk_cert_sawon_code = "fk_CERTIFICATE_SAWON_CODE=" + mySheet.GetCellValue(row, 3); // mysheet에 있는 사원코드
		
		fk_ass_sawon_code = "fk_ASS_SAWON_CODE=" + mySheet.GetCellValue(row, 3); // mysheet에 있는 사원코드
		fk_chj_sawon_code = "fk_CHJ_SAWON_CODE=" + mySheet.GetCellValue(row, 3); // mysheet에 있는 사원코드
		fk_sb_sawon_code = "fk_SB_SAWON_CODE=" + mySheet.GetCellValue(row, 3); // mysheet에 있는 사원코드
		// fk_sawon_code로 줄이고 controller - service 에서도 고칠 것
		
		x = mySheet.GetCellValue(row, 3);
		y = mySheet.GetCellValue(row,5);
		
		var image = "/SEED/fileDownload?downname=" + mySheet.GetCellValue(row, 'photo');
		$("#previewImg").attr("src", image); // 이미지
		
		mySheetRow = row;
		ISA(); // 채용/거주, 병역을 셋팅한다.
		
		document.getElementById('PK_SAWON_CODE').value = x;
		
		mySheet4.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_fam.do", fk_fam_sawon_code);
		mySheet5.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_hl.do", fk_hl_sawon_code);
		mySheet6.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_car.do", fk_car_sawon_code);
		mySheet7.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_cert.do", fk_cert_sawon_code);
		
// 		//mySheet8.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_fam.do", x);
		mySheet9.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_ass.do", fk_ass_sawon_code);
		mySheet10.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_chj.do", fk_chj_sawon_code);
		mySheet11.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA_sb.do", fk_sb_sawon_code);
		
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
	        	SetValue(); // 저장 전에 테이블에 있는 값을 ibSheet에 셋팅해준다. 
	        	mySheet.DoSave("${pageContext.request.contextPath}/human/p0001/insertData.do");
	            
// 	        	mySheet4.DoSave("${pageContext.request.contextPath}/human/p0001/insertFam.do", fk_fam_sawon_code);
// 	        	mySheet5.DoSave("${pageContext.request.contextPath}/human/p0001/insertHL.do", fk_hl_sawon_code);
// 	        	mySheet6.DoSave("${pageContext.request.contextPath}/human/p0001/insertCar.do", fk_car_sawon_code);
// 	        	mySheet7.DoSave("${pageContext.request.contextPath}/human/p0001/insertCert.do", fk_cert_sawon_code);

// 	        	mySheet9.DoSave("${pageContext.request.contextPath}/human/p0001/insertAss.do", fk_ass_sawon_code);
// 	        	mySheet10.DoSave("${pageContext.request.contextPath}/human/p0001/insertChj.do", fk_chj_sawon_code);
// 	        	mySheet11.DoSave("${pageContext.request.contextPath}/human/p0001/insertSb.do", fk_sb_sawon_code);
	        	
	           break;
	         case "insert":
				mySheet4.DataInsert(-1); 
				mySheet5.DataInsert(-1);
				mySheet6.DataInsert(-1);
				mySheet7.DataInsert(-1);
				
				mySheet9.DataInsert(-1);
				mySheet10.DataInsert(-1);
				mySheet11.DataInsert(-1);
				
				var j = mySheet5.RowCount();
				mySheet5.CellComboItem(j,4,HX); // 학교명
				mySheet5.CellComboItem(j,7,HW); // 졸업구분
	 			mySheet5.CellComboItem(j,9,HY); // 전공코드
				mySheet5.CellComboItem(j,10,HY); // 전공코드
				mySheet5.CellComboItem(j,12,HZ); // 주야구분
				mySheet5.CellComboItem(j,13,R1); // 본분교구분
	            break; 
	         case "list":
	             mySheet.DoSearch("${pageContext.request.contextPath}/human/p0001/ISA.do");
	        	 break;
	      }
	   }
	 
	function mySheet_OnSearchEnd(){
		SetValue();
		mySheet.SetCellValue()
	}
	
	 
	 
	//--------------------------- mySheet4_ -------------------------------	
	// mySheet 조회 끝나기 직전 이벤트 
	function mySheet4_OnSearchEnd() { // 가족
		if(mySheet4.RowCount() == 0){	
			mySheet4.DataInsert(-1);
		} // 조회시 조회내용이 없으면 한줄 추가
	 
		for(var i = 1; i<=mySheet4.RowCount(); i++ ){
			mySheet4.CellComboItem(i,5,H1); // 관계
			mySheet4.CellComboItem(i,13,HB); // 학력
			mySheet4.CellComboItem(i,14,HW); // 졸업구분
			
			mySheet4.CellComboItem(i,6,S1); // 함/안함
			mySheet4.CellComboItem(i,8,S2); // 해당/비해당
			mySheet4.CellComboItem(i,12,S3); // 양/음
		}
		mySheet4.SetCellValue(mySheet4.RowCount(),'fam_ADD', '추가'); // 추가에 추가버튼
		if(mySheet4.GetCellValue(mySheet4.RowCount(),'STATUS') == 'U' )
			mySheet4.SetCellValue(mySheet4.RowCount(),'STATUS', 'R'); // 추가버튼때문에 '수정'으로 뜬것을 다시 조회로 변경 
		
	}
	
	// 추가버튼 누를시 현제 row에 있는 추가버튼을 없애고, 다음 Row에 추가버튼을 추가한다.
	function mySheet4_OnButtonClick(Row, Col) {  
		mySheet4.SetCellValue(Row, Col, "");
		mySheet4.DataInsert(-1);
		
		mySheet4.CellComboItem(Row+1,5,H1); // 관계
		mySheet4.CellComboItem(Row+1,13,HB); // 학력
		mySheet4.CellComboItem(Row+1,14,HW); // 졸업구분
		mySheet4.CellComboItem(Row+1,6,S1); // 함/안함
		mySheet4.CellComboItem(Row+1,8,S2); // 해당/비해당
		mySheet4.CellComboItem(Row+1,12,S3); // 양/음
		
		mySheet4.SetCellValue(Row+1, Col, "추가");
		
	} 
	
	
	// 새로 추가된 row중 마지막 row가 삭제될시 추가버튼을 이전 row에 추가한다.
	function mySheet4_OnRowDelete(row, api) {
		if(row == mySheet4.RowCount()){
			mySheet4.SetCellValue((row-1), mySheet4.LastCol(),"추가");
		}
	} 
	
	//---------------------   mySheet5_  ----------------------
	
	function mySheet5_OnSearchEnd() { // 학력
		if(mySheet5.RowCount() == 0){	
			mySheet5.DataInsert(-1);
		} // 조회시 조회내용이 없으면 한줄 추가
		for(var i = 1; i<=mySheet5.RowCount(); i++ ){
			mySheet5.CellComboItem(i,4,HX); // 학교명
			mySheet5.CellComboItem(i,7,HW); // 졸업구분
 			mySheet5.CellComboItem(i,9,HY); // 전공코드
			mySheet5.CellComboItem(i,10,HY); // 전공코드
			mySheet5.CellComboItem(i,12,HZ); // 주야구분
			mySheet5.CellComboItem(i,13,R1); // 본분교구분
		}
		
		selectSite(); // 
		
		mySheet5.SetCellValue(mySheet5.RowCount(),'fam_ADD', '추가'); // 추가에 추가버튼
		if(mySheet5.GetCellValue(mySheet5.RowCount(),'STATUS') == 'U' )
			mySheet5.SetCellValue(mySheet5.RowCount(),'STATUS', 'R'); // 추가버튼때문에 '수정'으로 뜬것을 다시 조회로 변경 
	}
	
	// 추가버튼 누를시 현제 row에 있는 추가버튼을 없애고, 다음 Row에 추가버튼을 추가한다.
	function mySheet5_OnButtonClick(Row, Col) {  
		mySheet5.SetCellValue(Row, Col, "");
		mySheet5.DataInsert(-1);
		
		mySheet5.CellComboItem(Row+1,4,HX); // 관계
		mySheet5.CellComboItem(Row+1,7,HW); // 학력
		mySheet5.CellComboItem(Row+1,9,HY); // 졸업구분
		mySheet5.CellComboItem(Row+1,10,HY); // 함/안함
		mySheet5.CellComboItem(Row+1,12,HZ); // 해당/비해당
		mySheet5.CellComboItem(Row+1,13,R1); // 양/음
		
		mySheet5.SetCellValue(Row+1, Col, "추가");
		
	} 
	
	
	// 새로 추가된 row중 마지막 row가 삭제될시 추가버튼을 이전 row에 추가한다.
	function mySheet5_OnRowDelete(row, api) {
		if(row == mySheet5.RowCount()){
			mySheet5.SetCellValue((row-1), mySheet5.LastCol(),"추가");
		}
	} 
	//----------------------------------------------------------------------------------
	
	
	// 조회 이전에 테이블/ibSheet에 checkBox 값을 넣어준다.
	function mySheet_OnBeforeSearch() {  
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
			//--------------------------------------------------------------------- 채용	
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
			//---------------------------------------------------------------------	병역
						case 'HJ':
							$('#isa_MILITARY_CODE').append(MNGEMENT_NAME); // 병역구분
							break;
						case 'S6':
							$('#isa_POS_CODE').append(MNGEMENT_NAME); // 복무기간포함여부
							break;
						case 'H6':
							$('#isa_GUNBYEOL_CODE').append(MNGEMENT_NAME); // 군별
							break;
						case 'H7':
							$('#isa_BOTS_CODE').append(MNGEMENT_NAME); // 병과
							break;
						case 'HL':
							$('#isa_YEBIGUN_CODE').append(MNGEMENT_NAME); // 예비군
							break;
						case 'HK':	
							$('#isa_DISCHARGE_CODE').append(MNGEMENT_NAME); // 제대구분
							break;
						case 'H2':
							$('#isa_MILITARY_CLASS_CODE').append(MNGEMENT_NAME); // 계급
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
				alert("에러 : mySheet_OnBeforeSearch");
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
				alert("에러 : mySheet_OnBeforeSearch_2");
			}
		});
	};
	
	
	
	 // table에 값을 넣는다. 
	function ISA(){
		$.ajax({ // 
			url : "${contextPath}/human/p0001/ISA_cha.do",//목록을 조회 할 url
			type : "POST",
			dataType : "JSON",
			data: {"fk_ISA_SAWON_CODE":y, "pk_SAWON_CODE":x},
			success : function(data) {
				if(data['Data'].length != 1){
					for(var i = 0; i < data['Data'].length; i++){
						mySheet.SetCellValue(i+1, 4,data['Data'][i].fk_ISA_SAWON_CODE);
					}
				}
				 	$('input[id=isa_HANJA_NAME]').val(data['Data'][0].isa_HANJA_NAME);
				 	$('select[id=isa_HIRE_CODE]').val(data['Data'][0].isa_HIRE_CODE); // select
				 	$('input[id=isa_NUM]').val(data['Data'][0].isa_NUM);
				 	
				 	$('input[id=isa_ADDR_ZIP]').val(data['Data'][0].isa_ADDR_ZIP);
				 	$('input[id=isa_ADDRESS]').val(data['Data'][0].isa_ADDRESS);
				 	$('input[id=isa_ADDR_DETAIL]').val(data['Data'][0].isa_ADDR_DETAIL);
				 	
				 	$('input[id=isa_PER_ADDR_ZIP]').val(data['Data'][0].isa_PER_ADDR_ZIP);
				 	$('input[id=isa_PERMANENT_ADDR]').val(data['Data'][0].isa_PERMANENT_ADDR);
				 	$('input[id=isa_PER_ADDR_DETAIL]').val(data['Data'][0].isa_PER_ADDR_DETAIL);
				 	
				 	$('select[id=isa_MARRIAGE_CODE]').val(data['Data'][0].isa_MARRIAGE_CODE);
				 	$('select[id=isa_HOUSE_CODE]').val(data['Data'][0].isa_HOUSE_CODE);
				 	$('select[id=isa_LIVING_CODE]').val(data['Data'][0].isa_LIVING_CODE);
				 	
				 	$('select[id=isa_RELIGION_CODE]').val(data['Data'][0].isa_RELIGION_CODE);
				 	$('select[id=isa_HOBBY_CODE]').val(data['Data'][0].isa_HOBBY_CODE);
				 	$('select[id=isa_SPECIALTY_CODE]').val(data['Data'][0].isa_SPECIALTY_CODE);
				 	
				 	$('input[id=religion_DETAI]').val(data['Data'][0].religion_DETAI);
				 	$('input[id=hobby_DETAI]').val(data['Data'][0].hobby_DETAI);
				 	$('input[id=specialty_DETAI]').val(data['Data'][0].specialty_DETAI);
				 	
				 	//--------------------------------------------------- 병역
				 	$('select[id=isa_MILITARY_CODE]').val(data['Data'][0].isa_MILITARY_CODE);
				 	$('input[id=isa_MYEONJE]').val(data['Data'][0].isa_MYEONJE); // select
				 	$('input[id=isa_MIL_NUM]').val(data['Data'][0].isa_MIL_NUM);
				 	$('input[id=isa_MILI_STA_DATE]').val(data['Data'][0].isa_MILI_STA_DATE);
				 	$('input[id=isa_MILI_END_DATE]').val(data['Data'][0].isa_MILI_END_DATE);
				 	$('select[id=isa_POS_CODE]').val(data['Data'][0].isa_POS_CODE);
				 	$('select[id=isa_GUNBYEOL_CODE]').val(data['Data'][0].isa_GUNBYEOL_CODE);
				 	$('select[id=isa_BOTS_CODE]').val(data['Data'][0].isa_BOTS_CODE);
				 	$('select[id=isa_YEBIGUN_CODE]').val(data['Data'][0].isa_YEBIGUN_CODE);
				 	$('select[id=isa_DISCHARGE_CODE]').val(data['Data'][0].isa_DISCHARGE_CODE);
				 	$('select[id=isa_MILITARY_CLASS_CODE]').val(data['Data'][0].isa_MILITARY_CLASS_CODE);
				 	
				 	
				 	if(data['Data'][0].isa_RELIGION_CODE == 'religion')
				 		$("#religion_DETAI").show();
				 	if(data['Data'][0].isa_HOBBY_CODE == 'hobby')
				 		$("#hobby_DETAI").show();
				 	if(data['Data'][0].isa_SPECIALTY_CODE == 'specialty')
				 		$("#specialty_DETAI").show();
				 	
				 	SetValue(); // 채용/거주, 병역에 있는값을 다시 mySheet에 담는다.
				 	mySheet.SetCellValue(mySheetRow, 'STATUS' ,'R'); // 위에 SetValue 때문에 'U'가 된것을 다시 'R'로 변경해준다.
			},
			error : function(jqxhr, status, error) {
				alert("ISA_에러");
			}
		});
	}
	
	
	 function SetValue(){
			mySheet.SetCellValue(mySheetRow, 'isa_HANJA_NAME', document.getElementById("isa_HANJA_NAME").value);
			mySheet.SetCellValue(mySheetRow, 'isa_HIRE_CODE', document.getElementById("isa_HIRE_CODE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_NUM', document.getElementById("isa_NUM").value);
			
			mySheet.SetCellValue(mySheetRow, 'isa_ADDR_ZIP', document.getElementById("isa_ADDR_ZIP").value);
			mySheet.SetCellValue(mySheetRow, 'isa_ADDRESS', document.getElementById("isa_ADDRESS").value);
			mySheet.SetCellValue(mySheetRow, 'isa_ADDR_DETAIL', document.getElementById("isa_ADDR_DETAIL").value);
			
			mySheet.SetCellValue(mySheetRow, 'isa_PER_ADDR_ZIP', document.getElementById("isa_PER_ADDR_ZIP").value);
			mySheet.SetCellValue(mySheetRow, 'isa_PERMANENT_ADDR', document.getElementById("isa_PERMANENT_ADDR").value);
			mySheet.SetCellValue(mySheetRow, 'isa_PER_ADDR_DETAIL', document.getElementById("isa_PER_ADDR_DETAIL").value);
			
			mySheet.SetCellValue(mySheetRow, 'isa_MARRIAGE_CODE', document.getElementById("isa_MARRIAGE_CODE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_HOUSE_CODE', document.getElementById("isa_HOUSE_CODE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_LIVING_CODE', document.getElementById("isa_LIVING_CODE").value);
			
			mySheet.SetCellValue(mySheetRow, 'isa_RELIGION_CODE', document.getElementById("isa_RELIGION_CODE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_HOBBY_CODE', document.getElementById("isa_HOBBY_CODE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_SPECIALTY_CODE', document.getElementById("isa_SPECIALTY_CODE").value);
			
			mySheet.SetCellValue(mySheetRow, 'religion_DETAI', document.getElementById("religion_DETAI").value);
			mySheet.SetCellValue(mySheetRow, 'hobby_DETAI', document.getElementById("hobby_DETAI").value);
			mySheet.SetCellValue(mySheetRow, 'specialty_DETAI', document.getElementById("specialty_DETAI").value);
			
			mySheet.SetCellValue(mySheetRow, 'isa_MILITARY_CODE', document.getElementById("isa_MILITARY_CODE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_MYEONJE', document.getElementById("isa_MYEONJE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_MIL_NUM', document.getElementById("isa_MIL_NUM").value);
			mySheet.SetCellValue(mySheetRow, 'isa_MILI_STA_DATE', document.getElementById("isa_MILI_STA_DATE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_MILI_END_DATE', document.getElementById("isa_MILI_END_DATE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_POS_CODE', document.getElementById("isa_POS_CODE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_GUNBYEOL_CODE', document.getElementById("isa_GUNBYEOL_CODE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_BOTS_CODE', document.getElementById("isa_BOTS_CODE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_YEBIGUN_CODE', document.getElementById("isa_YEBIGUN_CODE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_DISCHARGE_CODE', document.getElementById("isa_DISCHARGE_CODE").value);
			mySheet.SetCellValue(mySheetRow, 'isa_MILITARY_CLASS_CODE', document.getElementById("isa_MILITARY_CLASS_CODE").value);
			
	 }
	
	
	
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
				alert("selectSite_에러");
			}
		});
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
	                document.getElementById('isa_ADDR_ZIP').value = data.zonecode; // 우편번호
	                document.getElementById('isa_ADDRESS').value = roadAddr; // 도로명주소
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){ // 상세주소
	                    document.getElementById('isa_ADDR_DETAIL').value = extraRoadAddr;
	                } else {
	                    document.getElementById('isa_ADDR_DETAIL').value = '';
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
	                document.getElementById('isa_PER_ADDR_ZIP').value = data.zonecode; // 우편번호
	                document.getElementById('isa_PERMANENT_ADDR').value = roadAddr; // 도로명주소
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){ // 상세주소
	                    document.getElementById('isa_PER_ADDR_DETAIL').value = extraRoadAddr;
	                } else {
	                    document.getElementById('isa_PER_ADDR_DETAIL').value = '';
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
	    
	    
	    
	    // 이미지 업로드
// 	    <!-- 미리 보기 불러오는 곳 바뀔때마다 바뀜-->
	    $(function(){
	        $("#photofile").change(function(){
	        	readImage(this);
	        });
	    });

// 	    <!-- 미리 보기 불러오는 function -->
	    function readImage(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $('#previewImg').attr('src', e.target.result);
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }

	    function fn_formSubmit(){ // 저장 및 업데이트
	    	var form = $("#form1")[0];
	    	var formData = new FormData(form);
	    	if(document.getElementById('photofile').value != ''){
	    		$.ajax({
		    		cache : false,
		    		url: "${contextPath}/human/p0001/imageSave",
		            processData: false,
		            contentType: false,
			        type:"POST", 
			        data: formData,
					success: function(result){
						mySheet.SetCellValue(mySheetRow, 'photo', result);
						document.getElementById('photofile').value = '';
						var Status = mySheet.GetCellValue(mySheetRow, 'STATUS');
						
						if(Status == "U"){
							mySheet.SetCellValue(mySheetRow, "STATUS", "R");
						}
					},error:function(request,status,error){
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				    },complete : function(data) {
				    	//  실패했어도 완료가 되었을 때 처리
					}
			    })
	    	}
	    	
		    
	    } 
	    
	    // 	특기 -> 직접입력을 선택시 보여짐 
	    function direct(dir) {
			if(dir == "specialty") {
				$("#specialty_DETAI").show();
			}else {
				$("#specialty_DETAI").hide();
			}
		};
		
		 // 종교 -> 직접입력을 선택시 보여짐
		function direct_religion(dir){
			if(dir == "religion"){
				$("#religion_DETAI").show();
			} else {
				$("#religion_DETAI").hide();
			}
		}
		 // 취미 -> 직접입력을 선택시 보여짐
		function direct_hobby(dir){
			if(dir == "hobby"){
				$("#hobby_DETAI").show();
			} else{
				$("#hobby_DETAI").hide();
			}
		}
		
		
</script>
<body onload="LoadPage()">
  
	<div id="wrapper">
		<div id="page-wrapper" style="margin: 0px;">

	<!--tab 하단의 메인 타이틀(제목) 들어가는 부분 -->
	<div class="row">
		<div class="col-lg-12">        <!-- 해당 메뉴의 아이콘 -->        <!-- 해당 메인 타이틀(제목) 들어가는 부분 -->
			<h1 class="page-header"><i class="fa fa-users fa-fw"></i> <s:message code="main.per1"/></h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
  
  <div class="main_content">
		<!-- 버튼 -->
		<div class="ib_function float_right">
			<a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
			<a href="javascript:fn_formSubmit(); doAction('save'); " class="f1_btn_white gray">저장</a>
		</div>
<!-- 		; fn_formSubmit() -->
		<div class="clear hidden"></div>
		
		
		<!-- /.row -->
            
            <button type="button" class="btn btn-primary" onclick="fn_formSubmit()"><s:message code="common.btnSave"/></button>
            <!-- /.row -->
		
		<div class="ib_product" style="width:100%;float:left">
			<!-- left 사원리스트 -->
			<div style="height:100%;width:45%;float:left">
				<div class="row">
					<div class="col-lg-7">
						<form id="form1" name="form1" role="form" action="imageSave" method="post" enctype="multipart/form-data" >
							<div class="row form-group">
								<div class="col-sm-3"><!-- 이미지 미리보기 되는 곳 -->
									<br> 																												
									<img id="previewImg" style="width:100%; height: 120px; max-width: 100px;"> 
									<br><br>
									<input type="file" name="photofile" id="photofile" accept='image/*'/>
									<input type="hidden" name="PK_SAWON_CODE" id="PK_SAWON_CODE" value="" />
								</div>
							</div>  
						</form>
					</div>	  
				</div>
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
									<td class="bg02_l"><input type="text" id="isa_HANJA_NAME" style="width: 98%; "></td>
									<td class="bg01_r">채용구분</td>
									<td class="bg02_l">
										<select id="isa_HIRE_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
										</select>
									</td>
									<td class="bg01_r">기수</td>
									<td class="bg02_l"><input type="text" id="isa_NUM" style="width: 98%; "></td>
								</tr>
								
								<tr>
									<td class="bg01_r">현주소</td>
									<td>
										<input type="text" id="isa_ADDR_ZIP" size="10px">
										<img src='${contextPath}/resources/image/search_icon.png;' onclick='Postcode();' style='cursor:pointer;' />
									</td>
									<td class="bg02_l" colspan="4">
										<input type="text" id="isa_ADDRESS" size="50px" style="width:100%;">
									</td>
								</tr>
	   							<tr>
		   							<td class="bg01_r"></td><!-- 이름 변경해야함 -->
		   							<td class="bg02_l" colspan="5"><input type="text" id="isa_ADDR_DETAIL" size="50px" style="width:100%;"></td>
	   							</tr>
	   							
								<tr>
									<td class="bg01_r">등록기준지</td><!-- 이름 변경해야함 -->
									<td>
										<input type="text" id="isa_PER_ADDR_ZIP" size="10px">
										<img src='${contextPath}/resources/image/search_icon.png;' onclick='Postcode2();' style='cursor:pointer;' />
									</td>
									<td class="bg02_l" colspan="5"><input type="text" id="isa_PERMANENT_ADDR" size="50px" style="width:100%;"></td>
								</tr>
								<tr><!-- 이름 변경해야함 -->
									<td class="bg01_r"></td><!-- 이름 변경해야함 -->
									<td class="bg02_l" colspan="5"><input type="text" id="isa_PER_ADDR_DETAIL" size="50px" style="width:100%;"></td>
								</tr>
								<tr>
									<td class="bg01_r">결혼여부</td>
									<td class="bg02_l">
										<select id="isa_MARRIAGE_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
												<option value="미혼">미혼</option>
												<option value="기혼">기혼</option>
										</select>
									</td>
									<td class="bg01_r">주거구분</td>
									<td class="bg02_l">
										<select id="isa_HOUSE_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
										</select>
									</td>
									<td class="bg01_r">생활수준</td>
									<td class="bg02_l">
										<select id="isa_LIVING_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
										</select>
									</td>
								</tr>

								<tr>
									<td class="bg01_r">종교</td>
									<td class="bg02_l">
										<select id="isa_RELIGION_CODE" style="width: 80px;" class="select_02" onchange="direct_religion(this.value)">
											<option value=""></option>
											<option value="religion">직접입력</option>
										</select>
									</td>
									<td colspan="4" class="bg02_l">
										<input type="text" id="religion_DETAI" />
									</td>
								</tr>
							
								<tr>
									<td class="bg01_r">취미</td>
									<td class="bg02_l">
										<select id="isa_HOBBY_CODE" style="width: 80px;" class="select_02" onchange="direct_hobby(this.value)">
											<option value=""></option>
											<option value="hobby">직접입력</option>
										</select>
									</td>
									<td colspan="4" class="bg02_l">
										<input type="text" id="hobby_DETAI" />
									</td>
								</tr>
							
								<tr>
									<td class="bg01_r">특기</td>
									<td class="bg02_l">
										<select id="isa_SPECIALTY_CODE" style="width: 80px;" class="select_02" onchange="direct(this.value)">
											<option value=""></option>
											<option value="specialty">직접입력</option>
										</select>
									</td>
									<!-- 처음 불러올 때 숨겨둔다. -->
									<td colspan="4" class="bg02_l" >
										<input type="text" id="specialty_DETAI" />
									</td>
								</tr>
							</table>
						</form>
					</div>
					
					<!-- 병역 -->
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
									<td class="bg01_r">병역구분</td><!-- 이름 변경해야함 -->
									<td class="bg02_l">
										<select id="isa_MILITARY_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
										</select>
									</td>
									<td class="bg01_r">면제사유</td>
									<td class="bg02_l">
										<input type="text" id="isa_MYEONJE" style="width: 98%; ">	
									</td>
									<td class="bg01_r">군번</td>
									<td class="bg02_l"><input type="text" id="isa_MIL_NUM" style="width: 98%; "></td>
								</tr>
								
								<tr>
									<td class="bg01_r">복무시작일</td>
									<td class="bg02_l"><input type="text" id="isa_MILI_STA_DATE" style="width: 98%; "></td>
									
									<td class="bg01_r">복무종료일</td>
									<td class="bg02_l"><input type="text" id="isa_MILI_END_DATE" style="width: 98%; "></td>
									
									<td class="bg01_r">복무기간포함</td>
									<td class="bg02_l">
										<select id="isa_POS_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
										</select>
									</td>
								</tr>
	   							
								<tr>
									<td class="bg01_r">군별</td>
									<td class="bg02_l">
										<select id="isa_GUNBYEOL_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
										</select>
									</td>
									<td class="bg01_r">병과</td>
									<td class="bg02_l">
										<select id="isa_BOTS_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
										</select>
									</td>
									<td class="bg01_r">예비군</td>
									<td class="bg02_l">
										<select id="isa_YEBIGUN_CODE" style="width: 80px;" class="select_02">
												<option value=""></option>
										</select>
									</td>
								</tr>

								<tr>
									<td class="bg01_r">제대구분</td>
									<td class="bg02_l">
										<select id="isa_DISCHARGE_CODE" style="width: 80px;" class="select_02">
											<option value=""></option>
										</select>
									</td>
									
									<td class="bg01_r">계급</td>
									<td class="bg02_l">
										<select id="isa_MILITARY_CLASS_CODE" style="width: 80px;" class="select_02">
											<option value=""></option>
										</select>
									</td>
								</tr>
							</table>
						</form>
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
	
	</div>
	</div>
</body>
</html>
