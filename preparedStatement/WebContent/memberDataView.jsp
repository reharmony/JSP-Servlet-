<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- 변수 선언 및 정의 -->
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
		try{ // DB 접속
			Class.forName(driver);
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			// 레코드의 값을 받아와서 변수에 저장하고 출력 
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				
				out.println("아이디 : " + id + ", 비밀번호 : " + pw + ", 이름 : " + name + ", 전화번호 : " + phone + "<br />");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { // 접속 종료
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch(Exception e) {}
		}
	%>

</body>
</html>