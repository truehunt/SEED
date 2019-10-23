<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title><s:message code="common.pageTitle"/></title>
	<link href="${pageContext.request.contextPath}/resources/js/dynatree/ui.dynatree.css" rel="stylesheet" id="skinSheet"/>

<script>
function fn_formSubmit(){
	document.form1.submit();	
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

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-calendar fa-fw"></i> 월간 일정</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            
            <!-- /.row -->
			<div class="row"> 
			     <div class="col-lg-10">
			         <h1>
			         <a href="#" onclick="fn_moveToURL('schList?YEAR=<c:out value="${searchVO.YEAR}"/>&MONTH=<c:out value="${searchVO.MONTH-1}"/>', '')"><i class="fa fa-angle-left fa-fw"></i></a>
			         
			         <c:out value="${searchVO.YEAR}"/>년 <c:out value="${searchVO.MONTH}"/>월
			         <a href="#" onclick="fn_moveToURL('schList?YEAR=<c:out value="${searchVO.YEAR}"/>&MONTH=<c:out value="${searchVO.MONTH+1}"/>', '')"><i class="fa fa-angle-right fa-fw"></i></a>
			         </h1>
			     </div>
			     <div class="col-lg-2">
	                	<button class="btn btn-outline btn-primary" style="margin-top:20px;" onclick="fn_moveToURL('schForm', '')" >일정추가</button>
			     </div>
            </div>
            <!-- /.row -->
			<div class="calendarRow" >
				<c:forTokens var="item" items="일,월,화,수,목,금,토" delims=",">
	             	<div class="calendarColumnHead">${item}</div>
				</c:forTokens>
			</div> 
			<div class="calendarRow">
					<c:forEach begin="1" end="${DAYOFWEEK}">
			             <div class="calendarColumnBox">
			             	<div class="calendarColumnDay"><span>a</span>
			             	</div>
			             </div> 
				 	</c:forEach>	
				 	
					<c:forEach var="listview" items="${listview}" varStatus="status">
						<c:set var="CDDAYOFWEEK" value="${listview.CDDAYOFWEEK}"/>
						<c:if test='${CDDAYOFWEEK=="1"}'> 
							</div>
							<div class="calendarRow">
						</c:if>  
						 
			             <div class="calendarColumnBox">
			             	<div class="calendarColumnDay <c:if test='${listview.CDDAYOFWEEK=="1"}'>calendarColumnSunDay</c:if>">
			             		<a href="schForm?CDDATE=<c:out value="${listview.CDDATE}"/>"><c:out value="${listview.CDDD}"/></a>
			             	</div>
							<c:forEach var="items" items="${listview.LIST}" varStatus="status">
				             	<div class="calendarDay" onmouseover="calendarDayMouseover(event, '<c:out value="${items.SSNO}"/>', '<c:out value="${listview.CDDATE}"/>')" onmouseout="calendarDayMouseout()">
					             	<c:if test='${items.FK_SAWON_CODE==sessionScope.PK_SAWON_CODE}'> 
					             		<a href="schForm?SSNO=<c:out value="${items.SSNO}"/>&SDSEQ=<c:out value="${items.SDSEQ}"/>"><c:out value="${items.SSTITLE}"/></a>
				             		</c:if>
					             	<c:if test='${items.SSNO!=null and items.userno!=sessionScope.PK_SAWON_CODE}'> 
					             		<a href="schRead?SSNO=<c:out value="${items.SSNO}"/>&SDSEQ=<c:out value="${items.SDSEQ}"/>"><c:out value="${items.SSTITLE}"/></a>
				             		</c:if>
					             	<c:if test='${items.SSNO==null}'> 
					             		<span style="color:<c:out value="${items.FONTCOLOR}"/>"><c:out value="${items.SSTITLE}"/></span>
				             		</c:if>
				             	</div>
				             </c:forEach>
			             </div>
					</c:forEach> 
					<c:forEach begin="${CDDAYOFWEEK}" end="6">
			             <div class="calendarColumnBox">
			             	<div class="calendarColumnDay">
			             	</div>
			             </div> 
				 	</c:forEach>	
			</div>	
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p> 
            <!-- /.row -->
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <div class="calendarTooltip"></div>
</body>

</html>
