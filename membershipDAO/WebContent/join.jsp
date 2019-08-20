<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script language="JavaScript" src="members.js"></script> <!-- 자바스크립트 파일 지정  -->
</head>
<body> <!-- members.js파일 안에 있는 infoConfirm() 메소드를 통과해야 회원가입 완료 -->
	<form action="joinOK.jsp" method="post" name="reg_frm">
		아이디 : <input type="text" name="id" size="20"><br />
		비밀번호 : <input type="password" name="pw" size="20"><br />
		비밀번호 확인 : <input type="password" name="pw_check" size="20"><br />		
		이름 : <input type="text" name="name" size="20"><br />
		메일 : <input type="text" name="eMail" size="20"><br />
		주소 : <input type="text" name="address" size="50"><br />
		<input type="button" value="회원가입" onclick="infoConfirm()">&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='login.jsp'">		
	</form>
</body>
</html>