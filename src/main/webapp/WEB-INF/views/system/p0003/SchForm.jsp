<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

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
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/js/datepicker/datepicker.css" rel="stylesheet" type="text/css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>    
    <script src="${pageContext.request.contextPath}/resources/js/datepicker/bootstrap-datepicker.js"></script>

<script>

window.onload = function() {
    $('#SSSTARTDATE').datepicker().on('changeDate', function(ev) {
        if (ev.viewMode=="days"){
            $('#SSSTARTDATE').datepicker('hide');
        }
    });
    $('#SSENDDATE').datepicker().on('changeDate', function(ev) {
        if (ev.viewMode=="days"){
            $('#SSENDDATE').datepicker('hide');
        }
    });
    $('#SSREPEATEND').datepicker().on('changeDate', function(ev) {
        if (ev.viewMode=="days"){
            $('#SSREPEATEND').datepicker('hide');
        }
    });
    SSREPEATTYPEChange();
    <c:if test='${SSREPEATOPTION ne ""}'>
    	$("#SSREPEATOPTION").val('<c:out value="${schInfo.SSREPEATOPTION}"/>');
    </c:if> 
}

function fn_formSubmit(){
	if ( ! chkInputValue("#SSTITLE", "일정명")) return false;
	if ( ! chkInputValue("#SSCONTENTS", "내용")) return false;
	
	if (!confirm("저장 하시겠습니까?")) return;
	
	$("#form1").submit();
} 

function fn_delete(){
	if (!confirm("삭제 하시겠습니까?")) return;
	
	$("#form1").attr("action", "schDelete");
	$("#form1").submit();
}

function SSREPEATTYPEChange(){
	$("#SSREPEATOPTION").hide();
	$("#SSREPEATEND").hide();
	if ($("#SSREPEATTYPE").val()==="1") return;
	 
	$("#SSREPEATOPTION").show();
	$("#SSREPEATEND").show(); 
	
	if ($("#SSREPEATEND").val()==="")	$("#SSREPEATEND").val($("#SSENDDATE").val()); 
	$("#SSREPEATOPTION").empty();
	if ($("#SSREPEATTYPE").val()==="2") {
		var week = ["일", "월", "화", "수", "목", "금", "토"];
		for (var i=0; i<week.length; i++) {
			$('<option value="'+ i +'">' + week[i] + '</option>').appendTo($("#SSREPEATOPTION"));
		}
	} else 
	if ($("#SSREPEATTYPE").val()==="3") {
		for (var i=1; i<=31; i++) {
			var str = "0" + String(i);
			str = str.substring(str.length-2);
			$('<option value="'+ str +'">' + str + '</option>').appendTo($("#SSREPEATOPTION"));
		} 
	}  
}
</script>
    
</head>

