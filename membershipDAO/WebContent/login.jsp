<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if(session.getAttribute("ValidMem") != null)  { %> <!-- 이미 로그인된 상태면 메인화면으로 이동 -->
	<jsp:forward page="main.jsp"></jsp:forward>   
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<form action="loginOK.jsp" method="post"> <!-- 세션이 존재하면 세션의 아이디를 불러와서 출력 -->
		아이디 : <input type="text" name="id" value="<% if(session.getAttribute("id") != null) out.println(session.getAttribute("id")); %>"><br />
		비밀번호 : <input type="password" name="pw"><br />
		<input type="submit" value="로그인"> &nbsp;&nbsp; <input type="button" value="회원가입" onclick="javascript:window.location='join.jsp'">
	</form>
</body>
</html>