<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
    <c:when test="${sessionScope.PK_SAWON_CODE eq null}">
		<jsp:forward page="login.do"/>
    </c:when>
    <c:otherwise>
		<jsp:forward page="index"/>
    </c:otherwise>


</c:choose>
