<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if(session.getAttribute("ValidMem") == null) {
%>
	<jsp:forward page="login.jsp"></jsp:forward> <!-- 로그아웃 상태라면 로그인 페이지로 이동 -->
<%
	}
	// 세션에서 정보를 받아와 변수에 저장
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
</head>
<body>
	<h1><%= name %>님 안녕하세요.</h1><br /> <!-- 로그인한 회원 이름 표시 -->
	<form action="logout.jsp" method="post"> <!-- 로그아웃 버튼과 정보수정 버튼 클릭시 동작 -->
		<input type="submit" value="로그아웃">&nbsp;&nbsp;&nbsp;<input type="button" value="정보수정" onclick="javascript:window.location='modify.jsp'">
	</form>
</body>
</html>