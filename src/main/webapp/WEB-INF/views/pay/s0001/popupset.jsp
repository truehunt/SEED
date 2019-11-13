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

<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
    function LoadPage() {

      
    createIBSheet2($("#deptTree4Users")[0],"mySheet7", "100%", "300px");
       
      var cfg = {FrozenCol:7,MergeSheet:msHeaderOnly };  
      mySheet7.SetConfig(cfg); 
      
      var header = [
         {Text:"NO|직종|급여형태|급여형태|급여형태|급여형태|급여형태|급여형태",Align:"Center"},
         {Text:"NO|직종|전체|월급|연봉|일급|시급",Align:"Center"}
    
         ];  
      var info = {Sort:0,ColMove:1,ColResize:1};  
      mySheet7.InitHeaders(header,info);  
      
      var cols = [   
        {Header:"NO",Type:"Seq",Width:50,SaveName:"fk_D_B_PAYMENT_SEQ_CODE", Align:"Center"},
          {Header:"급여구분",Type:"Text",SaveName:"pk_PAY_BEN_C_UNIQUE_NUM",Width:100,Align:"Center"},
          {Header:"기준일수",Type:"AutoSum",SaveName:"pay_BEN_C_DATE_RECRUIT",Width:70, Align: "Center"},
         {Header:"기준일수",Type:"AutoSum",SaveName:"pay_BEN_C_DATE_RECRUIT",Width:70, Align: "Center"},
         {Header:"방법",Type:"AutoSum",SaveName:"pay_BEN_C_RETIRE_BEN_METHOD",Width:70, Align: "Center"},
         {Header:"기준일수",Type:"AutoSum",SaveName:"pay_BEN_C_DATE_RESIG",Width:70, Align: "Center"},
         {Header:"기준일수",Type:"AutoSum",SaveName:"pay_BEN_C_DATE_RESIG",Width:70, Align: "Center"}

   
          ];
      
      
      mySheet7.InitColumns(cols);
      mySheet7.SetSumText(1,"합   계");
      
      
      //달력
     
      
      $('#term3').datepicker().on('changeDate', function(ev) {
          if (ev.viewMode=="days"){
              $('#term3').datepicker('hide');
          }
      });
      
      $('#term2').datepicker().on('changeDate', function(ev) {
    	  if (ev.viewMode=="days"){
              $('#term2').datepicker('hide');
          }
      });
    
  
    
    }

   
</script>

<body>
   <div class="modal-dialog modal-md" role="document">
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
  <div class="form-group" >
     &emsp; <label for="term3">상여지급대상기간</label>
     &ensp; &ensp;<input type="text" class="form-control" id="term3" style="center;">
     <script> $('#term3').datepicker('show');</script>
    ~ 
  </div>
  <div class="form-group">
    <input type="text" class="form-control" id="term2" >
  </div>
  </form>
 
                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                   <div class="col-lg-3 pull-right">
                            <div class="input-group custom-search-form">
      
                             </div>
                     
   <!-- title -->
   </div>
                    <h4 class="modal-title" id="myModalLabel"><s:message code="memu.user"/></h4>
                </div>

   <!-- body -->                
                <div class="modal-body">

                  <!-- /.row -->
                

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