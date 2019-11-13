<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> 
<script src="${pageContext.request.contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${pageContext.request.contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${pageContext.request.contextPath}/resources/ibsheet/ibleaders.js"></script>

 <link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">

    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>    

    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
    function LoadPage() {

      
    createIBSheet2($("#deptTree4Users")[0],"mySheet", "100%", "300px");
  	  
      var cfg = {FrozenCol:6,MergeSheet:msHeaderOnly };  
      mySheet.SetConfig(cfg); 
      
      var header = [
         {Text:"NO|직종|전체|월급|연봉|일급|시급",Align:"Center"},
         {Text:"NO|직종|입사자상여계산|입사자상여계산|퇴사자상여계산|퇴사자상여계산",Align:"Center"}
    
         ];  
      var info = {Sort:0,ColMove:1,ColResize:1};  
      mySheet.InitHeaders(header,info);  
      
      var cols = [   
        {Header:"NO",Type:"Seq",Width:20,SaveName:"fk_D_B_PAYMENT_SEQ_CODE", Align:"Center"},
          {Header:"급여구분",Type:"Text",SaveName:"pk_PAY_BEN_C_UNIQUE_NUM",Width:50,Align:"Center"},
         {Header:"방법",Type:"Combo", RowSpan:1,SaveName:"pay_BEN_C_RECRUIT_METHOD", ComboText:"평일정상근무일|토일정상근무일|주휴정상근무일|유휴정상근무일|무휴정상근무일", ComboCode:"평일정상근무일|토일정상근무일|주휴정상근무일|유휴정상근무일|무휴정상근무일"},          
         {Header:"기준일수",Type:"AutoSum",SaveName:"pay_BEN_C_DATE_RECRUIT", MinWidth:10, Align: "Center"},
         {Header:"방법",Type:"AutoSum",SaveName:"pay_BEN_C_RETIRE_BEN_METHOD", MinWidth:10, Align: "Center"},
         {Header:"기준일수",Type:"AutoSum",SaveName:"pay_BEN_C_DATE_RESIG", MinWidth:10, Align: "Center"}

   
          ];
      
      
      mySheet.InitColumns(cols);
      mySheet.SetSumText(1,"합   계");
      
    
    }


   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
      case "search": //조회
          var param = "ta_ATTRIBUTION=" + document.getElementById("attribute").value 
                   + "&ta_PAYMENTDAY=" + document.getElementById("payday").value
                   +"&salary_BO_STA_BANK_CODE=" + document.getElementById("salary_BO_STA_BANK_CODE").value 
                   +"&pk_TA_WORKPLACE_CODE=" + document.getElementById("workplace").value;
 
          console.log(param);
         mySheet.DoSearch("${contextPath}/pay/p0003/searchList.do", param);
         
         //mySheet.DoSearch("transaction_data2.json");
         break;
      case "reload": //초기화
         mySheet.RemoveAll();
      
         break;
      case "save": // 저장
         //var tempStr = mySheet.GetSaveString();
         //alert("서버로 전달되는 문자열 확인 :"+tempStr);
         mySheet.DoSave("${contextPath}/pay/p0003/saveData.do");
         break;         
      case "insert":
          mySheet.DataInsert(-1);
          //코드부분 들어가는 코딩
          var select_row = mySheet.GetSelectRow();
          var col = 3;
          mySheet.SetCellValue(select_row, col, fk_ta_sawon_code);
          break; 

   }
}
   
// 기타 이벤트 //마우스 클릭시
   function mySheet_OnSelectCell(oldrow,oldcol,row,col) {
      x = "FK_TA_SAWON_CODE=" + mySheet.GetCellValue(row,2);
      console.log(x);
      fk_ta_sawon_code = mySheet.GetCellValue(row,2);
      mySheet2.DoSearch("${pageContext.request.contextPath}/pay/p0003/searchList2.do",x);
   }
   
</script>

<body>
   <div class="modal-dialog modal-lg" role="document">
  <div class="page_title">
  </div>



	 <div class="modal-content">
	<!-- header -->
                <div class="modal-header">
                
                 <div class="exp_product"></div>
       <div class="exp_product">
         
      </div>
      <div class="ib_function float_right">
         <a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
         <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
         </div>
         <br>      <br>
         
            <br>
         <form class="form-inline">
  <div class="form-group">
    <label for="term1">귀속연월</label>
    <input type="text" class="form-control" id="term1" >
  </div>
  
 </form>
                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <div class="col-lg-3 pull-right">
		                   	<div class="input-group custom-search-form">
	                        	<input class="form-control" type="text" id="keyword4Users" name="keyword4Users" onkeydown="if(event.keyCode == 13) { fn_search4Users();}">
	                            <span class="input-group-btn">
	                            	<button class="btn btn-default" onclick="fn_search4Users()"><i class="fa fa-search"></i></button>
	                            </span>
	                       	</div>
	                  
	<!-- title -->
	</div>
                    <h4 class="modal-title" id="myModalLabel"><s:message code="memu.user"/></h4>
                </div>

	<!-- body -->                
                <div class="modal-body">

		            <!-- /.row -->
		            <div class="row">
		            	<div class="col-lg-4" >
			            	<div class="panel panel-default" >

						<!-- 영역1 제목 -->
			            		<div class="panel-heading">
			                            <s:message code="common.deptList"/>
			                    </div>
					<!-- 영역1 뿌려지는부분 -->
			                    <div class="maxHeight400">
							    	<div id="deptTree4Users">
							    	
									</div>
								</div>
							</div>
		                </div> 
		            	<div class="col-lg-4" >
			            	<div class="panel panel-default" >
					<!-- 영역2 제목 -->
			            		<div class="panel-heading">
			            			<s:message code="common.userList"/>
			                    </div>
					<!-- 영역2 뿌려지는부분 -->
			                    <div class="panel-body maxHeight400" id="userlist4Users">
							    </div>    
							</div>
						</div>	
		            	<div class="col-lg-4" >
					<!-- 영역3 제목 -->
			            	<div class="panel panel-default" >
			            		<div class="panel-heading">
			            			<s:message code="common.selectedUser"/>
			                    </div>
					<!-- 영역3 뿌려지는부분 -->
			                    <div class="panel-body maxHeight400">
									 <table  id="seletedUsers" class="table table-striped table-bordered table-hover">
										<colgroup>
											<col width='80%' />
											<col width='10%' />
										</colgroup>
										<thead>
											<tr>
												<th><s:message code="common.name"/></th>
												<th></th> 
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
							    </div>    
							</div>
						</div>	
		            </div>
            		<!-- /.row -->                
                </div>
		<!-- 하단 footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close"><s:message code="common.btnClose"/></button>
                    <button type="button" class="btn btn-primary" onclick="fn_closeUsers()"><s:message code="common.btnOK"/></button>
                </div>
		    </div>
	  	</div>

     
        
        <!--right단 정보입력 및 수정단 -->
      
      <script>LoadPage();</script>
 
          
   
    <!--main_content-->

</body>
</html>