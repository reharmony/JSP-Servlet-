<%@page import="com.javalec.memberDAO.*"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %> <!-- 한글 인코딩 -->
<jsp:useBean id="dto" class="com.javalec.memberDAO.MemberDTO" /> <!-- 액션태그로 자바 빈 사용 -->
<jsp:setProperty name="dto" property="*" /> 
<!-- form의 각 input태그의 name속성과 bean(DTO)의 getter&setter의 이름이 일치하면 *를 사용하여 form에서 입력한 내용을 자동채우기 할 수 있다 -->
<!-- 그렇지 않으면 모든 값을 다 수동으로 넣어주어야 한다 -->
<%
	dto.setrDate(new Timestamp(System.currentTimeMillis()));
	MemberDAO dao = MemberDAO.getInstance();
	if(dao.confirmId(dto.getId()) == MemberDAO.MEMBER_EXISTENT) {
%>
	<script language="javascript">
		alert("이미 존재하는 아이디입니다.");
		history.back();
	</script>
<%
	} else {
		int ri = dao.insertMember(dto);
		if (ri == MemberDAO.MEMBER_JOIN_SUCCESS) {
			session.setAttribute("id", dto.getId());
%>
		<script language="javascript">
			alert("회원가입을 축하합니다!")
			document.location.href="login.jsp";
		</script>
<%	
		} else {
%>
		<script language="javascript">
			alert("회원가입에 실패했습니다.");
			document.location.href="login.jsp";
		</script>
<%	
		}
	}
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