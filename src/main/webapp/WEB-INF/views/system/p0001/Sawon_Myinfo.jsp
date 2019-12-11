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
<style>
	.frame {
		  width : 1365px;
		  margin: 0px;
	}

	.container {
  		overflow: hidden;
  		display: table;
  		margin: 0px;
  		
	}
	.nav {
		position: relative;
		  float: left;
		  margin-left:0px;
		  width: 500px;
		  height: 600px;
		  border : 1px solid lightblue;
		  display: table;
	}
	.main_content{
		width: 500px;
		height: 500px;
		margin-right:0px;
	}
	.content {
		  margin-left:510px;
		  margin-top:-771px;
		  float: right;
		  width: 900px;
		  height: 771px;
		  border : 1px solid lightblue;
	}
	#captcha {
			width : 230px;
			height : 70px;
			border: 3px dotted #A3C552;
			text-align: center;
			padding: 5px;
	}
</style>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script type="text/javascript" src="${contextPath}/resources/ibsheet/ibtab.js"></script>
<script type="text/javascript" src="${contextPath}/resources/ibsheet/ibtabinfo.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

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
      	initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1,SearchSync:1,ComboMaxHeight:50};
      	initData.Cols = [
      	//{Header:"No",Type:"Seq", Align:"Center"},
      		{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center",Edit:0},
         	{Header:"NO",Type:"Seq", Align:"Center",Edit:0},
         	{Header:"",Type:"DummyCheck", SaveName:"chk", Width:35, Align:"Center",Edit:1,HeaderCheck:1},
		 	{Header:"사원코드",Type:"Text",SaveName:"pk_SAWON_CODE",Width:60,Align:"Center",Edit:0},
		 	{Header:"사원명",Type:"Text",SaveName:"sawon_NAME",Width:50, Edit:0},
		 	
		 	{Header:"",Type:"Text",SaveName:"fk_ISA_SAWON_CODE",Width:60,Align:"Center",Edit:0},
		 	{Header:"",Type:"Text",SaveName:"isa_HANJA_NAME",Width:60,Align:"Center",Edit:0},
		 	{Header:"",Type:"Text",SaveName:"isa_HIRE_CODE",Width:60,Align:"Center",Edit:0},
		 	{Header:"",Type:"Text",SaveName:"isa_NUM",Width:60,Align:"Center",Edit:0},
		 	
		 	{Header:"",Type:"Text",SaveName:"isa_ADDR_ZIP",Width:60,Align:"Center",Edit:0},
		 	{Header:"",Type:"Text",SaveName:"isa_ADDRESS",Width:60,Align:"Center",Edit:0},
		 	{Header:"",Type:"Text",SaveName:"isa_ADDR_DETAIL",Width:60,Align:"Center",Edit:0},
		 	
		 	{Header:"",Type:"Text",SaveName:"isa_PER_ADDR_ZIP",Width:60,Align:"Center",Edit:0},
		 	{Header:"",Type:"Text",SaveName:"isa_PERMANENT_ADDR",Width:60,Align:"Center",Edit:0},
		 	{Header:"",Type:"Text",SaveName:"isa_PER_ADDR_DETAIL",Width:60,Align:"Center",Edit:0},
		 	
		 	{Header:"",Type:"Text",SaveName:"isa_MARRIAGE_CODE",Width:60,Align:"Center",Edit:0 },
		 	{Header:"",Type:"Text",SaveName:"isa_HOUSE_CODE",Width:60,Align:"Center",Edit:0 },
		 	{Header:"",Type:"Text",SaveName:"isa_LIVING_CODE",Width:60,Align:"Center",Edit:0 },
		 	
		 	{Header:"",Type:"Text",SaveName:"isa_RELIGION_CODE",Width:60,Align:"Center",Edit:0},
		 	{Header:"",Type:"Text",SaveName:"isa_HOBBY_CODE",Width:60,Align:"Center",Edit:0 },
		 	{Header:"",Type:"Text",SaveName:"isa_SPECIALTY_CODE",Width:60,Align:"Center",Edit:0},
		 	
		 	{Header:"",Type:"Text",SaveName:"religion_DETAI",Width:60,Align:"Center",Edit:0},
		 	{Header:"",Type:"Text",SaveName:"hobby_DETAI",Width:60,Align:"Center",Edit:0},
		 	{Header:"",Type:"Text",SaveName:"specialty_DETAI",Width:60,Align:"Center",Edit:0},
		 	
		 	{Header:"",Type:"Text",SaveName:"isa_MILITARY_CODE",Width:60,Align:"Center",Edit:0,Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_MYEONJE",Width:60,Align:"Center",Edit:0,Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_MIL_NUM",Width:60,Align:"Center",Edit:0,Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_MILI_STA_DATE",Width:60,Align:"Center",Edit:0,Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_MILI_END_DATE",Width:60,Align:"Center",Edit:0,Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_POS_CODE",Width:60,Align:"Center",Edit:0,Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_GUNBYEOL_CODE",Width:60,Align:"Center",Edit:0,Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_BOTS_CODE",Width:60,Align:"Center",Edit:0,Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_YEBIGUN_CODE",Width:60,Align:"Center",Edit:0,Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_DISCHARGE_CODE",Width:60,Align:"Center",Edit:0,Hidden:1},
		 	{Header:"",Type:"Text",SaveName:"isa_MILITARY_CLASS_CODE",Width:60,Align:"Center",Edit:0,Hidden:1},
		 	
		 	{Header:"사진",Type:"Text",SaveName:"photo",Width:50, Edit:0},
		 	{Header:"사진삭제",Type:"Button",SaveName:"photo_delete",Edit:0,Width:50}
      	];
		
   		//mySheet4 //가족
		initData.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center",Edit:0},
			{Header:"NO",Type:"Seq", Align:"Center",Edit:0},
			{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50,Edit:0},
			{Header:"", Type:"Text", SaveName:"pk_FAM_CODE", Align:"Center",Edit:0},
			{Header:"성명",Type:"Text", SaveName:"fam_NAME", Width:100, Align:"Left", Align:"Center",Edit:0},
          	{Header:"관계",Type:"Combo", SaveName:"fam_RELATIONS", Width:60, Align:"Center",Edit:0},
          	{Header:"동거여부",Type:"Combo", SaveName:"fam_LIVE", Width:60, Align:"Center",Edit:0},
          	{Header:"주민등록번호",Type:"Text", SaveName:"fam_RES_NUM", Format: "IdNo", Width:120, Align:"Center",Edit:0},
          	{Header:"수당여부",Type:"Combo", SaveName:"fam_SUDANG", Width:60, Align:"Center",Edit:0},
          	{Header:"장애인구분",Type:"Combo", SaveName:"fam_DISABLED_CODE", ComboText:"|비해당|장애인복지법|국가유공자|중증환자", ComboCode:"|비해당|장애인복지법|국가유공자|중증환자", Width:120, Align:"Center",Edit:0},
          	{Header:"내외국인",Type:"Combo", SaveName:"fam_LOCAL_CODE", ComboText:"|내국인|외국인", ComboCode:"|내국인|외국인" ,Width:60, Align:"Center",Edit:0},
          	{Header:"생년월일",Type:"Text", SaveName:"fam_BIRTH_DATE", Width:60, Align:"Center",Edit:0},
          	{Header:"양음구분",Type:"Combo", SaveName:"fam_SOLAR_CODE", Width:60, Align:"Center",Edit:0},
          	{Header:"학력",Type:"Combo", SaveName:"fam_HAGLYEOG_CODE", Width:60, Align:"Center",Edit:0},
          	{Header:"졸업구분",Type:"Combo", SaveName:"fam_GRADUATION_CODE", Width:60, Align:"Center",Edit:0},
          	{Header:"직업",Type:"Text", SaveName:"fam_JOB", Width:60, Align:"Center",Edit:0},
          	{Header:"직장명",Type:"Text", SaveName:"fam_WORK_NAME", Width:60, Align:"Center",Edit:0},
          	{Header:"직위",Type:"Text", SaveName:"fam_POSITION", Width:60, Align:"Center",Edit:0},
          	{Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center",Edit:0}
       	];
		
		createIBSheet2($("#ib-container1")[0],"mySheet4", "890px", "300px");
       	IBS_InitSheet(mySheet4,initData);
		
		//mySheet5 //학력
       	initData.Cols = [
       		{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center",Edit:0},
			{Header:"NO",Type:"Seq", Align:"Center",Edit:0},
			{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50,Edit:0},
			{Header:"", Type:"Text", SaveName:"pk_HL_CODE", Align:"Center",Edit:0},
            {Header:"학교명",Type:"Text", SaveName:"hl_SCHOOL_CODE", Width:100, Align:"Center",Edit:0},
            {Header:"입학일",Type:"Date", SaveName:"hl_STA_DATE", Width:120, Align:"Center",Edit:0},
            {Header:"졸업일",Type:"Date", SaveName:"hl_END_DATE", Width:120, Align:"Center",Edit:0},
            {Header:"구분",Type:"Text", SaveName:"hl_SORT_CODE", Width:60, Align:"Center",Edit:0},
            {Header:"소재지",Type:"Text", SaveName:"hl_LOCATION", Width:60, Align:"Center",Edit:0},
            {Header:"전공과목",Type:"Text", SaveName:"hl_MAJOR_CODE", Width:60, Align:"Center",Edit:0},
            {Header:"부전공",Type:"Text", SaveName:"hl_MINOR_CODE", Width:60, Align:"Center",Edit:0},
            {Header:"학위구분",Type:"Text", SaveName:"hl_DEGREE", Width:60, Align:"Center",Edit:0},
            {Header:"주야",Type:"Text", SaveName:"hl_JUYA_CODE", Width:60, Align:"Center",Edit:0},
            {Header:"본교",Type:"Text", SaveName:"hl_MAIN_CODE", Width:60, Align:"Center",Edit:0},
            {Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center",Edit:0}
        ];
   
          createIBSheet2($("#ib-container2")[0],"mySheet5", "890px", "300px");
          IBS_InitSheet(mySheet5,initData);
          
      //mySheet6 //경력
        initData.Cols = [
        	{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center",Edit:0},
        	{Header:"NO",Type:"Seq", Align:"Center",Edit:0},
        	{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50,Edit:0},
        	{Header:"경력코드",Type:"Text",SaveName:"pk_CAR_CODE", Align:"Center",Edit:0},
            {Header:"직장명",Type:"Text", SaveName:"car_NAME", Width:120, Align:"Center",Edit:0},
            {Header:"입사일",Type:"Date", SaveName:"car_STA_DATE", Width:120, Align:"Center",Edit:0},
            {Header:"퇴사일",Type:"Date", SaveName:"car_END_DATE", Width:120, Align:"Center",Edit:0},
//             {Header:"근무년한",Type:"Text", SaveName:"car_DATE", Format:"##년/##월", Width:60, Align:"Center"},
            {Header:"담당업무",Type:"Text", SaveName:"car_DANDANG", Width:100, Align:"Center",Edit:0},
            {Header:"직위",Type:"Text", SaveName:"car_POSITION", Width:100, Align:"Center",Edit:0},
            {Header:"급여",Type:"Int", SaveName:"car_SALARY", "Format": "#,### 원", Width:100, Align:"Center",Edit:0},
            {Header:"퇴직사유",Type:"Text", SaveName:"car_RESIGN", Width:120, Align:"Center",Edit:0},
            {Header:"근속기",Type:"Combo", SaveName:"car_GEUNSOG_CODE", Width:60, Align:"Center",Edit:0},
            {Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center",Edit:0}
        ];
         
        createIBSheet2($("#ib-container3")[0],"mySheet6", "890px", "300px");
      IBS_InitSheet(mySheet6,initData);
      
      //mySheet7 //면허/자격
        initData.Cols = [
        	{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center",Edit:0},
        	{Header:"NO",Type:"Seq", Align:"Center",Edit:0},
        	{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50,Edit:0},
        	{Header:"자격코드",Type:"Text",SaveName:"pk_CERTIFICATE_CODE", Align:"Center",Edit:0},
            {Header:"자격종류",Type:"ComboEdit", SaveName:"certificate_SORT_CODE", Width:150, Align:"Left",Edit:0},
            {Header:"취득일",Type:"Date", SaveName:"certificate_STA_DATE", Width:60, Align:"Center",Edit:0},
            {Header:"만료일",Type:"Date", SaveName:"certificate_END_DATE", Width:60, Align:"Center",Edit:0},
            {Header:"자격증번호",Type:"Text", SaveName:"certificate_NUM", Width:60, Align:"Center",Edit:0},
            {Header:"발행기관",Type:"ComboEdit", SaveName:"certificate_ISSUER_CODE", Width:60, Align:"Center",Edit:0},
            {Header:"수당",Type:"Combo", SaveName:"certificate_SUDANG_CODE", Width:60, Align:"Center",Edit:0},
            {Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center",Edit:0}
        ];
          
        createIBSheet2($("#ib-container4")[0],"mySheet7", "890px", "300px");
        IBS_InitSheet(mySheet7,initData);
        
      //mySheet8 //인사발령
      initData.Cols = [
         {Header:"NO",Type:"Status",SaveName:"Seq", Align:"Center",Edit:0},
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
           
		createIBSheet2($("#ib-container5")[0],"mySheet8", "890px", "320px");
		IBS_InitSheet(mySheet8,initData);
		
		//mySheet9 //인사고과
		initData.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center",Edit:0},
        	{Header:"NO",Type:"Seq", Align:"Center",Edit:0},
        	{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50,Edit:0},
        	{Header:"고과코드",Type:"Text",SaveName:"pk_ASS_CODE", Align:"Center",Edit:0},
			{Header:"고과명",Type:"Text", SaveName:"ass_NAME", Width:60, Align:"Center",Edit:0}, // Combo를...
			{Header:"평가시작일",Type:"Date", SaveName:"ass_STA_DATE", Width:60, Align:"Center",Edit:0},
			{Header:"평가종료일",Type:"Date", SaveName:"ass_END_DATE", Width:60, Align:"Center",Edit:0},
			{Header:"고과일",Type:"Date", SaveName:"ass_DATE", Width:60, Align:"Center",Edit:0},
			{Header:"고과자",Type:"Text", SaveName:"fk_ASS_PER_CODE", Width:60, Align:"Center",Edit:0},
			{Header:"반영률",Type:"Float", SaveName:"ass_REFLECTANCE", Width:60, Align:"Center", Format:"#,##0.00",Edit:0},
			{Header:"점수",Type:"Float", SaveName:"ass_SCORE", Width:60, Align:"Center", Format:"#,##0.00",Edit:0},
			{Header:"등급",Type:"Text", SaveName:"ass_CLASS", Width:60, Align:"Center",Edit:0},
			{Header:"비고",Type:"Text", SaveName:"ass_NOTE", Width:60, Align:"Center",Edit:0},
			{Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center",Edit:0}
		];
           
		createIBSheet2($("#ib-container6")[0],"mySheet9", "890px", "320px");
		IBS_InitSheet(mySheet9,initData);
		
		//mySheet10 //출장
		initData.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center",Edit:0},
        	{Header:"NO",Type:"Seq", Align:"Center",Edit:0},
        	{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50,Edit:0},
        	{Header:"출장코드",Type:"Text",SaveName:"pk_CHJ_CODE", Align:"Center",Edit:0},
			{Header:"출장국가",Type:"ComboEdit", SaveName:"chj_COUNTRY_CODE", Width:60, Align:"Center",Edit:0},
			{Header:"출장지",Type:"Text", SaveName:"chj_AREA", Width:60, Align:"Center",Edit:0},
			{Header:"시작일",Type:"Date", SaveName:"chj_STA_YMD", Width:60, Align:"Center",Edit:0},
			{Header:"종료일",Type:"Date", SaveName:"chj_END_YMD", Width:60, Align:"Center",Edit:0},
			{Header:"항공료",Type:"Int", SaveName:"chj_AIRFARE", Width:60, Align:"Center",Format:"#,###원",Edit:0},
			{Header:"본인부담",Type:"Int", SaveName:"chj_OWN", Width:60, Align:"Center",Format:"#,###원",Edit:0},
			{Header:"회사부담",Type:"Int", SaveName:"chj_COMPANY", Width:60, Align:"Center",Format:"#,###원",Edit:0},
			{Header:"기타비용",Type:"Int", SaveName:"chj_OTHER", Width:60, Align:"Center",Format:"#,###원",Edit:0},
			{Header:"총비용",Type:"Int", SaveName:"chj_TOTAL", Width:60, Align:"Center",CalcLogic:"|chj_AIRFARE|+|chj_OWN|+|chj_COMPANY|+|chj_OTHER|", Format:"#,###원",Edit:0},
			{Header:"목적",Type:"Text", SaveName:"chj_PURPOSE", Width:60, Align:"Center",Edit:0},
			{Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center",Edit:0}
		];
           
		createIBSheet2($("#ib-container7")[0],"mySheet10", "890px", "320px");
		IBS_InitSheet(mySheet10,initData);
		
		//mySheet11 //상벌관리
		initData.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center",Edit:0},
        	{Header:"NO",Type:"Seq", Align:"Center",Edit:0},
        	{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", Width:35, MinWidth:50,Edit:0},
        	{Header:"상벌코드",Type:"Text",SaveName:"pk_SB_CODE", Align:"Center",Edit:0},
			{Header:"구분",Type:"Combo", SaveName:"sb_DIVISION", Width:60, Align:"Center", ComboText:"|포상|징계", ComboCode:"|포상|징계",Edit:0},
			{Header:"포상/징계명",Type:"Text", SaveName:"sb_NAME", Width:100, Align:"Center",Edit:0}, // Combo를 쓸 필요가 있나..?
			{Header:"포상/징계일",Type:"Date", SaveName:"sb_DATE", Width:100, Align:"Center",Edit:0},
			{Header:"포상/징계내역",Type:"Text", SaveName:"sb_DETAILS", Width:100, Align:"Center",Edit:0},
			{Header:"시행처",Type:"Text", SaveName:"sb_SIHAENGCHEO", Width:60, Align:"Center",Edit:0},
			{Header:"금액",Type:"Int", SaveName:"sb_AMOUNT", Width:60, Align:"Center",Format:"#,###원",Edit:0},
			{Header:"징계시작일",Type:"Date", SaveName:"sb_STA_DATE", Width:100, Align:"Center",Edit:0},
			{Header:"징계종료일",Type:"Date", SaveName:"sb_END_DATE", Width:100, Align:"Center",Edit:0},
			{Header:"비고",Type:"Text", SaveName:"sb_NOTE", Width:60, Align:"Center",Edit:0},
			{Header:"추가",Type:"Button", SaveName:"fam_ADD", Width:60, Align:"Center",Edit:0}
		];
           
		createIBSheet2($("#ib-container8")[0],"mySheet11", "890px", "320px");
		IBS_InitSheet(mySheet11,initData);
		
		
		$("#religion_DETAI").hide();
		$("#hobby_DETAI").hide();
		$("#specialty_DETAI").hide();
		
		create();
		
		$("#refreshBtn").click(function(e){
			e.preventDefault();
			create();
			create2();
		});
		
		function create(){
			$.ajax({
   	   			url: "captcha",
   	   			type:"post", 
   	   			success: function(){
	   	   			$("#captcha img").attr("src", "${pageContext.request.contextPath}/captcha?"+Math.random());
   	   			}
			});
		}
		
		create2();
		
		function create2(){
			$.ajax({
   	   			url: "getCAPTCHA",
   	   			type:"post", 
   	   			success: function(result){
   	   				console.log(result);
	   				$("#captchaAnswer").val(result);
   	   			}
			});
		}
		
		ISA();
		
		PK_SAWON_CODE = "${sessionScope['PK_SAWON_CODE']}";
		
		mySheet4.DoSearch("${pageContext.request.contextPath}/myISA_fam", PK_SAWON_CODE);
		mySheet5.DoSearch("${pageContext.request.contextPath}/myISA_hl", PK_SAWON_CODE);
		mySheet6.DoSearch("${pageContext.request.contextPath}/myISA_car", PK_SAWON_CODE);
		mySheet7.DoSearch("${pageContext.request.contextPath}/myISA_cert", PK_SAWON_CODE);
		mySheet9.DoSearch("${pageContext.request.contextPath}/myISA_ass", PK_SAWON_CODE);
		mySheet10.DoSearch("${pageContext.request.contextPath}/myISA_chj", PK_SAWON_CODE);
		mySheet11.DoSearch("${pageContext.request.contextPath}/myISA_sb", PK_SAWON_CODE);
		
	}
   
   	// 비밀번호 변경
   	function fn_changePWSave() {
   		if ( ! chkInputValue("#SAWON_PASSWORD", "현재 비밀번호를")) return false;
   		if ( ! chkInputValue("#newpw", "<s:message code="common.password"/>")) return false;
   		if ( ! chkInputValue("#newpw2", "<s:message code="common.passwordRe"/>")) return false;
   		if ( ! chkInputValue("#captchaInput", "자동입력방지문자")) return false;
	   		// 새로 입력한 비밀번호 확인과 일치여부
	   		if ( $("#newpw").val() !== $("#newpw2").val()){
	   			alert("<s:message code="msg.err.noMatchPW"/>");
	   			return false;
	   		}
	   		// 새로 입력한 비밀번호와 이전비밀번호 동일여부 확인
	   		if ( $("#newpw").val() == $("#SAWON_PASSWORD").val()){
	   			alert("동일한 비밀번호를 입력하셨습니다.");
	   			return false;
	   		}
   			// 새로 입력한 비밀번호 조합여부 및 자리수 확인
   			var password = $("#newpw").val();
   			var id = $("#PK_SAWON_CODE").val();
   			if(!/^[a-zA-Z0-9]{8,15}$/.test(password)){
   				alert('숫자와 영문자 조합으로 8~15자리를 사용해야 합니다.');
   			return false;
   			}
   			var checkNumber = password.search(/[0-9]/g);
   			var checkEnglish = password.search(/[a-z]/ig);

   			if(checkNumber <0 || checkEnglish <0){
   				alert("숫자와 영문자를 혼용하여야 합니다.");
   			return false;
   			}

   			if(/(\w)\1\1\1/.test(password)){
   				alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
   			return false;
   			}
   			if(password.search(id) > -1){
   				alert("비밀번호에 아이디가 포함되었습니다.");
   			return false;
   			}
   		
   		var captcha = $("#captchaInput").val(); // 입력값
   		var answer = $("#captchaAnswer").val(); // 정답
   		if (answer == captcha){
   			$.ajax({
   	   			url: "changePWSave",
   	   			type:"post", 
   	   			data : {newpw:$("#newpw").val(),
   	   			SAWON_PASSWORD:$("#SAWON_PASSWORD").val()
   	   				},
   	   			success: function(result){
   	   					alert(result);
   	   			}
   	   		})
   		} else {
   			alert("자동입력방지 문자가 일치하지 않거나 비밀번호가 일치하지 않습니다.");
   		}
   	}	
   
	// 조회 이전에 테이블/ibSheet에 checkBox 값을 넣어준다.
	function mySheet_OnBeforeSearch() {  
		var info4 = ""; // 관계
		var info5 = ""; // 졸업
		var info6 = ""; // 학력
		var info10 = ""; // 학교명
		var info11 = ""; // 전공코드
		var info12 = ""; // 주야구분
		var info13 = ""; // 본분교구분
		var info14 = ""; // 면허/자격
		var info15 = ""; // 발행기관
// 		var info16 = ""; // 고과명
		var info17 = ""; // 출장국가
// 		var info18 = ""; // 상벌
		
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
			//--------------------------------------------------------------------- 경력
						case 'S1': // 해당여부 - 해당/비해당
							info8 = info8 + info1;
							break;
						case 'S6': // 여부코드(함/안함)
							info7 = info7 + info1;
							break;
						case 'S3': // 양음구분코드(양/음)
							info9 = info9 + info1;
							break;
			//--------------------------------------------------------------------- 경력
						case 'H9': // 면허/자격
							info14 = info14 + info1;
							break;
						case 'RO': // 발행기관
							info15 = info15 + info1;
							break;	
			//--------------------------------------------------------------------- 인사고과
// 						case 'H3': // 고과명 
// 							info16 = info16 + info1;
// 							break;
			//--------------------------------------------------------------------- 출장
						case 'H5': // 출장국가
							info17 = info17 + info1
							break;
			//--------------------------------------------------------------------- 상벌관리
// 						case 'H8': // 징계/포상명 - 상벌
// 							info18 = info18 + info1;
// 							break;	
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
				S1 = {'ComboCode':info8,'ComboText':info8}; // 여부코드(해당/비해당)
				H9 = {'ComboCode':info14,'ComboText':info14}; // 여부코드(해당/비해당)
				RO = {'ComboCode':info15,'ComboText':info15}; // 여부코드(해당/비해당)
// 				H3 = {'ComboCode':info16,'ComboText':info16}; // 고과명
				H5 = {'ComboCode':info17,'ComboText':info17}; // 출장국가
// 				H8 = {'ComboCode':info18,'ComboText':info18}; // 포상/징계명
				S6 = {'ComboCode':info7,'ComboText':info7}; // 여부코드(함/안함)
				S3 = {'ComboCode':info9,'ComboText':info9}; // 양음구분(양/음)
			},
			error : function(jqxhr, status, error) {
				alert("에러 : mySheet_OnBeforeSearch");
			}
		});
	};
	
	 // table에 값을 넣는다. 
	function ISA(){
		$.ajax({ // 
			url : "${contextPath}/human/p0001/ISA_cha.do",//목록을 조회 할 url
			type : "POST",
			dataType : "JSON",
			data: {"fk_ISA_SAWON_CODE":"${sessionScope['PK_SAWON_CODE']}", "pk_SAWON_CODE":"${sessionScope['PK_SAWON_CODE']}"},
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
				 	
			},
			error : function(jqxhr, status, error) {
				alert("ISA_에러");
			}
		});
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
         <h1 class="page-header"><i class="fa fa-info-circle fa-fw"></i> <s:message code="main.myinfo"/></h1>
      </div>
      <!-- /.col-lg-12 -->
   </div>
  
	<!-- 		; fn_formSubmit() -->
		<div class="clear hidden"></div>
		
		
  <div class="frame">          
            <!-- /.row -->
  <div class="container" style="padding:0px; margin-left:0px;">
	<%-- nav (왼쪽 layout)시작 --%>

  	<div class="nav">
  	
  		<div class="main_content">
					
					<div class="row">
		            	<div class="col-lg-10">
		                       	
		                       	<form id="form1" name="form1">
		                       	<c:forEach var="listview" items="${listview}" varStatus="status">
		                       		<div class="row form-group">
			                            <div class="col-lg-1"></div>
			                            <!--이미지 미리보기 되는 곳 -->
										<div class="col-sm-3" style="width:100%;">
											<img id="previewImg" style="width:100%; height: 120px; max-width: 100px;" src="fileDownload?downname=<c:out value="${PHOTO}"/>" align="left">
											<label class="col-lg-2" style="margin-left: 15px;">성명</label>
				                            <div class="col-lg-8" style="margin-left: 15px;">
				                            	<input type="text" class="form-control" id="SAWON_NAME" name="SAWON_NAME" value="<c:out value="${SAWON_NAME}"/>" maxlength="20" readonly>
				                            </div>
				                            <label class="col-lg-2" style="margin-left: 15px;">사번</label>
				                            <div class="col-lg-8" style="margin-left: 15px;">
				                            	<input type="text" class="form-control" id="PK_SAWON_CODE" name="PK_SAWON_CODE" value="<c:out value="${PK_SAWON_CODE}"/>" maxlength="20" readonly>
				                            </div>
										</div>
			                        </div> 
			                    	<div class="row form-group">
			                    		<div class="col-sm-3" style="width:100%;">
				                            <label class="col-lg-3" >부서명</label>
				                            <div class="col-lg-8" style="margin-left: 19px;">
				                            	<input type="text" class="form-control" id="FK_DEPT_NAME" name="FK_DEPT_NAME" value="<c:out value="${listview.FK_DEPT_NAME}"/>" readonly>
				                            </div>
			                            </div>
			                            <br><br><br>
			                            <div class="col-sm-3" style="width:100%;">
				                            <label class="col-lg-3" >직급</label>
				                            <div class="col-lg-8" style="margin-left: 19px;">
				                            	<input type="text" class="form-control" id="RANK_NAME" name="RANK_NAME" value="<c:out value="${listview.RANK_NAME}"/>" maxlength="20" readonly>
				                            </div>
			                            </div>
			                            <br><br><br>
			                            <div class="col-sm-3" style="width:100%;">
				                            <label class="col-lg-3" >직책</label>
				                            <div class="col-lg-8" style="margin-left: 19px;">
				                            	<input type="text" class="form-control" id="PK_SAWON" name="PK_SAWON" value="" maxlength="20" readonly>
				                            </div>
			                            </div>
			                            <br><br><br>
			                            <div class="col-sm-3" style="width:100%;">
				                            <label class="col-lg-3" >입사년월</label>
				                            <div class="col-lg-8" style="margin-left: 19px;">
				                            	<input type="text" class="form-control" id="SAWON_JOIN_DATE" name="SAWON_JOIN_DATE" value="<c:out value="${listview.SAWON_JOIN_DATE}"/>" maxlength="20" readonly>
				                            </div>
			                            </div>
			                        </div>
			                    	<div class="row form-group" id="pwDiv">
			                    		<div class="col-sm-3" style="width:100%;">
				                            <label class="col-lg-3" >비밀번호</label>
				                            <div class="col-lg-8" style="margin-left: 19px;">
				                            	<input type="password" class="form-control" placeholder="현재비밀번호" id="SAWON_PASSWORD" name="SAWON_PASSWORD" value="" maxlength="20" >
				                            </div>
			                            </div>
			                             <br><br><br>
			                            <div class="col-sm-3" style="width:100%;">
				                            <label class="col-lg-3" ></label>
				                            <div class="col-sm-4" style="margin-left: 19px;">
				                           		<input type="password" class="form-control" placeholder="새비밀번호" id="newpw" name="newpw" maxlength="20">
				                           	</div>
				                           	<div class="col-sm-4">
				                           		<input type="password" class="form-control" placeholder="확인"id="newpw2" name="newpw2" maxlength="20">
				                           	</div>
			                            </div>
			                            <br><br><br>
			                            
										<!-- 캡챠 -->
										<div class="col-sm-3" style="width:100%;">
				                            <label class="col-lg-3" ></label>
				                            <div class="col-sm-8" style="margin-left: 19px; font-size:11px;">
				                     	※ 비밀번호 변경규칙<br>
										1. 숫자와 영문자 조합으로 8~15자리 이내<br>
										2. 같은 문자를 4번 이상 사용불가<br>
										3. 비밀번호에 아이디 포함불가<br><br>
		                            	 아래 이미지를 보이는 대로 입력해주세요.
												<div id="captcha"><img/></div>
												<br/><input type="text" class="form-control" placeholder="자동입력방지문자 입력" id="captchaInput" name="captchaInput"/>
												<div id="captchaAnswer"><input type="hidden" id="captchaAnswer" name="captchaAnswer" value=""/>
												</div>
			                            	</div>
			                            </div>
			                        </div>
			                    </c:forEach>	 
			                	</form>
			                	
			                	<button type="button" class="btn btn-primary" onclick="fn_changePWSave()">비밀번호변경</button>     
			                	<button type="button" class="btn btn-primary" id="refreshBtn">새로고침</button>
			                	<br><br><br>
						</div>	  
						            
		            </div>
		            
					
		</div> <!-- main content -->
	</div> 	<!-- nav -->	
	
	
	<div class="content">
			<!-- right -->
			<div style="height:100%;width:100%;float:left">
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
									<td class="bg02_l"><input type="text" id="isa_HANJA_NAME" style="width: 98%; background-color: #eee;" readonly></td>
									<td class="bg01_r">채용구분</td>
									<td class="bg02_l">
										<select id="isa_HIRE_CODE" style="width: 80px; background-color: #eee;" class="select_02" disabled>
												<option value="" ></option>
										</select>
									</td>
									<td class="bg01_r">기수</td>
									<td class="bg02_l"><input type="text" id="isa_NUM" style="width: 98%; background-color: #eee;" readonly></td>
								</tr>
								
								<tr>
									<td class="bg01_r">현주소</td>
									<td>
										<input type="text" id="isa_ADDR_ZIP" size="10px" style="background-color: #eee;" readonly>
									</td>
									<td class="bg02_l" colspan="4">
										<input type="text" id="isa_ADDRESS" size="50px" style="width:100%; background-color: #eee;" readonly>
									</td>
								</tr>
	   							<tr>
		   							<td class="bg01_r"></td><!-- 이름 변경해야함 -->
		   							<td class="bg02_l" colspan="5"><input type="text" id="isa_ADDR_DETAIL" size="50px" style="width:100%; background-color: #eee;" readonly></td>
	   							</tr>
	   							
								<tr>
									<td class="bg01_r">등록기준지</td><!-- 이름 변경해야함 -->
									<td>
										<input type="text" id="isa_PER_ADDR_ZIP" size="10px" style="background-color: #eee;" readonly>
									</td>
									<td class="bg02_l" colspan="5"><input type="text" id="isa_PERMANENT_ADDR" size="50px" style="width:100%; background-color: #eee;" readonly></td>
								</tr>
								<tr><!-- 이름 변경해야함 -->
									<td class="bg01_r"></td><!-- 이름 변경해야함 -->
									<td class="bg02_l" colspan="5"><input type="text" id="isa_PER_ADDR_DETAIL" size="50px" style="width:100%; background-color: #eee;" readonly></td>
								</tr>
								<tr>
									<td class="bg01_r">결혼여부</td>
									<td class="bg02_l">
										<select id="isa_MARRIAGE_CODE" style="width: 80px; background-color: #eee;" class="select_02" disabled>
												<option value=""></option>
												<option value="미혼">미혼</option>
												<option value="기혼">기혼</option>
										</select>
									</td>
									<td class="bg01_r">주거구분</td>
									<td class="bg02_l">
										<select id="isa_HOUSE_CODE" style="width: 80px; background-color: #eee;" class="select_02" disabled>
												<option value=""></option>
										</select>
									</td>
									<td class="bg01_r">생활수준</td>
									<td class="bg02_l">
										<select id="isa_LIVING_CODE" style="width: 80px; background-color: #eee;" class="select_02" disabled>
												<option value=""></option>
										</select>
									</td>
								</tr>

                        <tr>
                           <td class="bg01_r">종교</td>
                           <td class="bg02_l">
                              <select id="isa_RELIGION_CODE" style="width: 80px; background-color: #eee;" class="select_02" onchange="direct_religion(this.value)" disabled>
                                 <option value=""></option>
                                 <option value="religion">직접입력</option>
                              </select>
                           </td>
                           <td colspan="4" class="bg02_l">
                              <input type="text" id="religion_DETAI" style="background-color: #eee;" readonly/>
                           </td>
                        </tr>
                     
                        <tr>
                           <td class="bg01_r">취미</td>
                           <td class="bg02_l">
                              <select id="isa_HOBBY_CODE" style="width: 80px; background-color: #eee;" class="select_02" onchange="direct_hobby(this.value)" disabled>
                                 <option value=""></option>
                                 <option value="hobby">직접입력</option>
                              </select>
                           </td>
                           <td colspan="4" class="bg02_l">
                              <input type="text" id="hobby_DETAI" style="background-color: #eee;" readonly/>
                           </td>
                        </tr>
                     
                        <tr>
                           <td class="bg01_r">특기</td>
                           <td class="bg02_l">
                              <select id="isa_SPECIALTY_CODE" style="width: 80px; background-color: #eee;" class="select_02" onchange="direct(this.value)" disabled>
                                 <option value=""></option>
                                 <option value="specialty">직접입력</option>
                              </select>
                           </td>
                           <!-- 처음 불러올 때 숨겨둔다. -->
                           <td colspan="4" class="bg02_l" >
                              <input type="text" id="specialty_DETAI" style="background-color: #eee;" readonly/>
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
                              <select id="isa_MILITARY_CODE" style="width: 80px; background-color: #eee;" class="select_02" disabled>
                                    <option value=""></option>
                              </select>
                           </td>
                           <td class="bg01_r">면제사유</td>
                           <td class="bg02_l">
                              <input type="text" id="isa_MYEONJE" style="width: 98%; background-color: #eee;" readonly>   
                           </td>
                           <td class="bg01_r">군번</td>
                           <td class="bg02_l"><input type="text" id="isa_MIL_NUM" style="width: 98%; background-color: #eee;" readonly></td>
                        </tr>
                        
                        <tr>
                           <td class="bg01_r">복무시작일</td>
                           <td class="bg02_l"><input type="text" id="isa_MILI_STA_DATE" style="width: 98%; background-color: #eee;" readonly></td>
                           
                           <td class="bg01_r">복무종료일</td>
                           <td class="bg02_l"><input type="text" id="isa_MILI_END_DATE" style="width: 98%; background-color: #eee;" readonly></td>
                           
                           <td class="bg01_r">복무기간포함</td>
                           <td class="bg02_l">
                              <select id="isa_POS_CODE" style="width: 80px; background-color: #eee;" class="select_02" disabled>
                                    <option value=""></option>
                              </select>
                           </td>
                        </tr>
                           
                        <tr>
                           <td class="bg01_r">군별</td>
                           <td class="bg02_l">
                              <select id="isa_GUNBYEOL_CODE" style="width: 80px; background-color: #eee;" class="select_02" disabled>
                                    <option value=""></option>
                              </select>
                           </td>
                           <td class="bg01_r">병과</td>
                           <td class="bg02_l">
                              <select id="isa_BOTS_CODE" style="width: 80px; background-color: #eee;" class="select_02" disabled>
                                    <option value=""></option>
                              </select>
                           </td>
                           <td class="bg01_r">예비군</td>
                           <td class="bg02_l">
                              <select id="isa_YEBIGUN_CODE" style="width: 80px; background-color: #eee;" class="select_02" disabled>
                                    <option value=""></option>
                              </select>
                           </td>
                        </tr>

                        <tr>
                           <td class="bg01_r">제대구분</td>
                           <td class="bg02_l">
                              <select id="isa_DISCHARGE_CODE" style="width: 80px; background-color: #eee;" class="select_02" disabled>
                                 <option value=""></option>
                              </select>
                           </td>
                           
                           <td class="bg01_r">계급</td>
                           <td class="bg02_l">
                              <select id="isa_MILITARY_CLASS_CODE" style="width: 80px; background-color: #eee;" class="select_02" disabled>
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
      </div> <!-- content -->
   </DIV> <!-- container -->
   
   </div> <!-- frame -->
   </div> <!-- page wrapper -->
   </div> <!-- wrapper -->
   
</body>
</html>