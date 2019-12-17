<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
	<!-- ibsheet,tab 관련된 script 및 link 추가  -->

<script type="text/javascript">
//mySheet3
/*Sheet 기본 설정 */
	function Loading2() {
		
		//아이비시트 초기화
		initSheet = {};
		initSheet.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
			// MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
			// Align : data 정렬값.
			// keyfield : keyfield값 필수값 체크시 필요(미입력시 추가안됨.)
			// MultiLineText:1  : 하나의 셀에 여러값을 넣을수 있음(shift+enter)
			// Wrap:1 : 데이터
			// FORMAT 형식 법인/사업자 등록번호 - Format:["IdNo", "SaupNo"], 전화번호/FAX번호 - Format: "PhoneNo", 
			
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center", Hidden:1},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50, Align:"Center", Hidden:1},
			{Header:"부서 코드",Type:"Text",SaveName:"pk_dept_code",MinWidth:70, Align:"Center"},
			{Header:"부서 명",Type:"Text",SaveName:"dept_name",MinWidth:160, Align:"Center"},
			
		];   
	
		//ibSheet 에서 col 지정해서 숨김
	 	//initData.SetColHidden([
	    //  {Col: 0, Hidden:1}, {Col: 1, Hidden:1},	      
	    //]);
		
	}
	
	//초기화
	var codeNum =""; // 코드번호
	var codeName=""; // 관리내역 명
	var code_id=""; // 코드 아이디(값 넣어줄 기준)
	var code_nameId=""; // 코드 명 (값 넣어줄 기준)
	var frameId =""; // iframe 번호
	
	//onClick 클릭시 이벤트
	function mySheet3_OnClick (Row, Col, Value, CellX, CellY, CellW, CellH, rowType){
		codeNum = mySheet3.GetCellValue(Row,'pk_dept_code');
   		codeName = mySheet3.GetCellValue(Row,'dept_name');
   		
   		console.log(codeNum);
   		console.log(codeName);
   	}
	
	function Action_popup2(code, id, name, frame){
		//console.log("code_division"+code_division);
		code_id = id;
		code_nameId = name;
		frameId = frame;
		switch(code) {
		case 'list':
			//test=aaa&test2=bbb
			//var param = 'code_division='+code_division; // 코드번호 값을 param 변수에 저장
			//console.log(param);
			mySheet3.DoSearch("${pageContext.request.contextPath}/system/p0002/dept_pop.do");
			break;
		}
	}
	
	function fn_Dept_Selected() {
		//container1 = $("#ib-container1").detach(); //팝업 한번만 뜨게 함 
		var code_num = codeNum;
		var code_name = codeName;
		
   		console.log(code_num);
   		console.log(code_name);
   		
		//fn_selectCode(code_num, code_name, code_id, code_nameId);
   		
		//iframe 값을 자식 요소에게 넘겨주기
  	  	$(frameId).get(0).contentWindow.fn_Dept_Selected(code_num, code_name, code_id, code_nameId);

	}  
	
</script>

<!-- modal 팝업 출력 부분 -->
<div class="modal-dialog modal-sm" role="document">
  <div class="modal-content">
		  				<div class="modal-header">
		                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                    <h4 class="modal-title" id="myModalLabel">부서 코드 도움</h4>
		                </div>
		                
                		<div class="modal-body">
			 				<div class="row form-group">
				   				<div style="width:5%; float:left;">&nbsp;</div>
								<div id='ib-container1_copy'></div>
								<div id='ib-container1'></div>
							</div>
					</div>
				
						<div class="modal-footer">
				            	<button class="btn btn-outline btn-primary" onclick="fn_Dept_Selected()" data-dismiss="modal" id="close"><s:message code="common.btnOK"/></button>
						</div>
     </div>
</div>
