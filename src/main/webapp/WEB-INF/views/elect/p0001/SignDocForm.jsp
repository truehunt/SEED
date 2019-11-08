<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
	<link href="${pageContext.request.contextPath}/resources/js/dynatree/ui.dynatree.css" rel="stylesheet"/> 
    <link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet" type="text/css">

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
	<script src="${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>

    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dynatree/jquery.dynatree.js"></script>
<script>                        
window.onload =function() {
	  CKEDITOR.replace( 'AD_CONTENT', { 'filebrowserUploadUrl': 'upload4ckeditor'});
}	  

function fn_formSubmit(){
	CKEDITOR.instances["AD_CONTENT"].updateElement();

	if ( ! chkInputValue("#AD_TITLE", "제목")) return false;
	if ( ! chkInputValue("#AD_CONTENT", "내용")) return false;
	
	$("#form1").submit();
} 

function fn_tempSubmit(){
	CKEDITOR.instances["AD_CONTENT"].updateElement();

	if ( ! chkInputValue("#AD_TITLE", "제목")) return false;
	
	$("#AD_DOCSTATUS").val("0");
	$("#form1").submit();
} 

// 결재 경로
function fn_signPath(){
    $.ajax({
        url: "popupUsers4SignPath",
        type: "post"        
    }).success(function(result){
                $("#popupUsers").html(result);
                set_Users($("#AD_DOCSIGNPATH").val()); 
    });
    $("#popupUsers").modal("show");
}
function deptTreeInUsersActivate(node) {
    if (node==null || node.data.key==0) return;
    
    $.ajax({
        url: "popupUsers4Users",
        type:"post", 
        data: { KEY : node.data.key }        
    }).success(function(result){
                $("#userlist4Users").html(result);
    });
}

function fn_selectUsers(AD_DOCSIGNPATH) {
    $("#AD_DOCSIGNPATH").val(AD_DOCSIGNPATH);
    $("#popupUsers").modal("hide");
    
    var signPath = $("#signPath");
    var signPath4Agree = $("#signPath4Agree");
    
    signPath.empty();
    signPath4Agree.empty();
     
	var typearr = ["기안", "합의", "결재"];
	var nos = AD_DOCSIGNPATH.split("||"); 
	for (var i in nos) {
		if (nos[i]==="") continue;
		var arr = nos[i].split(",");	// 사번, 이름, 기안/합의/결제, 직책 
	    var signArea = $("<div class='signArea'>");
		if (arr[2]==="1")
			signPath4Agree.append(signArea);
		else signPath.append(signArea);
	    var signAreaTop = $("<div class='signAreaTop'>" + arr[3] + "</div>").appendTo(signArea);
	    var signAreaTop = $("<div class='signAreaCenter'>").appendTo(signArea);
	    var signAreaTop = $("<div class='signAreaBottom'>" + arr[1] +"</div>").appendTo(signArea);
	}
}

</script>
   
</head>

<body>

    <div id="wrapper">

        <div id="page-wrapper" style="margin: 0px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-edit fa-fw"></i> 기안하기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-9"></div>
                <div class="col-lg-1">
			        <button class="btn btn-outline btn-primary" onclick="fn_tempSubmit()">임시저장</button>
			    </div>
                <div class="col-lg-1">
			        <button class="btn btn-outline btn-primary" onclick="fn_formSubmit()">결재상신</button>
			    </div>
                <div class="col-lg-1">
			        <button class="btn btn-outline btn-primary" onclick="fn_signPath()">결재경로</button>
			    </div>
			</div>
			
			<c:set value="0" var="cnt"/>
			
            <div class="row" style="margin-top: 10px">
				<div id="signPath" class="signPath">
					<c:forEach var="signlist" items="${signlist}" varStatus="status">
					    <c:if test="${signlist.APPROVAL_SSTYPE ne '1'}">					
							<div class="signArea">
								<div class="signAreaTop"><c:out value="${signlist.APPROVAL_USER_POS}"/></div>
								<div class="signAreaCenter">
									<c:choose>
							        	<c:when test='${signlist.APPROVAL_SSRESULT == "1"}'>승인</c:when>
							        	<c:when test='${signlist.APPROVAL_SSRESULT == "2"}'>반려</c:when>
							         	<c:otherwise></c:otherwise>
							      </c:choose>								
								</div>
								<div class="signAreaBottom"><c:out value="${signlist.SAWON_NAME}"/> </div>
							</div>
						</c:if>
					    <c:if test="${signlist.APPROVAL_SSTYPE eq '1'}">
							<c:set var="cnt" value="${cnt + 1}" />		
						</c:if>
					</c:forEach>				
				</div>
				<div class="signTitle"><br>결<br><br>재</div>
			</div>
		    <c:if test="${cnt>0}"> 
	            <div class="row" style="margin-top: 10px">
					<div id="signPath4Agree" class="signPath">
						<c:forEach var="signlist" items="${signlist}" varStatus="status">
						    <c:if test="${signlist.APPROVAL_SSTYPE eq '1'}">					
								<div class="signArea">
									<div class="signAreaTop"><c:out value="${signlist.APPROVAL_USER_POS}"/></div>
									<div class="signAreaCenter">
										<c:choose>
								        	<c:when test='${signlist.APPROVAL_SSRESULT == "1"}'>결재</c:when>
								        	<c:when test='${signlist.APPROVAL_SSRESULT == "2"}'>반려</c:when>
								         	<c:otherwise></c:otherwise>
								      </c:choose>								
									</div>
									<div class="signAreaBottom"><c:out value="${signlist.SAWON_NAME}"/> </div>
								</div>
							</c:if>
						</c:forEach>				
					</div>
					<div class="signTitle"><br>합<br><br>의</div>
				</div>
			</c:if>
						
            <div class="row" style="margin-top: 10px">
            	<form id="form1" name="form1" role="form" action="signDocSave" method="post" >
            		<input type="hidden" name="PK_AD_NUM" value="<c:out value="${signDocInfo.PK_AD_NUM}"/>">
            		<input type="hidden" name="AD_DOCSTATUS" id="AD_DOCSTATUS"  value="<c:out value="${signDocInfo.AD_DOCSTATUS}"/>">
            		<input type="hidden" name="PK_DOCTYPE_NUM" value="<c:out value="${signDocInfo.PK_DOCTYPE_NUM}"/>">
				    <input type="hidden" name="AD_DOCSIGNPATH" id="AD_DOCSIGNPATH"  value="<c:out value="${signDocInfo.AD_DOCSIGNPATH}"/>">
					<div class="panel panel-default">
	                    <div class="panel-body">
	                    	<div class="row form-group">
	                            <label class="col-lg-1">제목</label>
	                            <div class="col-lg-11">
	                            	<input type="text" class="form-control" id="AD_TITLE" name="AD_TITLE" maxlength="50" 
	                            	value="<c:out value="${signDocInfo.AD_TITLE}"/>">
	                            </div>
	                        </div>
	                    	<div class="row form-group">
	                            <label class="col-lg-1">내용</label>
	                            <div class="col-lg-11">
	                            	<textarea class="form-control" id="AD_CONTENT" name="AD_CONTENT"><c:out value="${signDocInfo.AD_CONTENT}"/></textarea>
	                            </div>
	                        </div>
	                    </div>
	                </div>
				</form>	
            </div> 
            <!-- /.row -->
        </div> 
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
  <div id="popupUsers" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" 
    aria-labelledby="myLargeModalLabel"></div>    
</body>

</html>
