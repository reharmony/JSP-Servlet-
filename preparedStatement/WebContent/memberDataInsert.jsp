<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- ���� ���� �� ���� -->
    <%!
    	Connection con;
    	PreparedStatement pstmt;
    	ResultSet rs;
    	
    	String driver = "oracle.jdbc.driver.OracleDriver";
    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String uid = "scott";
    	String upw = "tiger";
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		try{ // �ݺ� �۾��� PreparedStatement�� ����ȭȭ�� ������ ����
			Class.forName(driver);
			con = DriverManager.getConnection(url, uid, upw);
			int n;
			String query = "insert into memberforpre (id, pw, name, phone) values (?, ?, ?, ?)";
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "tyk");
			pstmt.setString(2, "123");
			pstmt.setString(3, "���¿�");
			pstmt.setString(4, "010-5939-1937");
			n = pstmt.executeUpdate();
			
			pstmt.setString(1, "ejj");
			pstmt.setString(2, "642");
			pstmt.setString(3, "������");
			pstmt.setString(4, "010-3817-1084");
			n = pstmt.executeUpdate();
			
			pstmt.setString(1, "dongone");
			pstmt.setString(2, "593");
			pstmt.setString(3, "������");
			pstmt.setString(4, "010-2039-5382");
			n = pstmt.executeUpdate();
			
			if(n == 1) {
				out.println("insert success");
			} else {
				out.println("insert fail");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { // ���� ����
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch(Exception e) {}
		}
	%>
	
	<br />
	<a href="memberDataView.jsp">ȸ������ ����</a>
</body>
</html>