<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true" %> <!-- �� �������� �������������� ����ϰ� eception �޼ҵ带 ��� �������� -->
<% response.setStatus(200); %> <!-- �⺻���� 500���� ���õǾ� �� ������ ��ü�� ������ �ν��ϴ� ��찡 �ֱ� ������ 200�� ��� -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	������ �߻��߽��ϴ�. <br><br>
	���� ����: <%= exception.getMessage() %>
</body>
</html>