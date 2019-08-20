<%@page import="com.javalec.memberDAO.MemberDTO"%>
<%@page import="com.javalec.memberDAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% /* 세션에서 현재 로그인 중인 사용자 정보 가져오기 */
	String id = (String)session.getAttribute("id");
	MemberDAO dao = MemberDAO.getInstance();
	MemberDTO dto = dao.getMember(id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>
<script language="JavaScript" src="members.js"></script> <!-- 자바스크립트 파일  -->
</head>
<body>
	<!-- 회원정보 수정폼  -->
	<form action="modifyOK.jsp" method="post" name="reg_frm">
		아이디 : <%= dto.getId() %><br />
		비밀번호 : <input type="password" name="pw" size="20"><br />
		비밀번호 확인 : <input type="password" name="pw_check" size="20"><br />
		이름 : <%= dto.getName() %><br />
		메일 : <input type="text" name="eMail" size="20" value="<%= dto.geteMail() %>"><br />
		주소 : <input type="text" name="address" size="50" value="<%= dto.getAddress() %>"><br />
		<input type="button" value="수정" onclick="updateInfoConfirm()"> &nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='login.jsp'">
	</form>
</body>
</html>