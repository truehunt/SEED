<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


              <link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/morris.css" rel="stylesheet">
    
     <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/morris.min.js"></script>    
   <script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>

<script>

// responsive week calendar
function myFunction(x) {
    if (x.matches) { // max-width: 450px
      var columnSelected = $("#weekDiv").children(".columnSelected");
      if (columnSelected.length===0) { // 반응형 시작
         var today = $("#weekDiv .today");
         if (today.length > 0) {  // 오늘이 있으면
            //today = today.parent();
            today.addClass( "columnSelected" );
            if (today.next().hasClass("calendarColumn")) { // 토요일(한주의 마지막)이 아니면
               today.next().addClass( "columnSelected" );
            }else {
               today.prev().addClass( "columnSelected" );
            }
         } else {            // 오늘이 없으면 일/월요일 
            var ch = $("#weekDiv").children(".calendarColumn").first();
            ch.addClass( "columnSelected" );
            ch.next().addClass( "columnSelected" );
         }
      }
   }
}

window.onload = function () {
   var x = window.matchMedia("(max-width: 450px)")
   x.addListener(myFunction) 
   myFunction(x);
   
   calcCalenderHeight();
   
    Morris.Bar({
        element: 'morris-bar-chart',
        data: [
              <c:forEach var="listview3" items="${listview3}" varStatus="status">
               {x: '<c:out value="${listview3.field1}"/>', y: <c:out value="${listview3.cnt1}"/>}<c:if test="${!status.last}">,</c:if> 
          </c:forEach>
              ],
        xkey: 'x',
        ykeys: 'y',
        labels: 'Count',
        resize: true
    });
    Morris.Donut({
        element: 'morris-donut-chart',
        data: [
                 <c:forEach var="listview3" items="${listview3}" varStatus="status">
                    {label: "<c:out value="${listview3.field1}"/>",value: <c:out value="${listview3.cnt1}"/>}<c:if test="${!status.last}">,</c:if>
             </c:forEach>
              ],
        resize: true
    });
}

function calcCalenderHeight() {
   var calendars = $(".calendarColumn .panel-body");
   var max = 0;
   calendars.each(function() {
      var h = parseInt($(this).css("height"));
      if (h > max) max = h; 
   });
   if (max<180) max=180; 
   calendars.each(function() { 
      $(this).css("height", max+"px");
   }); 
}

var oldno = null;
function calendarDayMouseover(event, ssno, cddate){
   if (!ssno) {
      return;
   }
   
   $(".calendarTooltip").css({left: event.x+"px", top: event.y+"px"});
   $(".calendarTooltip").show();
   if (oldno===ssno) return;
   oldno=ssno;
    $.ajax({
       url: "schRead4Ajax",
       cache: false,
       data: { SSNO : ssno, CDDATE:cddate },
       success: function(result){
          $(".calendarTooltip").html(result);
      }    
    });   
}

function calendarDayMouseout(){
   $(".calendarTooltip").hide();
}
</script>

<div id="wrapper">

