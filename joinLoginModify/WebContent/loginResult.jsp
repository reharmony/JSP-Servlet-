<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- ���� ���� -->
    <%!
    	String name, id, pw;
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ��� ȭ��</title>
</head>
<body>
	
	<!-- ���� �� ������ �ֱ� -->
	<%
		name = (String)session.getAttribute("name");
		id = (String)session.getAttribute("id");
		pw = (String)session.getAttribute("pw");
	%>
	
	<!-- ������ �� ��� -->
	<%= name %>�� �ȳ��ϼ���<br /><br />
	<a href="modify.jsp">ȸ������ ����</a>
</body>
</html>