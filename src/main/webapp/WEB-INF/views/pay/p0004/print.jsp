<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%--                   <jsp:include page="/WEB-INF/views/pay/p0004/SALARY_spec.jsp" flush="true"> --%>
<%--                     <jsp:param name="fk_DEPT_NAME" value="${fk_DEPT_NAME }"/> --%>
<%--                     <jsp:param name="sawon_NAME" value="${sawon_NAME }"/> --%>
<%--                   </jsp:include> --%>
                  
    <c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />	
<title>급여명세</title>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

    <link href="${contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/resources/js/datepicker/datepicker.css" rel="stylesheet" type="text/css">

    <script src="${contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
    <script src="${contextPath}/resources/js/datepicker/bootstrap-datepicker.js"></script>
    <script src="${contextPath}/resources/js/project9.js"></script>

    <script src="${contextPath}/resources/js/jquery-ui.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<style>


</style>

<script type="text/javascript" src="../js/common.js"></script>
<script language="javascript" src="../sheet/ibsheetinfo.js"></script>
<script language="javascript" src="../sheet/ibsheet.js"></script>

<script type="text/javascript">

		

//		// 크롬등 스타일
//		var styleElement = document.createElement("style");
//		styleElement.type = "text/css";
//		styleElement.innerHTML = a.style;
	
	
	var initBody;
	
	function beforePrint(){
		initBody = document.body.innerHTML;
		document.body.innerHTML = area.innerHTML;
		
	}
	function afterPrint(){
		document.body.innerHTML = initBody;
	}
	window.onbeforeprint = beforePrint;
	window.onafterprint = afterPrint;
	
	$(document).ready(function(){
		
		var a = opener.mySheet2.GetSheetHtml(); //시트의 내용을 html 형식으로 얻는다. 
		//IE8 이하 스타일		
		if(document.all){
			document.styleSheets[0].cssText = a.style; //스타일 적용
		}else{
			document.querySelector("style").innerHTML = a.style;
		}
		document.getElementById("sheet_div").innerHTML = a.body;	//내용 넣기
		opener.document.getElementById("sheetDIV").style.width = "100%";
		
		
		
		var t = new Date();
		var DandT = t.getFullYear() + "-" +AddZero(t.getMonth()+1)+"-" + AddZero(t.getDate())+"   "+AddZero(t.getHours())+":"+AddZero(t.getMinutes());
		document.getElementById("edate").innerHTML = DandT;
		
		var sumvalue = opener.mySheet2.GetSumValue(1,"salary_CAL_MONEY");
		
		//합계 계산
      
		
	});
	function getUrlParams() {
	    var params = {};
	    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, 
	    		function(str, key, value) { params[key] = value; });
	    return params;
	}
	
	function printWork(){
		window.print();		
		window.close();
	}
	function AddZero(str){
		if((str+"").length==1){
			return "0"+str;
		}	
		return str;
	}
	
	


</script>
</head>
<body style="overflow:auto">
<div class="search_bar">
<ul>
<li ><button type="button" onclick="printWork()">인쇄하기</button></li>
<li>* 인쇄미리보기 설정에서 머리글, 바닥글 항목 보두 비어있음 설정후, 배경색 및 이미지 인쇄 체크후 인쇄하세요 </li>
</ul>
</div>							
<div id="area" style="width:500px">
<img  align="left" src="${pageContext.request.contextPath}/resources/image/SEED.png" width="250px" height="70px" style="margin-bottom:5px;">
<table style="width:510px;border-collapse:collapse; border:1px solid black;">
	<tr>
		<td colspan="8" style="border-collapse:collapse; border:1px solid black">
			<table style="width:600px; float:center">
				<tr height="15px"><td colspan="4"></td></tr>
				<tr>
					<td colspan="4" style="font-size:45px;text-align:center;"><b>급&nbsp;&nbsp;&nbsp;여&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;세&nbsp;&nbsp;&nbsp;서</b></td>
				</tr>
				<tr height="30px"><td colspan="4"></td></tr>
				<tr>
					<td width="15%" style="font-size:12px;">&nbsp;&nbsp;작 성 일 : </td>
					<td width="30%" style="font-size:12px;"> <span id="edate"></span> </td>
					<td width="54%" rowspan="3" style="text-align:right" margin-right="10">
					
					</td>
					<td width="1%"></td>
				</tr>
				<tr>
					<td style="font-size:12px;">&nbsp;&nbsp;부 서 명 :
						<td width="30%" style="font-size:12px;" id="dept"><%=request.getParameter("dept")%></td>
<%-- 						<input type="text" value=<%=request.getParameter("name")%> id="name"> --%>
                	
					<td style="font-size:12px;"> </td>
					<td></td>
				</tr>
				<tr>
					<td style="font-size:12px;">&nbsp;&nbsp;신 청 인 :
                       <td width="30%" style="font-size:12px;" id="name"><%=request.getParameter("name")%></td>
					<td style="font-size:12px;"></td>
					<td></td>
				</tr>
				<tr height="5px"><td colspan="4"></td></tr>
			</table>
		</td>
	</tr>
	
</table>

<br>
<div id="sheet_div" style="width:80%"></div>
</div>

<ul>
<li>* 귀하의 노고에 감사드립니다. </li>
</ul>

</body>
</html>