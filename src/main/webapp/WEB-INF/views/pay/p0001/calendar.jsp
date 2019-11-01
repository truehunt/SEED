<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Calendar"%> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
    <% 
    Calendar cal = Calendar.getInstance(); 

    int nowYear = cal.get(Calendar.YEAR); 
    int nowMonth = cal.get(Calendar.MONTH)+1; 

    String fyear =request.getParameter("year"); 
    String fmonth = request.getParameter("month"); 

    int year = nowYear; 
    int month = nowMonth; 

    if(fyear !=null){ 
     year = Integer.parseInt(fyear); 
    } 

    if(fmonth !=null){ 
     month = Integer.parseInt(fmonth); 
    } 

    cal.set(year, month-1,1); 

    year = cal.get(Calendar.YEAR); 
    month = cal.get(Calendar.MONTH)+1; 

    int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); 
    int week = cal.get(Calendar.DAY_OF_WEEK); 

    
%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>달력창</title> 
<script language="javascript"> 

function sss1(year, month, j){ 
    alert(year+"-"+month+"-"+j); 
    opener.thisform1.attribute.value=year+"-"+month+"-"+j; 
    self.close(); 
} 

 

</script> 
</head> 
<body> 
<center> 

<a href = "calendar.do?year=<%=year %>&month=<%=month -1 %>">이전달</a>&nbsp; 
    <b><%=year%>년&nbsp;&nbsp;<%=month%>월</b> 
<a href = "calendar.do?year=<%=year %>&month=<%=month +1 %>">&nbsp;다음달</a> 
    <table border="1">  
        <tr> 
            <td style = color:red;>일</td> 
            <td>월</td> 
            <td>화</td> 
            <td>수</td> 
            <td>목</td> 
            <td>금</td> 
            <td style = color:blue;>토</td> 
        </tr> 
         
        <tr> 
            <% 
                for (int i =1; i < week; i++) { 
            %> 
            <td height="20">&nbsp;</td> 
            <% 
                } 
            %> 
            <% 
                for (int j = 1; j <= endDay; j++) { 
                    week++; 
                    if (week % 7 == 2) { 
            %> 
        </tr> 

                <tr> 
             <% } %> 
                        <%if(week % 7 == 2){%> 
                         <td onclick="javascript:sss1(<%=year%>,<%=month%>,<%=j%>)"; style="color: red ";><%=j%></td> 
                            <%}else if(week%7==1){%> 
                            <td onclick="javascript:sss1(<%=year%>,<%=month%>,<%=j%>)"; style="color: blue ";><%=j%></td> 
                            <%}else {%> 
                            <td onclick="javascript:sss1(<%=year%>,<%=month%>,<%=j%>)"; style="color: block ";><%=j%></td>     
                   
                    <% } 

                } 
                %> 
                
             </tr> 
    </table> 
</center> 
</body> 
</html>

 