<div id="page-wrapper" style="margin: 0px;">
   <div id="calenDiv" class="row">
     <div class="col-lg-12">
         <h1 class="page-header"><i class="fa fa-calendar fa-fw"></i> <c:out value="${month}"/> <s:message code="main.month"/> <c:out value="${week}"/> <s:message code="main.week"/></h1>
     </div>
 
     <div class="col-lg-12" id="weekDiv">
        <c:forEach var="calenList" items="${calenList}" varStatus="status">    
             <div class="calendarColumn <c:if test="${calenList.ISTODAY}">today</c:if>">
                 <div class="panel <c:if test="${calenList.ISTODAY}">panel-red</c:if> <c:if test="${!calenList.ISTODAY}">panel-default</c:if> ">
                     <div class="panel-heading" style="text-align:center">
                        <c:out value="${calenList.MONTH}"/>월 <c:out value="${calenList.DAY}"/>일 (<c:out value="${calenList.WEEK}"/>)
                     </div> 
                     <div class="panel-body">
                     <c:forEach var="items" items="${calenList.LIST}" varStatus="status"> 
                            <div class="calendarDay" onmouseover="calendarDayMouseover(event, '<c:out value="${items.SSNO}"/>', '<c:out value="${calenList.DATE}"/>')" onmouseout="calendarDayMouseout()">
                               <c:if test='${items.PK_SAWON_CODE==sessionScope.PK_SAWON_CODE}'>
                                  <a href="schForm?SSNO=<c:out value="${items.SSNO}"/>&SDSEQ=<c:out value="${items.SDSEQ}"/>"><c:out value="${items.SSTITLE}"/></a>
                               </c:if>
                               <c:if test='${items.SSNO!=null and items.PK_SAWON_CODE!=sessionScope.PK_SAWON_CODE}'> 
                                   <a href="schRead?SSNO=<c:out value="${items.SSNO}"/>&SDSEQ=<c:out value="${items.SDSEQ}"/>"><c:out value="${items.SSTITLE}"/></a>
                               </c:if>
                               <c:if test='${items.SSNO==null}'> 
                                  <span style="color:<c:out value="${items.FONTCOLOR}"/>"><c:out value="${items.SSTITLE}"/></span>
                               </c:if>                               
                            </div>
                         </c:forEach>                     
                     </div> 
                 </div>
             </div>
        </c:forEach>
      <div class="calenSlideButton calenSlideButton_left" onclick="ev_prevSlide()">&#10094;</div>
      <div class="calenSlideButton calenSlideButton_right" onclick="ev_nextSlide()">&#10095;</div>
     </div>
    </div>
     
     <div class="calendarTooltip"></div>
     
     <h1 class="page-header"> <i class="fa fa-edit fa-fw"></i> 전자결재 현황</h1>
     		<c:if test="${null eq listview2}">
				<div id="develop2">
					<s:message code="main.signNull"/>
				</div>
			</c:if>	
		     <div class="row">
                <div class="col-lg-12">
					<c:forEach var="listview2" items="${listview2}" varStatus="status">
					
						<c:url var="link" value="signDocRead">
							<c:param name="PK_AD_NUM" value="${listview2.PK_AD_NUM}" />
						</c:url>
		                <div class="col-lg-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            <a href="${link}"><c:out value="${listview2.AD_TITLE}"/> (<c:out value="${listview2.AD_DOCSTATUS}"/>)</a>
		                        </div>
		                        <div class="panel-body">
		                            <p> 기안자 : <c:out value="${listview2.SAWON_NAME}"/> (<c:out value="${listview2.AD_INT_DATE}"/>)</p>
									<p> 결재양식 : <c:out value="${listview2.DOCTYPE_DTTITLE}"/> </p>
		                        </div>
		                    </div>
		                </div>	
											
					</c:forEach>
            	</div>    
            </div>
         
     
     <h1 class="page-header"> <i class="fa fa-tasks fa-fw"></i> 전자결재양식 현황</h1>
     <div class="row">
        <div class="col-lg-5">
                      <div id="morris-bar-chart"></div>
          </div>
    
        <div class="col-lg-5">
                      <div id="morris-donut-chart"></div>
          </div>
    </div>
    
    <h1 class="page-header"> <i class="fa fa-music fa-fw"></i> 부서별 휴가 현황</h1>
     <div id="develop">
        e-HR의 시스템을 크게 나눌때 HSS, MSS, ESS 세가지로 분류하게 됩니다.
      HSS는 인사부서 등의 시스템 관리자 사용화면 내지는 시스템이며,
      MSS는 조직의 관리자(부서장 등)이 쓰는 화면 내지 시스템이며
      ESS는 일반직원들이 사용하는 화면 내지 시스템입니다.
      <br>
      <br>
      <br>
      전자결재 메인화면 내용도 여기에 들어갈 예정
     </div>
     
</div>
     
     
</div>     
     

     