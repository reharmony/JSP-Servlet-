package com.javalec.join;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinOK
 */
@WebServlet("/JoinOK")
public class JoinOK extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection con;
	private Statement stmt;
	
	private String name, id, pw, phone1, phone2, phone3, gender;
	
    /**
     * Default constructor. 
     */
    public JoinOK() {
    	super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDO(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDO(request, response);
	}
	
	private void actionDO(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR"); // 한글 인코딩
		
		// join.html에서 폼에 입력한 값 받아와 변수에 저장
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		
		// SQL문 작성
		String query = "insert into member values('" + name + "', '" + id + "', '" + pw + "', '" + phone1 + "', '" + phone2 + "', '" + phone3 + "', '" + gender + "')";
		
		// JDBC를 이용해 DB에 접속하고 SQL문 실행
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // JDBC 드라이버 로드
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger"); // DB연결
			stmt = con.createStatement(); // connection에 statement 생성
			int i = stmt.executeUpdate(query); // statement 객체로 SQL문 실행
			if(i == 1) { // 가입 성공시 가입 결과 확인 페이지로 이동 
				System.out.println("insert success");
				response.sendRedirect("joinResult.jsp");
			} else { // 가입 실패시 가입 폼 화면으로 다시 이동
				System.out.println("insert fail");
				response.sendRedirect("join.html");
			}
			
		} catch (Exception e) { // 에러 발생시
			e.printStackTrace();
			
		} finally { // 최종 작업
			
			try {
				if(stmt != null) stmt.close(); // statement 종료
				if(con != null) con.close(); // connection 종료
				
			} catch (Exception e) {}
		}
		
	}

}
