<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"
    import="sec02.ex01.*"
    pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<jsp:useBean  id="p0001VO"  class="hr.attendance.p0001.vo.day_regist_VO"  scope="request"/> 
<%
   request.setCharacterEncoding( "utf-8" );
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script type="text/javascript">
	function frm_update() {
		var frmPro = document.frm;
		frmPro.method = "post";
		frmPro.action = "${contextPath}/hr/p0001/updateMember.do"; 
		frmPro.submit();
	}
	
	function frm_add() {
		var frmPro = document.frm;
		frmPro.method = "post";
		frmPro.action = "${contextPath}/hr/p0001/insertMember.do"; 
		frmPro.submit();
	}	
   </script>
</head>
<body>
	<form name="frm" method="post" encType="UTF-8">
	ID :<input type="text" name="id" value="${p0001VO.id}"><br>
	비밀번호 :<input type="text" name="pwd" value="${p0001VO.pwd}"><br>
	이름 :<input type="text" name="name" value="${p0001VO.name}"><br>
	이메일:<input type="text" name="email" value="${p0001VO.email}"><br>
	DATE:<input type="text" name="joinDate" value="${p0001VO.joinDate}"><br>
	NUM:<input type="text" name="num" value="${p0001VO.num}"><br>
	
<c:if test="${command=='modSearch'}" > 	
	<input type="submit" name='submit' value="수정" onclick = "frm_update()">
	<input type='hidden' name='command' value='modUpdate'   /> 
</c:if>

<c:if test="${command=='addSearch'}" > 	
	<input type="submit" name='submit' value="추가" onclick = "frm_add()"> 
	<input type='hidden' name='command' value='addUpdate'   />
</c:if>	
	</form>
</body>
</html>