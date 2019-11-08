<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

	 <table class="table table-striped table-bordered table-hover">
		<colgroup>
			<col width='20%' />
			<col width='40%' />
			<col width='40%' />
		</colgroup>
		<thead>
			<tr>
				<th><s:message code="board.no"/></th> 
				<th><s:message code="common.name"/></th>
				<th>직위</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listview" items="${listview}" varStatus="status">	
				<tr>
					<td><c:out value="${status.index+1}"/></td>
					<td><a href="javascript:fn_addUser('<c:out value="${listview.PK_SAWON_CODE}"/>', '<c:out value="${listview.SAWON_NAME}"/>', '<c:out value="${listview.FK_DEPT_CODE}"/>', '<c:out value="${listview.RANK_NAME}"/>')"><c:out value="${listview.SAWON_NAME}"/></a></td>
					<td><c:out value="${listview.RANK_NAME}"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
