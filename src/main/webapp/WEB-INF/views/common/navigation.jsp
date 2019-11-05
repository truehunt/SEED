<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>



  		<link href="${pageContext.request.contextPath}/resources/ibsheet/tab/ibtab-style.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibleaders.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/ibsheet.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/tab/ibtab.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/ibsheet/tab/ibtabinfo.js" type="text/javascript"></script>

<script>

$(document).ready(function(){
		        var tabBar = $("#ib-tabs")[0], // 탭바 컨테이너 객체
		            contents = $("#ib-contents")[0]; // 콘텐츠 컨테이너 객체
	
		        var idSheet = 0,
		            idChart = 0;
	
		        createIBTab(tabBar, contents, "myTab", {
		            widthTabBar: "100%", // 탭바 너비
		            widthContents: "100%", // 콘탠츠 너비
		            heightContents: "886px", // 콘텐츠 높이
		            themes: {
		                tabs: "simple_under_blue", // 탭바 테마
		                contents: "simple_under_blue", // 콘텐츠 테마
		                contextMenu: "simple_under_blue" // 콘텍스트메뉴 테마
		            }
		        });
		        
		        myTab.setOptions({
			        tabs: [{
		                title: "MAIN",
		                hold: true,
		                style: {
		                    btnClose: false,
		                    icon: "none"
		                }
		            }],
		            contents: [{
		            	type:"iframe",
		            	contents: "/SEED/indexCalen",
		            	height: "180px"
		               // contents: "<div><iframe src='/SEED/index'></div>"
		            }],
		            customZone:{
		                width:"0px"
	             	}	
		        });
});

		    function doAction(elId, title, type, id, url) {
		        var Tab = null,
		            idxTab = 0,
		            urlToGo = "",
		            bFindTab = false;
		        if (elId) {
		            if (url === "schList") { // 일정관리
		                urlToGo = "/SEED/schList"; 
		            } else if(url === "adCodeList"){ // 공통코드관리
		            	urlToGo = "/SEED/adCodeList"; 
		            } else if(url === "adSignDocTypeList"){ // 결재문서양식관리
		            	urlToGo = "/SEED/adSignDocTypeList";
		            } else if(url === "signDocTypeList"){ // 기안하기 
		            	urlToGo = "/SEED/signDocTypeList";
		            } else if(url === "signListTobe"){ // 개인문서함 -> 결재 받을(은) 문서 - 전체, 임시저장, 진행중, 완료, 반려
		            	urlToGo = "/SEED/signListTobe";
		            } else if(url === "signListTo"){ // 결재문서함 -> 결재 할(한) 문서 - 진행중, 완료
		            	urlToGo = "/SEED/signListTo";
		            } else if(url === "pay/p0001/TA_input.do"){ // 근태 결과 입력
		            	urlToGo = "pay/p0001/TA_input.do";
		            } else if(url === "day_regist_sawon"){
		            	urlToGo = "/SEED/attendance/p0001/day_regist_sawon.do";
		            } else if(url === "ad_day_regist"){
		            	urlToGo = "/SEED/attendance/p0001/day_regist.do";
		            } else if(url === "a6"){
		            	urlToGo = "a6";
		            } else if(url === "a7"){
		            	urlToGo = "a7";
		            } else if(url === "a8"){
		            	urlToGo = "a8";
		            } else if(url === "adcompany_Enroll"){ // 등록정보관리 - 회사등록
		            	urlToGo = "/SEED/human/s0001/company_Enroll.do";
		            } else if(url === "b1"){
		            	urlToGo = "b1";
		            } else if(url === "b2"){
		            	urlToGo = "b2";
		            } else if(url === "b3"){
		            	urlToGo = "b3";
		            } else if(url === "b4"){
		            	urlToGo = "b4";
		            } else if(url === "b5"){
		            	urlToGo = "b5";
		            } else if(url === "b6"){
		            	urlToGo = "b6";
		            }	else if(url === "code"){ // 인사기초코드 등록
		            	urlToGo = "/SEED/system/p0001/insa_code.do"
		            } else if(url === "card"){	// 인사기록카드
		            	urlToGo = "/SEED/human/p0001/insa_card.do"
		            }
	
		            Tab = elId.findTabId(id);
	
		            if (typeof Tab !== "undefined") {
		                bFindTab = true;
		                idxTab = Tab.getIndex();
		            }
	
		            if (bFindTab) {
		                elId.goToTab(idxTab);
		            } else {
		                elId.addTab({
		                    tabs: {
		                        title: title,
		                        focus: true,
		                        id: id
		                    },
		                    contents: {
		                        type: "iframe",
		                        contents: urlToGo,
		                        preLoad: false
		                    }
		                });
		            }
		        }
		    }
