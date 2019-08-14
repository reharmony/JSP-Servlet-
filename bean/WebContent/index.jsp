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

	<jsp:setProperty name="student" property="name" value="이지은"/>
	<jsp:setProperty name="student" property="age" value="19"/>
	<jsp:setProperty name="student" property="grade" value="3"/>
	<jsp:setProperty name="student" property="studentNum" value="27"/>
	
	이름 : <jsp:getProperty name="student" property="name"/><br/>
	나이 : <jsp:getProperty name="student" property="age"/><br/>
	학년 : <jsp:getProperty name="student" property="grade"/><br/>
	번호 : <jsp:getProperty name="student" property="studentNum"/>
	

</body>
</html>