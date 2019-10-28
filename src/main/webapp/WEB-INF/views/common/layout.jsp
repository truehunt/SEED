<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!doctype html>
<html>
  <head>
  		<tiles:insertAttribute name="css" />
  </head>
  <body>
  <div id="wrapper">
	<tiles:insertAttribute name="header" />
      <!-- Sidebar -->

      <tiles:insertAttribute name="menu" />


      	<div id="page-wrapper">
		<tiles:insertAttribute name="content" />
			      <div id='ib-tabs'></div>
			<div id='ib-contents'></div>


		</div>
	</div>
    <tiles:insertAttribute name="js" />
  </body>
</html>