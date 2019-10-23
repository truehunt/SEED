<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

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
            </nav>