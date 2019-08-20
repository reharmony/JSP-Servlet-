<%@page import="com.javalec.memberDAO.MemberDTO"%>
<%@page import="com.javalec.memberDAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 인코딩
	request.setCharacterEncoding("UTF-8");

	// 넘어온 아이디와 비번 값 변수에 저장
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// DAO 인스턴스 생성
	MemberDAO dao = MemberDAO.getInstance();
	int checkNum = dao.userCheck(id, pw);
	
	// 체크 결과에 따라 안내 메세지 출력
	if (checkNum == -1) { 
%>    
		<script language="javascript">
			alert("존재하지 않는 아이디입니다.")
			history.go(-1);
		</script>
<%
	} else if(checkNum == 0) {
%>		
		<script language="javascript">
			alert("비밀번호가 틀립니다.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 1) {
		MemberDTO dto = dao.getMember(id);
		
		if(dto == null) {	
%>
		<script language="javascript">
			alert("존재하지 않는 회원입니다.");
			history.go(-1);
		</script>
<%
		} else { // 로그인 성공시 세션 값 설정
			String name = dto.getName();
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("ValidMem", "yes");
			response.sendRedirect("main.jsp");
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