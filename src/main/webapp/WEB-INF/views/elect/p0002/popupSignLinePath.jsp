<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

	 <table class="table table-striped table-bordered table-hover">
		<colgroup>
			<col width='10%' />
			<col width='30%' />
			<col width='40%' />
			<col width='10%' />
			<col width='10%' />
		</colgroup>
		<thead>
			<tr>
				<th>No.</th>
				<th>결재선 명칭</th> 
				<th>결재경로</th>
				<th>선택</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listview" items="${listview}" varStatus="status">
				<tr id='tr<c:out value="${listview.PK_LINEPATH_NUM}"/>'>
					<td><c:out value="${status.index+1}"/></td>
					<td><c:out value="${listview.LINEPATH_NAME}"/></td>
					<td><c:out value="${listview.LINEPATH_SIGNPATH_View}"/></td>
					<td><a href="javascript:fn_addLinePath('<c:out value="${listview.LINEPATH_SIGNPATH}"/>')"><i class="fa fa-check fa-fw"></i></a></td>
					<td><a href='javascript:fn_deleteLinePath(<c:out value="${listview.PK_LINEPATH_NUM}"/>)'><i class='fa fa-times fa-fw'></i></a><td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
