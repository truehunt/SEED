<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육관리</title>

<style>
   .frame {
        width : 1800px;
        margin: 0px;
   }

   .container {
        overflow: hidden;
        display: table;
        margin: 0px;
   }

   .nav {
        float: left;
        margin-left:0px;
        width: 700px;
        height: 400px;
        border : 1px solid lightblue;
   }
   .content {
        margin-left:570px;
        margin-top:-600px;
        float: right;
        width: 900px;
        height: 400px;
        border : 1px solid lightblue;
   }
   .main_content{
      width: 510px;
   }
   .main_menu {
      border : 1px solid lightblue;
   }
   
   .nav, .content {<!--메뉴바 꽉차게 만들기-->
        display: table-cell;
   }
   
   img {
      width:20px;
      height:15px;
   }
   
   /*datepicer 버튼 롤오버 시 손가락 모양 표시*/
   .ui-datepicker-trigger{cursor: pointer;}
   
   /*datepicer input 롤오버 시 손가락 모양 표시*/
   .hasDatepicker{cursor: pointer;}
</style>


<!--우편번호 관련된 script 추가 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- ibsheet,tab 관련된 script 및 link 추가  -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

   <link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
     <link href="${contextPath}/resources/ibsheet/tab/ibtab-style.css" rel="stylesheet">
   <script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
   <script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
   <script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
   <script src="${contextPath}/resources/ibsheet/tab/ibtab.js" type="text/javascript"></script>
   <script src="${contextPath}/resources/ibsheet/tab/ibtabinfo.js" type="text/javascript"></script>
   
   <!-- 부트스트랩 관련 -->
   <link href="${contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
   <link href="${contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
   <link href="${contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
   <link href="${contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">

   <script src="${contextPath}/resources/js/jquery-2.2.3.min.js"></script>
   <script src="${contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
   <script src="${contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
   <script src="${contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
   <script src="${contextPath}/resources/js/project9.js"></script>
     
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript">
  function PageLoad(){
	var tabBar = document.getElementById("tab"),
	contents = document.getElementById("tab_contents");
	createIBTab(tabBar,contents,"myTabs",{
		widthTabBar: "100%",
		heightContents:($(window).height()-200) + "px"
    });
	
	myTabs.setOptions({
		tabs:[{
			title:"사원별 교육현황",
			style:{
				icon:{
					type:"fa",
					value:"fa-users"
				},
				btnClose:false
			}
		},{
			title:"교육별 교육현황",
			style:{
				icon:{
					type:"fa",
					value:"fa-users"
				},
				btnClose:false
			}
		},
		],
		contents:[{
			type:"iframe",	
			contents:"${contextPath}/human/p0009/education_status.do"
		},{
			type:"iframe",	
			contents:"${contextPath}/human/p0009/education_status2.do"
		},{
			
		}]
	});
}
	

</script>
</head>

<body  onload='PageLoad()'>
      
        <div class="row">
		<div class="col-lg-12">        <!-- 해당 메뉴의 아이콘 -->        <!-- 해당 메인 타이틀(제목) 들어가는 부분 -->
			<h1 class="page-header"><i class="fa fa-users fa-fw"></i>교육현황</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
  
    
        
       <div class="main_content" style="width:1400px;">
            <div class="exp_product">
            </div>

             <div id="tab" class="ib-tab-tabs">
             </div>
             
             
             <div id="tab_contents" class="ib-tab-contents">
             </div>
        </div>
        <!--main contents-->
</body>
</html>