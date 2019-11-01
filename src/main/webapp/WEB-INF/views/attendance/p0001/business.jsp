<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<title>출장 신청</title>

<h3>출장신청</h3>
<h6>
	사원번호 <input type="TEXT" name="SAWON_ID" SIZE="10"> &emsp;
	&emsp; &emsp; 전자결재 상태 <select name="PAY">
		<option value="">전자 결재 상태</option>
		<option value="작성">작성</option>
		<option value="반려">반려</option>
		<option value="완료">완료</option>
	</select> <br> <br>신청일자
	<script language="javascript">
	
		$(function() {
			// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
			// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

			//시작일.
			$('#fromDate')datepicker({
				showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
				buttonImage : "images/duke.png", // 버튼 이미지
				buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
				dateFormat : "yy-mm-dd", // 날짜의 형식
				changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
				//minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
				onClose : function(selectedDate) {
					// 시작일(fromDate) datepicker가 닫힐때
					// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
					$("#toDate").datepicker("option", "minDate", selectedDate);
				})};

			//종료일
			$('#toDate').datepicker({
						showOn : "both",
						buttonImage : "images/duke.png",
						buttonImageOnly : true,
						dateFormat : "yy-mm-dd",
						changeMonth : true,
						//minDate: 0, // 오늘 이전 날짜 선택 불가
						onClose : function(selectedDate) {
							// 종료일(toDate) datepicker가 닫힐때
							// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
							$("#fromDate").datepicker("option", "maxDate",
									selectedDate);
						}
					});
		});
	</script>
	<input type="button" value="검색" style="float: right;">
