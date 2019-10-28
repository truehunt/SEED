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
		            if (url === "schList") {
		                urlToGo = "/SEED/schList";
		            } else if(url === "adCodeList"){
		            	urlToGo = "/SEED/adCodeList";
		            } else if(url === "bb"){
		            	urlToGo = "bb";
		            } else if(url === "cc"){
		            	urlToGo = "cc";
		            } else if(url === "dd"){
		            	urlToGo = "dd";
		            } else if(url === "ee"){
		            	urlToGo = "ee";
		            } else if(url === "ff"){
		            	urlToGo = "ff";
		            } else if(url === "gg"){
		            	urlToGo = "gg";
		            } else if(url === "hh"){
		            	urlToGo = "hh";
		            } else if(url === "a6"){
		            	urlToGo = "a6";
		            } else if(url === "a7"){
		            	urlToGo = "a7";
		            } else if(url === "a8"){
		            	urlToGo = "a8";
		            } else if(url === "a9"){
		            	urlToGo = "a9";
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
	                                <input class="form-control" type="text" name="globalKeyword" id="globalKeyword" placeholder="검색어를 입력하세요">
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
                            <a href='#' onClick="doAction(myTab,'내정보보기','chart','aa','aa'); return false"><i class="fa fa-envelope-o fa-fw"></i> 내정보보기</a>
                        </li>
                        <!-- 일정관리 -->             
                        <li>
                            <a href='#' onClick="doAction(myTab,'일정관리','chart','ib-chart-0','schList'); return false"><i class="fa fa-calendar fa-fw"></i> 일정관리</a>
                        </li>
                        <!-- 전자결재 -->
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 전자결재<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href='#' onClick="doAction(myTab,'미결재문서','chart','a6','a6'); return false">미결재문서</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'결재완료문서','chart','a7','a7'); return false">결재완료문서</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'전체미결문서','chart','a8','a8'); return false">전체미결문서</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'상신문서','chart','a9','a9'); return false">상신문서</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'임시보관','chart','b1','b1'); return false">임시보관</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'결재완료문서','chart','b2','b2'); return false">결재완료문서</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'회수/반려문서','chart','b3','b3'); return false">회수/반려문서</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'수신문서함','chart','b4','b4'); return false">수신문서함</a>
                                </li>
	                        </ul>                             
                        </li> 
                         <!-- 근태/연차 관리 -->
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i> 근태/연차관리<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href='#' onClick="doAction(myTab,'일일근태등록','chart','bb','bb'); return false">일일근태등록</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'월마감관리','chart','cc','cc'); return false">월마감관리</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'월근태마감','chart','dd','dd'); return false">월근태마감</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'휴일연장야간근무관리','chart','ee','ee'); return false">휴일연장야간근무관리</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'휴가조회신청','chart','ff','ff'); return false">휴가조회신청</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'출장조회신청','chart','gg','gg'); return false">출장조회신청</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'외근보고서작성','chart','hh','hh'); return false">외근보고서작성</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'휴가일수계산','chart','ii','ii'); return false">휴가일수계산</a>
                                </li>
	                        </ul>                             
                        </li> 
                        <!-- 급여/퇴직정산관리 -->
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i> 급여/퇴직정산관리<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href='#' onClick="doAction(myTab,'근태결과입력','chart','jj','jj'); return false">근태결과입력</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'급여입력 및 계산','chart','kk','kk'); return false">급여입력 및 계산</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'급여이체현황','chart','ll','ll'); return false">급여이체현황</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'퇴직기준설정','chart','mm','mm'); return false">퇴직기준설정</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'퇴직금산정','chart','nn','nn'); return false">퇴직금산정</a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'퇴직금산정현황','chart','oo','oo'); return false">퇴직금산정현황</a>
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
	                                    <a href='#' onClick="doAction(myTab,'인사기초코드등록','chart','ww','ww'); return false">인사기초코드등록</a>
	                                </li>
	                            </ul>
	                        </li>
	                        <li>
	                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> 인사관리<span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'인사기록카드','chart','xx','xx'); return false">인사기록카드</a>
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
                                 <a href='#' onClick="doAction(myTab,'결재문서양식','chart','a4','a4'); return false"><i class="fa fa-sitemap fa-fw"></i> 결재문서양식</a>
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