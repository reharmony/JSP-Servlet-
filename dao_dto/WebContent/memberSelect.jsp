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
		// DAO�� �ҷ��� DB ������ DTO ��ü�� ����
		MemberDAO memberDAO = new MemberDAO();
		ArrayList<MemberDTO> dtos = memberDAO.memberSelect();
		
		// for������ ȸ�������� ������ Ǯ� ����
		for (int i=0; i<dtos.size(); i++) {
			MemberDTO dto = dtos.get(i);
			String name = dto.getName();
			String id = dto.getId();
			String pw = dto.getPw();
			String phone = dto.getPhone1() + " - " + dto.getPhone2() + " - " + dto.getPhone3();
			String gender = dto.getGender();
			
			// ȸ������ ���
			out.println("�̸� : " + name + ", ���̵� : " + id + ", ��й�ȣ : " + pw + ", ����ó : " + phone + ", ����: " + gender + "<br />");						
		}
		
	%>

</body>
</html>