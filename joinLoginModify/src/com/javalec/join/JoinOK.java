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
		request.setCharacterEncoding("EUC-KR"); // �ѱ� ���ڵ�
		
		// join.html���� ���� �Է��� �� �޾ƿ� ������ ����
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		
		// SQL�� �ۼ�
		String query = "insert into member values('" + name + "', '" + id + "', '" + pw + "', '" + phone1 + "', '" + phone2 + "', '" + phone3 + "', '" + gender + "')";
		
		// JDBC�� �̿��� DB�� �����ϰ� SQL�� ����
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // JDBC ����̹� �ε�
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger"); // DB����
			stmt = con.createStatement(); // connection�� statement ����
			int i = stmt.executeUpdate(query); // statement ��ü�� SQL�� ����
			if(i == 1) { // ���� ������ ���� ��� Ȯ�� �������� �̵� 
				System.out.println("insert success");
				response.sendRedirect("joinResult.jsp");
			} else { // ���� ���н� ���� �� ȭ������ �ٽ� �̵�
				System.out.println("insert fail");
				response.sendRedirect("join.html");
			}
			
		} catch (Exception e) { // ���� �߻���
			e.printStackTrace();
			
		} finally { // ���� �۾�
			
			try {
				if(stmt != null) stmt.close(); // statement ����
				if(con != null) con.close(); // connection ����
				
			} catch (Exception e) {}
		}
		
	}

}
