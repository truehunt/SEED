<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />   

<!DOCTYPE html >
<html>
<head>
<meta "charset=utf-8">
<title>파일업로드 하기</title>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

<script type="text/javascript" src="${contextPath}/resources/ibsheet/ibtab.js"></script>
<script type="text/javascript" src="${contextPath}/resources/ibsheet/ibtabinfo.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/ibtab-style.min.css">
 
<script type="text/javascript">
function PageLoad(){
	var tabBar = document.getElementById("tab"),
	contents = document.getElementById("tab_contents");
	createIBTab(tabBar,contents,"myTabs",{
		widthTabBar: "100%",
		widthContents:"100%",
		heightContents:"300px",
		allowCloseBTN: false
    });
	
}
	

</script>
</head>
<body onload='PageLoad()'>
      
<div class="main_content" style="width:100%;height:calc(100% - 100px);box-sizing:border-box;">
	<div id="tab" class="ib-tab-tabs">
		<div class="ib-tab-tabs-item">
			<a class="ib-tab-tabs-item__link">
				<span class="ib-tab-tabs-item__title">기본정보</span>
			</a>
			<a class="ib-tab-tabs-item__link">
				<span class="ib-tab-tabs-item__title">상세정보</span>
			</a>
		</div>
	</div>
             
             
	<div id="tab_contents" class="ib-tab-contents">

		<div class="ib-tab-contents__item">
			<table class="tb01" style="width: 100%;">
				<colgroup>
					<col style="width:30%;"></col>
					<col style="width:12%;"></col>
					<col style="width:23%;"></col>
					<col style="width:12%;"></col>
					<col style="width:23%;"></col>
				</colgroup>
				<tr>
					<td class="bg02_c" rowspan="6">
						<img id="EMP_IMG" src="./images/sawon.jpg" >
						<br><br>
						<img src="./images/file_up.gif"  style="cursor:hand;"  onclick="file_upload();">
					</td>
					<td class="bg01_r">사번</td>
					<td class="bg02_l">0010036</td>
					<td class="bg01_r" >성명</td>
					<td class="bg02_l">김기선</td>
				</tr>
				<tr>
					<td class="bg01_r">소속</td>
					<td class="bg02_l">개발팀</td>
					<td class="bg01_r">고용상태</td>
					<td class="bg02_l">재직</td>
				</tr>
				<tr>
					<td class="bg01_r">직책</td>
					<td class="bg02_l">과장</td>
					<td class="bg01_r">직무</td>
					<td class="bg02_l">유지보수팀장</td>
				</tr>
				<tr>
					<td class="bg01_r">입사일</td>
					<td class="bg02_l">1996-02-23</td>
					<td class="bg01_r">퇴직일</td>
					<td class="bg02_l"></td>
				</tr>

				<tr>
					<td class="bg01_r">입사구분</td>
					<td class="bg02_l">비정규직</td>
					<td class="bg01_r">휴대전화</td>
					<td class="bg02_l">010-7511-4581</td>
				</tr>
				<tr>
					<td class="bg01_r">주소</td>
					<td colspan="3" class="bg02_l" id="EMP_ADDRESS">서울시 강남구 압구정동 한양 아파트 2동 909호</td>
				</tr>
			</table>
		</div>
		
		
		<div class="ib-tab-contents__item">

			<table>
				<colgroup>
					<col style='width: 20%;'></col>
					<col style='width: 30%;'></col>
					<col style='width: 20%;'></col>
					<col style='width: 30%;'></col>
				</colgroup>
				<tr>
					<td class='bg01_r'>한자</td>
					<td class='bg02_l'>金基善</td>
					<td class='bg01_r'>영문</td>
					<td class='bg02_l'>GISUN KIM</td>
				</tr>
				<tr>
					<td class='bg01_r'>혈액형</td>
					<td class='bg02_l'>A+</td>
					<td class='bg01_r'>결혼기념일</td>
					<td class='bg02_l'>2007-11-15</td>
				</tr>
				<tr>
					<td class='bg01_r'>생년월일</td>
					<td class='bg02_l'>1969-12-10</td>
					<td class='bg01_r'>사내전화</td>
					<td class='bg02_l'>02-2621-2089</td>
				</tr>
				<tr>
					<td class='bg01_r'>본적</td>
					<td class='bg02_l' colspan='3'>부산시 사상구 괘법동</td>
				</tr>
			</table>
			
		</div>
	</div>
</div>
<!--main contents-->
</body>
</html>
© 2019 GitHub, Inc.