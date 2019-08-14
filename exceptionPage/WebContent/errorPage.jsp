<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true" %> <!-- 이 페이지가 에러페이지임을 명시하고 eception 메소드를 사용 가능해짐 -->
<% response.setStatus(200); %> <!-- 기본값이 500으로 세팅되어 이 페이지 자체를 에러로 인식하는 경우가 있기 때문에 200을 명시 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	에러가 발생했습니다. <br><br>
	에러 원인: <%= exception.getMessage() %>
</body>
</html>