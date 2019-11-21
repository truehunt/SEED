<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>


					 <table class="table table-striped table-bordered table-hover">
						<colgroup>
							<col width='10%' />
							<col width='25%' />
							<col width='25%' />
							<col width='20%' />
							<col width='5%' />
						</colgroup>
						<thead>
							<tr>
								<th><s:message code="board.no"/></th> 
								<th>사번</th>
								<th>성명</th>
								<th>권한</th>
								<th><input type="checkbox" id="checkall" /></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="listview" items="${listview}" varStatus="status">	
								<tr>
									<td><c:out value="${status.index+1}"/></td>
									<td><c:out value="${listview.PK_SAWON_CODE}"/></td>
									<td><c:out value="${listview.SAWON_NAME}"/></td>
									<td><c:out value="${listview.SAWON_VIEW_PERMISSION}"/></td>
									<td><input type="checkbox" name="chk" value="<c:out value="${listview.PK_SAWON_CODE}"/>"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
