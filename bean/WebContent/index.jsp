<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="student" class="com.javalec.bean.Student" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<jsp:setProperty name="student" property="name" value="������"/>
	<jsp:setProperty name="student" property="age" value="19"/>
	<jsp:setProperty name="student" property="grade" value="3"/>
	<jsp:setProperty name="student" property="studentNum" value="27"/>
	
	�̸� : <jsp:getProperty name="student" property="name"/><br/>
	���� : <jsp:getProperty name="student" property="age"/><br/>
	�г� : <jsp:getProperty name="student" property="grade"/><br/>
	��ȣ : <jsp:getProperty name="student" property="studentNum"/>
	

</body>
</html>