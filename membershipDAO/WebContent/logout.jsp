<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); /* 세션 종료 */
	response.sendRedirect("login.jsp"); /* 세션 종료 후 login.jsp 페이지로 이동 */
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>