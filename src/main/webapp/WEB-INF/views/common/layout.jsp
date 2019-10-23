<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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
		</div>
	</div>
    <tiles:insertAttribute name="js" />
  </body>
</html>