</script>

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-brand" href="index"><s:message code="common.projectTitle"/></a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

	            <ul class="nav navbar-top-links navbar-right">
	                <!-- /.dropdown -->
                    <c:if test="${alertcount>0}">
		                <li class="dropdown">
		                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" onclick="showAlertList()">
		                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
		                        	<div class="msgAlert"><c:out value="${alertcount}"/></div>
		                    </a>
		                    <script>
		                    	function showAlertList(){
		                    		$.ajax({
		                    			url: "alertList4Ajax", 
		                    			dataType: "html",
		                    			type:"post", 
		                    			success: function(result){
		                    				if (result!=="") {
		                    					$("#alertlist").html(result);
		                    				}
		                    			}
		                    		})		                    		
		                    	}
		                    </script>
		                    <ul id="alertlist" class="dropdown-menu dropdown-alerts">
		                    </ul>
		                    <!-- /.dropdown-alerts -->
		                </li>
                    </c:if>
	                <!-- /.dropdown -->
	                <li class="dropdown">
	                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
	                    </a>
	                    <ul class="dropdown-menu dropdown-user">
	                        <li><a href="memberForm"><i class="fa fa-user fa-fw"></i> <c:out value="${sessionScope.SAWON_NAME}"/></a></li>
	                        <li><a href="searchMember"><i class="fa fa-users fa-fw"></i> <s:message code="memu.users"/></a></li>
	                        <li class="divider"></li>
	                        <li><a href="/SEED/memberLogout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
	                        </li>
	                    </ul>
	                    <!-- /.dropdown-user -->
	                </li>
	                <!-- /.dropdown -->
	            </ul>
	            <!-- /.navbar-top-links -->
            </div>
            <!-- /.navbar-header -->
            
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                           	<form id="searchForm" name="searchForm"  method="post" action="boardList">
                                <input type="hidden" name="searchType" value="brdtitle,brdmemo">
								<div class="input-group custom-search-form">
	                                <input class="form-control" type="text" name="globalKeyword" id="globalKeyword" placeholder="<s:message code="main.search"/>">
	                                <span class="input-group-btn">
	                                    <button class="btn btn-default" type="button" onclick="fn_search()">
	                                        <i class="fa fa-search"></i>
	                                    </button>
	                                </span>
	                            </div>                           	
                            </form>
	                                <script>
	                                	function fn_search(){
	                                		if ($("#globalKeyword").val()!=="") {
		                                		$("#searchForm").submit();
	                                		}
	                                	}
	                                	
	                                </script>                            <!-- /input-group -->
                        </li>
                        <!-- 일반 사원 단 조회 가능메뉴들 -->
                        <li>
                            <a href="#"> ESS</a>
                        </li>
                        <li>
                            <a href='#' onClick="doAction(myTab,'<s:message code="main.myinfo"/>','chart','aa','aa'); return false"><i class="fa fa-envelope-o fa-fw"></i> <s:message code="main.myinfo"/></a>
                        </li>
                        <!-- 일정관리 -->             
                        <li>
                            <a href='#' onClick="doAction(myTab,'<s:message code="main.cal"/>','chart','ib-chart-0','schList'); return false"><i class="fa fa-calendar fa-fw"></i> <s:message code="main.cal"/></a>
                        </li>
                        <!-- 전자결재 -->
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> <s:message code="main.sign"/><span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.signDoc"/>','chart','signDocTypeList','signDocTypeList'); return false"><s:message code="main.signDoc"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.signListTobe"/>','chart','signListTobe','signListTobe'); return false"><s:message code="main.signListTobe"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.signListTo"/>','chart','signListTo','signListTo'); return false"><s:message code="main.signListTo"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.signSend"/>','chart','b2','b2'); return false"><s:message code="main.signSend"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.signArrive"/>','chart','b4','b4'); return false"><s:message code="main.signArrive"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.signDept"/>','chart','b3','b3'); return false"><s:message code="main.signDept"/></a>
                                </li>
	                        </ul>                             
                        </li> 
                         <!-- 근태/연차 관리 -->
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i> <s:message code="main.T&A"/><span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.dailyReg"/>','chart','day_regist_sawon','day_regist_sawon'); return false"><s:message code="main.dailyReg"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.monthlyCls"/>','chart','ad_day_regist','ad_day_regist'); return false"><s:message code="main.monthlyCls"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.monthlyCls2"/>','chart','dd','dd'); return false"><s:message code="main.monthlyCls2"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.nightShift"/>','chart','ee','ee'); return false"><s:message code="main.nightShift"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.findHoliday"/>','chart','ff','ff'); return false"><s:message code="main.findHoliday"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.findBT"/>','chart','gg','gg'); return false"><s:message code="main.findBT"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.writeDoc"/>','chart','hh','hh'); return false"><s:message code="main.writeDoc"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.calHoliday"/>','chart','ii','ii'); return false"><s:message code="main.calHoliday"/></a>
                                </li>
	                        </ul>                             
                        </li> 
                        <!-- 급여/퇴직정산관리 -->
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i> <s:message code="main.pay"/><span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href='#'  onClick="doAction(myTab,'<s:message code="main.pay1"/>','chart','pay/p0001/ibsheet.do','pay/p0001/TA_input.do'); return false"><s:message code="main.pay1"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.pay2"/>','chart','kk','kk'); return false"><s:message code="main.pay2"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.pay3"/>','chart','ll','ll'); return false"><s:message code="main.pay3"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.pay4"/>','chart','mm','mm'); return false"><s:message code="main.pay4"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.pay5"/>','chart','nn','nn'); return false"><s:message code="main.pay5"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.pay6"/>','chart','oo','oo'); return false"><s:message code="main.pay6"/></a>
                                </li>
	                        </ul>                             
                        </li>
                        <!-- 관리자메뉴 --> 
                        <c:if test='${sessionScope.SAWON_VIEW_PERMISSION == "A"}'>  
	                        <li>
	                            <a href="#"> HSS</a>
	                        </li>
	                        <li>
	                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> 등록정보관리<span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'회사등록','chart','adcompany_Enroll','adcompany_Enroll'); return false">회사등록</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'사업장등록','chart','pp','pp'); return false">사업장등록</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'부서등록','chart','qq','qq'); return false">부서등록</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'사원등록','chart','rr','rr'); return false">사원등록</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'사용자권한설정','chart','ss','ss'); return false">사용자권한설정</a>
	                                </li>
	                            </ul>
	                        </li>
	                        <li>
	                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> 기초환경설정<span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'호봉테이블등록','chart','tt','tt'); return false">호봉테이블등록</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'급/상여 지급일자 등록','chart','uu','uu'); return false">급/상여 지급일자 등록</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'인사/급여환경설정','chart','vv','vv'); return false">인사/급여환경설정</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'인사기초코드등록','chart','code','code'); return false">인사기초코드등록</a>
	                                </li>
	                            </ul>
	                        </li>
	                        <li>
	                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> 인사관리<span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'인사기록카드','chart','card','card'); return false">인사기록카드</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'인사정보등록','chart','yy','yy'); return false">인사정보등록</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'인사발령등록','chart','zz','zz'); return false">인사발령등록</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'인사발령(사원별)','chart','a1','a1'); return false">인사발령(사원별)</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'인사발령공고','chart','a2','a2'); return false">인사발령공고</a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'인사발령리포트','chart','a3','a3'); return false">인사발령리포트</a>
	                                </li>
	                            </ul>
	                        </li>
                             <li>
                                 <a href='#' onClick="doAction(myTab,'결재문서양식','chart','adSignDocTypeList','adSignDocTypeList'); return false"><i class="fa fa-sitemap fa-fw"></i> 결재문서양식</a>
                             </li>
                             <li>
                                 <a href='#' onClick="doAction(myTab,'공통코드관리','chart','adCodeList','adCodeList'); return false"><i class="fa fa-sitemap fa-fw"></i> 공통코드관리</a>
                             </li>
	                	</c:if>
                        	        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
            
            
            
            </nav>
            
           <!--  <div id='ib-tabs'></div>  -->
			 <!--  <div id='ib-contents'></div> -->