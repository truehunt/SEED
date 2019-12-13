<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

		<div class="panel panel-default">
             <div class="panel-body">
             	<div class="row form-group">
                     <label class="col-lg-2">일정명</label>
                     <div class="col-lg-10"><c:out value="${schInfo.SSTITLE}"/></div>
                 </div>
             	<div class="row form-group">
                     <label class="col-lg-2">구분</label>
                     <div class="col-lg-10"><c:out value="${schInfo.SSTYPE}"/></div>
                 </div>
             	<div class="row form-group">
                     <label class="col-lg-2">일시</label>
                     <div class="col-lg-10">
	                     	<c:out value="${schInfo.SSSTARTDATE}"/> <c:out value="${schInfo.SSSTARTHOUR}"/>:<c:out value="${schInfo.SSSTARTMINUTE}"/>
	                     	~ <c:out value="${schInfo.SSENDDATE}"/> <c:out value="${schInfo.SSENDHOUR}"/>:<c:out value="${schInfo.SSENDMINUTE}"/>
                      </div> 
                 </div>
             	<div class="row form-group">
                     <label class="col-lg-2">공개</label>
                     <div class="col-lg-10"><c:out value="${schInfo.SSISOPEN}"/></div>
                 </div> 
             	<div class="row form-group">
                     <label class="col-lg-2">작성자</label> 
                     <div class="col-lg-10"><c:out value="${schInfo.SAWON_NAME}"/></div>
                 </div> 
             	<div class="row form-group">
                     <label class="col-lg-2">내용</label>
                     <div class="col-lg-10" style="max-height:100px; overflow:hidden"><c:out value="${schInfo.SSCONTENTS}"/></div> 
                 </div>
             </div>
         </div>
