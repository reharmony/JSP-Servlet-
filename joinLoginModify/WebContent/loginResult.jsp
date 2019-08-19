<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- 변수 선언 -->
    <%!
    	String name, id, pw;
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 결과 화면</title>
</head>
<body>
	
	<!-- 세션 값 변수에 넣기 -->
	<%
		name = (String)session.getAttribute("name");
		id = (String)session.getAttribute("id");
		pw = (String)session.getAttribute("pw");
	%>
	
	<!-- 변수의 값 출력 -->
	<%= name %>님 안녕하세요<br /><br />
	<a href="modify.jsp">회원정보 수정</a>
</body>
</html>