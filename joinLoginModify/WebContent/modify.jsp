<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	
	<!-- ���� ���� -->
	<%!
		Connection con;
		Statement stmt;
		ResultSet reset;
		
		String name, id, pw, phone1, phone2, phone3, gender;
	%>

<title>ȸ������ ���� ȭ��</title>
</head>
<body>
	
	<!-- DB�� �����Ͽ� ȸ�������� �޾ƿ� ������ ���� -->
	<%
		id = (String)session.getAttribute("id");
	
		String query = "select * from member where id = '" + id + "'";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		stmt = con.createStatement();
		reset = stmt.executeQuery(query);
		
		while(reset.next()) {
			name = reset.getString("name");
			pw = reset.getString("pw");
			phone1 = reset.getString("phone1");
			phone2 = reset.getString("phone2");
			phone3 = reset.getString("phone3");
			gender = reset.getString("gender");
		}
	%>
	
	<!-- ȸ������ ���� �Է� �� -->
	<form action="ModifyOK" method="post">
		�̸� : <input type="text" name="name" size="10" value=<%=name %>><br />
		���̵� : <%=id %><br />
		��й�ȣ : <input type="password" name="pw" size="10"><br />
		��ȭ��ȣ : <select name="phone1">
			<option value="010">010</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			<option value="011">011</option>
		</select> - 
		<input type="text" name="phone2" size="5" value=<%=phone2 %>> - <input type="text" name="phone3" size="5" value=<%=phone3 %>> <br />
		<% 
			if(gender.equals("man")) {
		%>
		�������� : <input type="radio" name="gender" value="man" checked="checked">�� &nbsp;<input type="radio" name="gender" value="woman">��<br />
		<% 
			} else { 
		%>
		�������� : <input type="radio" name="gender" value="man">�� &nbsp;<input type="radio" name="gender" value="woman" checked="checked">��<br />
		<%
			}
		%>
		<input type="submit" value="��������"> <input type="reset" value="���">
	</form>
	
</body>
</html>