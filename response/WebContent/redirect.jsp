<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%!
		int age;
	%>
	
	<%
		String str = request.getParameter("age");
		age = Integer.parseInt(str);
		
		if (age >= 20) {
				response.sendRedirect("ok.jsp");
		} else {
				response.sendRedirect("no.jsp");
		}
	%>

</body>
</html>