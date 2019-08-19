<%@page import="dao_dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao_dto.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	
	<%
		// DAO로 불러온 DB 정보를 DTO 객체에 저장
		MemberDAO memberDAO = new MemberDAO();
		ArrayList<MemberDTO> dtos = memberDAO.memberSelect();
		
		// for문으로 회원정보를 변수에 풀어서 저장
		for (int i=0; i<dtos.size(); i++) {
			MemberDTO dto = dtos.get(i);
			String name = dto.getName();
			String id = dto.getId();
			String pw = dto.getPw();
			String phone = dto.getPhone1() + " - " + dto.getPhone2() + " - " + dto.getPhone3();
			String gender = dto.getGender();
			
			// 회원정보 출력
			out.println("이름 : " + name + ", 아이디 : " + id + ", 비밀번호 : " + pw + ", 연락처 : " + phone + ", 성별: " + gender + "<br />");						
		}
		
	%>

</body>
</html>