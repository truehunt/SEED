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
			    
			    
			     <link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
    
     <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
			
			
			    
			</head>
			
			<body>
			
			    <div id="wrapper">
			
			
					<jsp:include page="common/navigation.jsp" />
			        
			        	<div id="page-wrapper">

			                <div id='ib-tabs' class="row"></div>
									<div id='ib-contents' class="row"></div>  
			            </div>
		            			      
			            <!-- /.row -->
		            </div>
			        <!-- /#page-wrapper -->
			
			    <!-- /#wrapper -->
			    <div class="calendarTooltip"></div>

			    
			</body>
			
			</html>
		
    </c:otherwise>

</c:choose>
