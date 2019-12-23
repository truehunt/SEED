## SEED ##
SEED는 ERP시스템의 인사관리기능(인적자원관리, 근태관리, 급여관리, 교육관리)과 그룹웨어의 전자결재, 일정관리, 게시판, 공지사항 기능을 결합하여 웹으로 구현하였습니다.

### 주요 구현 기능 ###
- 인적자원관리
- 근태관리
- 급여관리
- 교육관리
- 일정관리
- 전자결재
- 게시판

### 개발 환경 ###
    OS / DB / Server : Windows 10, Oracle DB 11g, Apache Tomcat 9.0
    Tooling: Eclipse, SQL Developer, Git, GitHub, maven
    Programming Language: Java 1.8, Servlet, JSP
    Framework/Library: Spring3.1, Bootstrap3.3.7, MyBatis 3.0
    Web standard : JavaScript, HTML5, CSS3, jQuery, Ajax
    etc : JSTL, IBSheet, IBTab, CKEditor, Morris chart, Date Picker, Source Tree, Daum 우편번호 API, DA#Modeler5, Kakao Oven, Font-awesome

### 설치 ###
- Oracle SQL developer 에 데이터 베이스를 생성하고 src/main/resources/tableData.sql 를 실행하여 테이블과 데이터를 생성한다.
- src/main/webapp/WEB-INF/config/jdbc/jdbc.properties에 적절한 접속 정보를 입력한다.
- 톰캣이나 이클립스에서 실행
- http://localhost:8090/SEED 로 접속
- ID/PW: admin/admin
  
  
