<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- ���� ���� �� ���� -->
    <%!
    	Connection con;
    	Statement stmt;
    	ResultSet rs;
    	
    	String driver = "oracle.jdbc.driver.OracleDriver";
    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String uid = "scott";
    	String upw = "tiger";
    	String query = "select * from memberforpre";
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		try{ // DB ����
			Class.forName(driver);
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			// ���ڵ��� ���� �޾ƿͼ� ������ �����ϰ� ��� 
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				
				out.println("���̵� : " + id + ", ��й�ȣ : " + pw + ", �̸� : " + name + ", ��ȭ��ȣ : " + phone + "<br />");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { // ���� ����
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch(Exception e) {}
		}
	%>

</body>
</html>