<body>

    <div id="wrapper">

		
        <div id="page-wrapper" style="margin: 0px;"> 
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-gear fa-fw"></i> 일정관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <div class="row">
            	<form id="form1" name="form1" role="form" action="schSave" method="post" >
            		<input type="hidden" name="SSNO" value="<c:out value="${schInfo.SSNO}"/>">
					<div class="panel panel-default">
	                    <div class="panel-body">
	                    	<div class="row form-group">
	                            <label class="col-lg-1">일정명</label>
	                            <div class="col-lg-8">
	                            	<input type="text" class="form-control" id="SSTITLE" name="SSTITLE" maxlength="50" 
	                            	value="<c:out value="${schInfo.SSTITLE}"/>">
	                            </div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">구분</label>
	                            <div class="col-lg-8">
									<c:forEach var="listview" items="${sstypelist}" varStatus="status">
		                            	<label style="margin-right: 5px"><input type="radio"  <c:if test='${listview.CODECD==schInfo.SSTYPE}'>checked</c:if> 
		                            		 id="SSTYPE" name="SSTYPE" value="<c:out value="${listview.CODECD}"/>"> <c:out value="${listview.CODENM}"/></label>
		                            </c:forEach>
	                            </div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">일시</label>
	                            <div class="col-lg-2">
	                            	<input class="form-control" size="16" id="SSSTARTDATE" name="SSSTARTDATE" value="<c:out value="${schInfo.SSSTARTDATE}"/>" readonly>
	                            </div>
	                            <div class="col-lg-1">
		                           	<select id="SSSTARTHOUR" name="SSSTARTHOUR" class="form-control">
										<c:forEach var="item" begin="1" end="24">
											<c:set var="SSHOUR" value="0${item}"/>
											<c:set var="SSHOUR" value="${fn:substring(SSHOUR, fn:length(SSHOUR)-2, 3)}"/>
			                           		<option value="${SSHOUR}" <c:if test='${SSHOUR==schInfo.SSSTARTHOUR}'>selected</c:if>>${SSHOUR}</option>
									 	</c:forEach>
									</select>						 
								 </div>  
	                            <div class="col-lg-1">
		                           	<select id="SSSTARTMINUTE" name="SSSTARTMINUTE" class="form-control">
										<c:forTokens var="item" items="00,10,20,30,40,50" delims=",">
			                           		<option value="${item}" <c:if test='${item==schInfo.SSSTARTMINUTE}'>selected</c:if>>${item}</option>
									 	</c:forTokens>
									</select>						
								 </div>		            
	                             <div class="col-lg-2">
	                            	<input class="form-control" size="16" id="SSENDDATE" name="SSENDDATE" value="<c:out value="${schInfo.SSENDDATE}"/>" readonly>
	                             </div> 
	                            <div class="col-lg-1">
		                           	<select id="SSENDHOUR" name="SSENDHOUR" class="form-control">
										<c:forEach var="item" begin="1" end="24">
											<c:set var="SSHOUR" value="0${item}"/>
											<c:set var="SSHOUR" value="${fn:substring(SSHOUR, fn:length(SSHOUR)-2, 3)}"/>
			                           		<option value="${SSHOUR}" <c:if test='${SSHOUR==schInfo.SSENDHOUR}'>selected</c:if>>${SSHOUR}</option>
									 	</c:forEach>
									</select>						
								 </div>
	                            <div class="col-lg-1">
		                           	<select id="SSENDMINUTE" name="SSENDMINUTE" class="form-control">
										<c:forTokens var="item" items="00,10,20,30,40,50" delims=",">
			                           		<option value="${item}" <c:if test='${item==schInfo.SSENDMINUTE}'>selected</c:if>>${item}</option>
									 	</c:forTokens>
									</select>						
								 </div>		                            
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">반복</label>
	                            <div class="col-lg-2">
		                           	<select id="SSREPEATTYPE" name="SSREPEATTYPE" class="form-control" onchange="SSREPEATTYPEChange()">
		                           		<option value="1" <c:if test='${schInfo.SSREPEATTYPE==1}'>selected</c:if>>반복없음</option>
		                           		<option value="2" <c:if test='${schInfo.SSREPEATTYPE==2}'>selected</c:if>>주간반복</option>
		                           		<option value="3" <c:if test='${schInfo.SSREPEATTYPE==3}'>selected</c:if>>월간반복</option>
									</select>						
	                            </div> 
	                            <div class="col-lg-1">
		                           	<select id="SSREPEATOPTION" name="SSREPEATOPTION" class="form-control" style="display:none">
									</select>						
	                            </div> 
	                            <div class="col-lg-2">
	                            	<input class="form-control" size="16" id="SSREPEATEND" name="SSREPEATEND" value="<c:out value="${schInfo.SSREPEATEND}"/>"  style="display:none" readonly>
	                            </div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">공개</label>
	                            <div class="col-lg-8">
	                            	<label style="margin-right: 5px"><input type="radio" <c:if test='${schInfo.SSISOPEN=="Y"}'>checked</c:if> 
	                            		 id="SSISOPEN" name="SSISOPEN" value="Y"> 공개</label>
	                            	<label style="margin-right: 5px"><input type="radio" <c:if test='${schInfo.SSISOPEN=="N"}'>checked</c:if> 
	                            		 id="SSISOPEN" name="SSISOPEN" value="N"> 비공개</label>
	                            </div>
	                        </div> 
	                    	<div class="row form-group">
	                            <label class="col-lg-1">내용</label>
	                            <div class="col-lg-8">
	                            	<textarea class="form-control" id="SSCONTENTS" name="SSCONTENTS"><c:out value="${schInfo.SSCONTENTS}"/></textarea>
	                            </div> 
	                        </div>
	                    </div>
	                </div>
				</form>	
		        <button class="btn btn-outline btn-primary" onclick="fn_formSubmit()"><s:message code="common.btnSave"/></button>
		        <c:if test='${schInfo.SSNO!=null}'>
	            	<button class="btn btn-outline btn-primary" onclick="fn_delete()" ><s:message code="common.btnDelete"/></button>
	            </c:if>
            </div>
            <!-- /.row -->
        </div> 
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</body>

</html>
