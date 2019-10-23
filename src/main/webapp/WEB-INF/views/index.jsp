<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	

<c:choose>
    <c:when test="${sessionScope.PK_SAWON_CODE eq null}">
		<jsp:forward page="login.do"/>
    </c:when>
    <c:otherwise>


			<!DOCTYPE html>
			<html>
			<head>
			    <meta charset="utf-8">
			    <meta http-equiv="X-UA-Compatible" content="IE=edge">
			    <meta name="viewport" content="width=device-width, initial-scale=1">
			    <meta name="description" content="">
			    <meta name="author" content="">
			
			    <title><s:message code="common.pageTitle"/></title>
			    <link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
			
			<script>
			function fn_moveDate(date){
			    $.ajax({
			        url: "moveDate",
			        type:"post", 
			        data : {date: date},
			        success: function(result){
			            $("#calenDiv").html(result);
			            calcCalenderHeight();
			        }
			    })
			}
			 
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
						} else {				// 오늘이 없으면 일/월요일 
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
			
			function ev_prevSlide() {
				var columnSelected = $("#weekDiv").children(".columnSelected");
				var node = columnSelected.first().prev();
				if (!node || !node.hasClass("calendarColumn")) return;
				
				node.addClass( "columnSelected" );
				if (node.prev().length===0) {
					$(".calenSlideButton_left").hide();
				}
				$(".calenSlideButton_right").show();
			
				columnSelected.last().removeClass( "columnSelected" );
			}
			
			function ev_nextSlide() {
				var columnSelected = $("#weekDiv").children(".columnSelected");
				var node = columnSelected.last().next();
				if (!node || !node.hasClass("calendarColumn")) return;
				
				node.addClass( "columnSelected" );
			
				if (!node.next().hasClass("calendarColumn")) {
					$(".calenSlideButton_right").hide();
				}
				$(".calenSlideButton_left").show();
			
				columnSelected.first().removeClass( "columnSelected" );
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
			    	data: { ssno : ssno, cddate:cddate },
				    success: function(result){
				    	$(".calendarTooltip").html(result);
					}    
			    });	
			}
			
			function calendarDayMouseout(){
				$(".calendarTooltip").hide();
			}
			</script>
			    
			</head>
			
			<body>
			
			    <div id="wrapper">
			
			        
			            <div id="calenDiv" class="row">
			                <jsp:include page="indexCalen.jsp" />
			            </div>
			
			            <div class="row">
			                <div class="col-lg-12">
			                    &nbsp;
			                </div>
			            </div>
			                
			            <!-- /.row -->
			        <!-- /#page-wrapper -->
			
			    </div>
			    <!-- /#wrapper -->
			    <div class="calendarTooltip"></div>
			</body>
			
			</html>
		
    </c:otherwise>

</c:choose>