</head>
<body>
	<form>
		<input type="text" name="fromDate" id="fromDate"> ~ <input
			type="text" name="toDate" id="toDate">
	</form>
	<br>
	<h4>출장신청 내역</h4>
	<td width="547" height="45" align="left" class="A_HOLIDAY">휴가 신청
		내역</td>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<td width="09%"
							style="background-color: #eeeeee; text-align: center;">신청번호</td>&emsp;
						<td width="12%"
							style="background-color: #eeeeee; text-align: center;">신청일자</td>&emsp;
						<td width="10%"
							style="background-color: #eeeeee; text-align: center;">신청자</td>&emsp;
						<td width="25%"
							style="background-color: #eeeeee; text-align: center;">출장목적</td>&emsp;
						<td width="10%"
							style="background-color: #eeeeee; text-align: center;">출장기간</td>&emsp;
						<td width="10%"
							style="background-color: #eeeeee; text-align: center;">출장비
							총액</td>&emsp;
						<td width="10%"
							style="background-color: #eeeeee; text-align: center;">전자결재상태</td>&emsp;
						<td width="10%"
							style="background-color: #eeeeee; text-align: center;">정산상태</td>&emsp;
					</tr>
				</thead>
			</table>
		</div>
	</div>
	</script>
	<br>
	<h4>출장신청</h4>
	<br>
	<br>신청번호
	<input type="TEXT" style="width: 130px; height: 18px;"
		SAWON_ID" SIZE="10"> &emsp; 신청일자
	<script type="text/javascript" src="/common/js/calendar.js"></script>
	<script type="text/javascript">
 monthName=new Array("1","2","3","4","5","6","7","8","9","10","11","12")
 monthDays=new Array(31,28,31,30,31,30,31,31,30,31,30,31)
 now=new Date()
 nowd=now.getDate()
 nowm=now.getMonth()
 nowy=now.getFullYear()
 
 function showCalendar(day,month,year,idx,layer) {
 
    if ((year%4==0||year%100==0)&&(year%400==0)) monthDays[1]=29; else monthDays[1]=28 //leap year test
    var firstDay=new Date(year,month,1).getDay()
 
    var calStr ="<table cellspacing='0' style='width: 171px; height: 161px;'><tr><td style='height: 10px; background: url(/img/common/bg_calendar_top.gif) no-repeat;'></td></tr><tr><td style='vertical-align: top; background: url(/img/common/bg_calendar_middle.gif) repeat-y top left'><table cellspacing='0' style='width: 100px; margin: 0 auto'>"
    calStr+="<td style='width: 10px' class='al'><a href='javascript:;' onClick='nowm--; if (nowm<0) { nowy--; nowm=11; } showCalendar(nowd,nowm,nowy,\""+idx+"\",\""+layer+"\")' title='이전 월'> <img src='/img/common/bt_bl_left.gif' width='7' height='7' alt='이전 월' hspace='5' /></a></td>"
    calStr+="<td class='ac emp'>"+year+"."+monthName[month].toUpperCase()+"</td>"
    calStr+="<td style='width: 10px;' class='ar'><a href='javascript:;'  onClick='nowm++; if (nowm>11) { nowy++; nowm=0; } showCalendar(nowd,nowm,nowy,\""+idx+"\",\""+layer+"\")' title='다음 월'> <img src='/img/common/bt_bl_right.gif' width='7' height='7' alt='다음 월' hspace='5' /></a></td>"
    calStr+="</tr></table>"
 
    calStr+="<table cellspacing=1  class='calTb'>"
    calStr+="<tr>"
    calStr+="<th>일</th>"
    calStr+="<th>월</th>"
    calStr+="<th>화</th>"
    calStr+="<th>수</th>"
    calStr+="<th>목</th>"
    calStr+="<th>금</th>"
    calStr+="<th>토</th>"
    calStr+="</tr>"
 
    var dayCount=1
 
    calStr+="<tr>"
  
    for (var i=0;i<firstDay;i++) calStr+="<td> "  //공백
 
    for (var i=0;i<monthDays[month];i++)        {
 
        if( (dayCount==nowd) && (this.nowm == now.getMonth()) && (this.nowy == now.getFullYear()) ) {
            calStr+="<td style='background: #5089cd; color: #fff' class='emp'>" // 오늘 날짜일때 배경색 지정,글자 진하게
        } else {
            calStr+="<td>"  // 오늘 날짜가 아닐때 배경색 지정
        }
 
 //                alert(new Date(year,month,dayCount).getDay());
        switch (new Date(year,month,dayCount).getDay()) {
            case 0:
                calStr += "<a href='javascript: insertInput(\""+year+"/"+monthName[month].toUpperCase()+"/"+dayCount+"\",\""+idx+"\"); displayCalendar(2,\""+idx+"\",\""+layer+"\");' class='sun'>"
                break;
            case 6:
                calStr += "<a href='javascript: insertInput(\""+year+"/"+monthName[month].toUpperCase()+"/"+dayCount+"\",\""+idx+"\"); displayCalendar(2,\""+idx+"\",\""+layer+"\");' class='sat'>"
                break;
            default:
                if((dayCount==nowd) && (this.nowm == now.getMonth()) && (this.nowy == now.getFullYear())){
                    calStr += "<a href='javascript: insertInput(\""+year+"/"+monthName[month].toUpperCase()+"/"+dayCount+"\",\""+idx+"\"); displayCalendar(2,\""+idx+"\",\""+layer+"\");' class='day'>"
                }else{
                    calStr += "<a href='javascript: insertInput(\""+year+"/"+monthName[month].toUpperCase()+"/"+dayCount+"\",\""+idx+"\"); displayCalendar(2,\""+idx+"\",\""+layer+"\");'>"
                }
        }
 
 
        calStr+=dayCount++   // 날짜
        calStr+="</a>"
 
        if(dayCount==nowd) {
            calStr+="" // 오늘 날짜일때 글자 진하게
        } else {
            calStr+=""  // 오늘 날짜가 글자 진하게 안함
        }
 
        calStr+=""
        if ((i+firstDay+1)%7==0&&(dayCount<monthDays[month]+1)) calStr+="<tr>"
    }
    var totCells=firstDay+monthDays[month]
    for (var i=0;i<(totCells>28?(totCells>35?42:35):28)-totCells;i++) calStr+="<td> "
    calStr+="</table></td></tr><tr><td style='height: 10px; background: url(/img/common/bg_calendar_bottom.gif) no-repeat;'></td></tr></table>"
 
    document.getElementById(layer).innerHTML=calStr;
 }
 
 function insertInput(val,idx){
    document.getElementById(idx).value = val;
 }
 
 function displayCalendar(no,id,layer){
    if(no == 1){
        document.getElementById(layer).style.display = "block";
        showCalendar(this.nowd,this.nowm,this.nowy,id,layer);
    }else{
        document.getElementById(layer).style.display = "none";
    }
 }</script>

	<input type="text" id="startDate"
		style="width: 130px; height: 18px; padding-top: 3px; padding-left: 10px" />
	<a href="javascript: displayCalendar(1,'startDate','popCalendar');">
		<img src="/img/reservation/bt_calendar.gif" width="16" height="19"
		alt="" style="vertical-align: top; margin-top: 3px" />
	</a>
	<div id="popCalendar"
		style="position: absolute; top: 110px; right: 110px; left: 200px; display: none;"></div>
	&emsp; 전자결재상태
	<input type="text" id="state"
		style="width: 130px; height: 18px; padding-top: 3px; padding-left: 10px" />
	<br>&emsp;신청자
	<input type="text" id="SAWON_ID"
		style="width: 100px; height: 18px; padding-top: 3px; padding-left: 10px" />
	<input type="text" id="SAWON_NM"
		style="width: 100px; height: 18px; padding-top: 3px; padding-left: 10px" />
	<input type="text" id="DEPT_NM"
		style="width: 100px; height: 18px; padding-top: 3px; padding-left: 10px" />
	<br> 출장기간
	<input type="text" id="startDate"
		style="width: 130px; height: 18px; padding-top: 3px; padding-left: 10px" />
	~
	<input type="text" id="endDate"
		style="width: 130px; height: 18px; padding-top: 3px; padding-left: 10px" />&emsp;&emsp;&emsp;
	&emsp;&emsp;&emsp;&emsp;&emsp; 출장지역
	<input type="text" id="endDate"
		style="width: 130px; height: 18px; padding-top: 3px; padding-left: 10px" />
	<br>&emsp;출장비
	<input type="text" id="endDate"
		style="width: 130px; height: 18px; padding-top: 3px; padding-left: 10px" />
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	출장 목적 (장소)
	<input type="text" id="endDate"
		style="width: 130px; height: 18px; padding-top: 3px; padding-left: 10px" />
	<br> 신청내용
	<input type="text" id="change" value=""
		style="width: 500px; height: 200px; padding-top: 3px; padding-left: 10px" />
	<!--  여러줄!!! -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<input type="button" value="저장" style="float: right;">
	<input type="button" value="삭제" style="float: right;">
	<input type="button" value="신규" style="float: right;">
</body>
</html>


</body>
</html>
