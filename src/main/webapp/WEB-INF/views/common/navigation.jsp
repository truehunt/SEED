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
		            widthContents: "1620px", // 콘탠츠 너비
		            heightContents: "1650px", // 콘텐츠 높이
		            themes: {
		                tabs: "simple_under_blue", // 탭바 테마
		                contents: "simple_under_blue", // 콘텐츠 테마
		                contextMenu: "simple_under_blue" // 콘텍스트메뉴 테마
		            }
		        });
		        
		        myTab.setOptions({
			        tabs: [{
		                title: "<s:message code="main.tab"/>",
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
		            } else if(url === "myinfo"){ // 내정보보기 
		            	urlToGo = "myinfo"; 
		            } else if(url === "deptInfo"){ // 팀원정보보기
		            	urlToGo = "deptInfo"; 
		            } else if(url === "adCodeList"){ // 공통코드관리
		            	urlToGo = "/SEED/adCodeList"; 
		            } else if(url === "searchMember"){ // 사원조회(ESS)
		            	urlToGo = "searchMember";
		            } else if(url === "boardList"){ // 게시판(공지사항)
		            	urlToGo = "boardList";
		            } else if(url === "fn_search"){ // 검색바 검색
		            	var search = $("#globalKeyword").val();
		            	var searchType = "brdtitle,brdmemo,CU.SAWON_NAME";
                   		urlToGo = "boardList?globalKeyword=" + search +"&searchType="+ searchType;
		            // 전자결재
		            } else if(url === "adSignDocTypeList"){ // 결재문서양식관리
		            	urlToGo = "/SEED/adSignDocTypeList";
		            } else if(url === "signDocTypeList"){ // 기안하기 
		            	urlToGo = "/SEED/signDocTypeList";
		            } else if(url === "signListTobe"){ // 개인문서함 -> 결재 받을(은) 문서 - 전체, 임시저장, 진행중, 완료, 반려
		            	urlToGo = "/SEED/signListTobe";
		            } else if(url === "signListTo"){ // 결재문서함 -> 결재 할(한) 문서 - 진행중, 완료
		            	urlToGo = "/SEED/signListTo";
		            } else if(url === "signImageForm"){ // 결재이미지 등록
		            	urlToGo = "/SEED/signImageForm";
	            	// 급여관리
                  	} else if(url === "TA_input"){ // 근태 결과 입력
                     	urlToGo = "/SEED/pay/p0001/TA_input.do";
                  	} else if(url === "SALARY_calcul"){
                     	urlToGo = "/SEED/pay/p0002/SALARY_calcul.do";
                 	} else if(url === "SALARY_bo_sta"){
                     	urlToGo = "/SEED/pay/p0003/SALARY_bo_sta.do";
                  	} else if(url === "SALARY_spec"){ // 급여명세
                     	urlToGo = "/SEED/pay/p0004/SALARY_spec.do";
                  	} else if(url === "nn"){ // 연간급여현황
                     	urlToGo = "nn";
                  	} else if(url === "SET_payday"){
                      	urlToGo = "/SEED/system/p0001/SET_payday.do";
		            // 근태관리
		            } else if(url === "day_regist_sawon"){//사원 출퇴근
		            	urlToGo = "/SEED/attendance/p0001/day_regist_sawon.do";
		            } else if(url === "holiday"){//휴가
		            	urlToGo = "/SEED/attendance/p0002/holiday.do";
		            } else if(url === "business"){//출장
		            	urlToGo = "/SEED/attendance/p0002/business.do";
		           	//근태관리관리자
		            } else if(url === "Aday_regist"){//일일 마감관리
		            	urlToGo = "Aday_regist";
		            } else if(url === "Amonth"){//월 근태마감
		            	urlToGo = "Amonth";
		            } else if(url === "Along_time"){//휴일야간연장근무관리
		            	urlToGo = "Along_time";
		            } else if(url === "Aholiday_calc"){//휴가일수계산
		            	urlToGo = "Aholiday_calc";
		            } else if(url === "Aholiday_da"){//휴가조회
		            	urlToGo = "Aholiday_da";
		            } else if(url === "Abusiness_da"){//출장조회
		            	urlToGo = "Abusiness_da";
		            // 시스템환경설정
		            } else if(url === "adcompany_Enroll"){ // 등록정보관리 - 회사등록
		            	urlToGo = "/SEED/human/s0001/company_Enroll.do";
		            } else if(url === "adworkplace_Enroll"){// 등록정보관리 - 사업장등록
		            	urlToGo = "/SEED/human/s0002/workplace_Enroll.do";
		            } else if(url === "addept_Enroll"){// 등록정보관리 - 부서등록
		            	urlToGo = "/SEED/human/s0003/dept_Enroll.do";
		            } else if(url === "adSawon_Enroll"){ // 사원등록
		            	urlToGo = "adSawon_Enroll";
		            } else if(url === "adSawon_Permission"){ // 사용자권한
		            	urlToGo = "adSawon_Permission";
		            // 인적자원관리
		            }else if(url === "hobong"){
		            	urlToGo = "/SEED/system/p0001/hobong.do";
		            }else if(url === "code"){ // 인사기초코드 등록
		            	urlToGo = "/SEED/system/p0001/insa_code.do"
		            }else if(url === "card"){	// 인사기록카드
		            	urlToGo = "/SEED/human/p0001/insa_card.do"
		            }else if(url === "adInsa_infoEnroll"){	// 인사 정보 등록
		            	urlToGo = " /SEED/system/p0002/Insa_infoEnroll.do"
		            }else if(url === "ballyeong"){	// 인사발령
		            	urlToGo = "/SEED/human/p0002/insa_ballyeong.do"
		            }else if(url === "ballyeong_sawon"){	// 인사발령(사원별)
				     	urlToGo = "/SEED/human/p0002/insa_ballyeong_Sawon.do" 
		            }else if(url === "education"){	// 교육관리
		            	urlToGo = " /SEED/human/p0007/tab_education_manage.do"
		            }else if(url === "education_evaluation"){	// 교육관리
		            	urlToGo = " /SEED/human/p0008/education_evaluation.do"
		            }else if(url === "education_status"){	// 교육관리
		            	urlToGo = " /SEED/human/p0009/tab_education_status.do"
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
		            
		          	//전체 열린 탭의 개수가 12개 이상이면 경고 발생
			        if(myTab.tabs.getCountTab()>12){
			           if(confirm("탭이 너무 많습니다. 하나 닫을까요?")){
			        	   myTab.removeTab(1);      
			           }
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
	            	
	                <!-- /.dropdown 알림창 -->
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
                    
	                <!-- /.dropdown 유저상태창 -->
	                <li class="dropdown">
	                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                    	<span class="fa-stack fa-lg"> 
										<c:choose>
										    <c:when test="${sessionScope.PHOTO==null}">
													<i class="fa fa-circle fa-stack-2x"></i> 
													<i class="fa fa-user fa-stack-1x fa-inverse"></i>
										    </c:when>
										    <c:otherwise>
										    	<img class="img-circle" src="fileDownload?downname=<c:out value="${sessionScope.PHOTO}"/>" style="height:37.33px; width:37.33px;"/>
										    </c:otherwise>
										</c:choose>
							</span>
							<c:out value="${sessionScope.SAWON_NAME}"/> <s:message code="main.login"/>
	                        <i class="fa fa-caret-down"></i>
	                    </a>
	                    <ul class="dropdown-menu dropdown-user">
	                        <li><a href='#' onClick="doAction(myTab,'<s:message code="main.myinfo"/>','chart','myinfo','myinfo'); return false"><i class="fa fa-info-circle fa-fw"></i> 내 정보 보기</a></li>
	                    </ul>
                    </li>
                    
                    <!-- /.dropdown-flag 언어 선택-->
	            	<li class="dropdown">
	                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
		                    <span class="fa-stack fa-lg"> 
							<i class="fa fa-circle fa-stack-2x"></i> 
							<i class="fa fa-flag fa-stack-1x fa-inverse"></i>
							</span> 
	                        <i class="fa fa-caret-down"></i>
	                    </a>
	                    <ul class="dropdown-menu dropdown-user">
	                        <li><a href="${pageContext.request.contextPath }/changeLanguage2?lang=ko"><span style="color:blue"><i class="fa fa-flag fa-fw"></i></span>한국어</a></li>
	                        <li class="divider"></li>
	                        <li><a href="${pageContext.request.contextPath }/changeLanguage2?lang=en"><span style="color:red"><i class="fa fa-flag fa-fw"></i></span>English</a></li>
	                    </ul>
	                    <!-- /.dropdown-flag -->
	                </li>
                    
	                    <!-- /.dropdown 로그아웃 -->
		                <li class="dropdown">
		                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
		                    	<span class="fa-stack fa-lg"> 
								<i class="fa fa-circle fa-stack-2x"></i>
								<i class="fa fa-power-off fa-stack-1x fa-inverse"></i>
								</span>
								<i class="fa fa-caret-down"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="/SEED/memberLogout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
	                        	</li>
                        	</ul>
		                    <!-- /.dropdown-user -->
		                </li>
	                    <!-- /.dropdown-user -->
	                
	                <!-- /.dropdown -->
	            </ul>
	            <!-- /.navbar-top-links -->
            </div>
            <!-- /.navbar-header -->
            
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                           	<form id="searchForm" name="searchForm"  method="post" onsubmit="return false;">
                                <input type="hidden" name="searchType" value="brdtitle,brdmemo">
								<div class="input-group custom-search-form">
	                                <input class="form-control" type="text" name="globalKeyword" id="globalKeyword" placeholder="<s:message code="main.search"/>">
	                                <span class="input-group-btn">
	                                    <button class="btn btn-default" type="button" onclick="doAction(myTab,'검색','chart','fn_search','fn_search'); return false">
	                                        <i class="fa fa-search"></i>
	                                    </button>
	                                </span>
	                            </div>                           	
                            </form>
	                                
                        </li>
                        <!-- 일반 사원 단 조회 가능메뉴들 -->
                        <li>
                            <a href="#"> ESS</a>
                        </li>
                        <!-- 내정보보기 -->
                        <li>
                            <a href='#' onClick="doAction(myTab,'<s:message code="main.myinfo"/>','chart','myinfo','myinfo'); return false"><i class="fa fa-info-circle fa-fw"></i> <s:message code="main.myinfo"/></a>
                        </li>
                        <!-- 사원조회 -->
                        <li>
                            <a href='#' onClick="doAction(myTab,'<s:message code="main.userinfo"/>','chart','searchMember','searchMember'); return false"><i class="fa fa-users fa-fw"></i> <s:message code="main.userinfo"/></a>
                        </li>
                        <!-- 일정관리 -->             
                        <li>
                            <a href='#' onClick="doAction(myTab,'<s:message code="main.cal"/>','chart','schList','schList'); return false"><i class="fa fa-calendar fa-fw"></i> <s:message code="main.cal"/></a>
                        </li>
                        <!-- 게시판(공지사항) -->             
                        <li>
                            <a href='#' onClick="doAction(myTab,'<s:message code="main.board"/>','chart','boardList','boardList'); return false"><i class="fa fa-clipboard fa-fw"></i> <s:message code="main.board"/></a>
                        </li>
                        <!-- 전자결재 -->
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i> <s:message code="main.sign"/><span class="fa arrow"></span></a>
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
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.signImage"/>','chart','signImageForm','signImageForm'); return false"><s:message code="main.signImage"/></a>
                                </li>
	                        </ul>                             
                        </li> 
                         <!-- 근태/연차 관리 -->
                        <li>
                            <a href="#"><i class="fa fa-user fa-fw"></i> <s:message code="main.T&A"/><span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.dailyReg"/>','chart','day_regist_sawon','day_regist_sawon'); return false"><s:message code="main.dailyReg"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.findHoliday"/>','chart','holiday','holiday'); return false"><s:message code="main.findHoliday"/></a>
                                </li>
                                <li>
                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.findBT"/>','chart','business','business'); return false"><s:message code="main.findBT"/></a>
                                </li>
	                        </ul>                             
                        </li> 
                        <!-- 급여/퇴직정산관리 -->
                        <li>
                            <a href="#"><i class="fa fa-money fa-fw"></i> <s:message code="main.pay"/><span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href='#'  onClick="doAction(myTab,'<s:message code="main.pay1"/>','chart','TA_input','TA_input'); return false"><s:message code="main.pay1"/></a>
                                </li>
	                        </ul>                             
                        </li>
                        <!-- 부서장메뉴 --> 
                        <c:if test='${sessionScope.SAWON_VIEW_PERMISSION == "A" or sessionScope.SAWON_VIEW_PERMISSION == "B"}'>  
	                        <li>
	                            <a href="#"> MSS</a>
	                        </li>
	                        <!-- 인사관리 -->
	                        <li>
	                            <a href="#"><i class="fa fa-users fa-fw"></i> <s:message code="main.per"/><span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
			                        <li>
			                            <a href='#' onClick="doAction(myTab,'<s:message code="main.per6"/>','chart','deptInfo','deptInfo'); return false"><s:message code="main.per6"/></a>
			                        </li>
	                            	<li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.per8"/>','chart','education_evaluation','education_evaluation'); return false"><s:message code="main.per8"/></a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.per9"/>','chart','education_status','education_status'); return false"><s:message code="main.per9"/></a>
	                                </li>
	                            </ul>
                            </li>
	                         <!-- 근태/연차 관리 -->
	                        <li>
	                            <a href="#"><i class="fa fa-user fa-fw"></i> <s:message code="main.T&A"/><span class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
									<li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.dayCls"/>','chart','Aday_regist','Aday_regist'); return false"><s:message code="main.dayCls"/></a> 
	                                </li>
	                                <li>
	                                <a href='#' onClick="doAction(myTab,'<s:message code="main.monthlyCls2"/>','chart','Amonth','Amonth'); return false"><s:message code="main.monthlyCls2"/></a>
	                                </li>
	                                <li>
	                                   <a href='#' onClick="doAction(myTab,'<s:message code="main.calHoliday"/>','chart','Aholiday_calc','Aholiday_calc'); return false"><s:message code="main.calHoliday"/></a>
	                                </li>
	                                <li>
     								<a href='#' onClick="doAction(myTab,'<s:message code="main.findHoliday2"/>','chart','Aholiday_da','Aholiday_da'); return false"><s:message code="main.findHoliday2"/></a>
                                	</li>
                                	<li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.findBT2"/>','chart','Abusiness_da','Abusiness_da'); return false"><s:message code="main.findBT2"/></a>
	                                </li>
                                </ul>
                            </li>
                            <!-- 급여관리 -->
	                        <li>
	                            <a href="#"><i class="fa fa-money fa-fw"></i> <s:message code="main.pay"/><span class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
	                                <li>
                                       <a href='#'  onClick="doAction(myTab,'<s:message code="main.pay4"/>','chart','SALARY_spec','SALARY_spec'); return false"><s:message code="main.pay4"/></a>
                                   </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.pay5"/>','chart','nn','nn'); return false"><s:message code="main.pay5"/></a>                                
	                                </li>
		                        </ul>                             
	                        </li>
	                    </c:if>
                        <!-- 관리자메뉴 --> 
                        <c:if test='${sessionScope.SAWON_VIEW_PERMISSION == "A"}'>  
	                        <li>
	                            <a href="#"> HSS</a>
	                        </li>
	                        <!-- 등록정보관리 -->
	                        <li>
	                            <a href="#"><i class="fa fa-folder fa-fw"></i> <s:message code="main.enroll"/><span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.enroll1"/>','chart','adcompany_Enroll','adcompany_Enroll'); return false"><s:message code="main.enroll1"/></a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.enroll2"/>','chart','adworkplace_Enroll','adworkplace_Enroll'); return false"><s:message code="main.enroll2"/></a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.enroll3"/>','chart','addept_Enroll','addept_Enroll'); return false"><s:message code="main.enroll3"/></a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.enroll4"/>','chart','adSawon_Enroll','adSawon_Enroll'); return false"><s:message code="main.enroll4"/></a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.enroll5"/>','chart','adSawon_Permission','adSawon_Permission'); return false"><s:message code="main.enroll5"/></a>
	                                </li>
	                            </ul>
	                        </li>
	                        <!-- 기초환경설정 -->
	                        <li>
	                            <a href="#"><i class="fa fa-cog fa-fw"></i> <s:message code="main.setup"/><span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                     <a href='#' onClick="doAction(myTab,'<s:message code="main.setup1"/>','chart','hobong','hobong'); return false"><s:message code="main.setup1"/></a>
	                                </li>
	                                <li>

	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.setup2"/>','chart','SET_payday','SET_payday'); return false"><s:message code="main.setup2"/></a>

	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.setup4"/>','chart','code','code'); return false"><s:message code="main.setup4"/></a>
	                                </li>
	                            </ul>
	                        </li>
	                        <!-- 인사관리 -->
	                        <li>
	                            <a href="#"><i class="fa fa-users fa-fw"></i> <s:message code="main.per"/><span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.per1"/>','chart','card','card'); return false"><s:message code="main.per1"/></a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.per2"/>','chart','adInsa_infoEnroll','adInsa_infoEnroll'); return false"><s:message code="main.per2"/></a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.per3"/>','chart','ballyeong','ballyeong'); return false"><s:message code="main.per3"/></a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.per4"/>','chart','ballyeong_sawon','ballyeong_sawon'); return false"><s:message code="main.per4"/></a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.per7"/>','chart','education','education'); return false"><s:message code="main.per7"/></a>
	                                </li>
	                            </ul>
	                        </li>
	                        <!-- 근태/연차 관리 -->
	                        <li>
	                            <a href="#"><i class="fa fa-user fa-fw"></i> <s:message code="main.T&A"/><span class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
									<li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.dayCls"/>','chart','Aday_regist','Aday_regist'); return false"><s:message code="main.dayCls"/></a> 
	                                </li>
	                                <li>
	                                	<a href='#' onClick="doAction(myTab,'<s:message code="main.monthlyCls2"/>','chart','Amonth','Amonth'); return false"><s:message code="main.monthlyCls2"/></a>
	                                </li>
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.calHoliday"/>','chart','Aholiday_calc','Aholiday_calc'); return false"><s:message code="main.calHoliday"/></a>
	                                </li>
	                                <li>
     									<a href='#' onClick="doAction(myTab,'<s:message code="main.findHoliday2"/>','chart','Aholiday_da','Aholiday_da'); return false"><s:message code="main.findHoliday2"/></a>
                                	</li>
                                	<li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.findBT2"/>','chart','Abusiness_da','Abusiness_da'); return false"><s:message code="main.findBT2"/></a>
	                                </li>
                                </ul>
	                        <!-- 급여/퇴직정산관리 -->
	                        <li>
	                            <a href="#"><i class="fa fa-money fa-fw"></i> <s:message code="main.pay"/><span class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.pay2"/>','chart','SALARY_calcul','SALARY_calcul'); return false"><s:message code="main.pay2"/></a>
	                                </li>                                
	                                <li>
	                                    <a href='#' onClick="doAction(myTab,'<s:message code="main.pay3"/>','chart','SALARY_bo_sta','SALARY_bo_sta'); return false"><s:message code="main.pay3"/></a>
	                                </li>
		                        </ul>                             
	                        </li>
                             <li>
                                 <a href='#' onClick="doAction(myTab,'<s:message code="main.adSign"/>','chart','adSignDocTypeList','adSignDocTypeList'); return false"><i class="fa fa-files-o fa-fw"></i> <s:message code="main.adSign"/></a>
                             </li>
                             <li>
                                 <a href='#' onClick="doAction(myTab,'<s:message code="main.adCode"/>','chart','adCodeList','adCodeList'); return false"><i class="fa fa-check fa-fw"></i> <s:message code="main.adCode"/></a>
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