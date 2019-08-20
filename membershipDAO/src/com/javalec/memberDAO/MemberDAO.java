package com.javalec.memberDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	
	
		// True/False�� ����� 0/1 ����  static final ������ �����Ͽ� �ڵ� �������� ����
		public static final int MEMBER_NONEXISTENT = 0;
		public static final int MEMBER_EXISTENT = 1;
		public static final int MEMBER_JOIN_FAIL = 0;
		public static final int MEMBER_JOIN_SUCCESS = 1;
		public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
		public static final int MEMBER_LOGIN_SUCCESS = 1;
		public static final int MEMBER_LOGIN_IS_NOT = -1;
		
		private static MemberDAO instance = new MemberDAO();
		
		private MemberDAO() {			
		}
		
		public static MemberDAO getInstance() {
			return instance;
		}
		
		
		
		
		
		// �Է¹��� ȸ�� ������ DB�� ����
		public int insertMember(MemberDTO dto) {
			int ri = 0;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			String query = "insert into members values (?,?,?,?,?,?)";
			
			try {
				con = getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPw());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.geteMail());
				pstmt.setTimestamp(5, dto.getrDate());
				pstmt.setString(6, dto.getAddress());
				pstmt.executeUpdate();
				ri = MemberDAO.MEMBER_JOIN_SUCCESS;		
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return ri;
			
		}
		
		
		
		
		
		
		// ���̵� �ߺ� Ȯ��
		public int confirmId(String Id) {
			int ri = 0;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "select Id from members where Id = ?";
			
			try {
				con = getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, Id);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					ri = MemberDAO.MEMBER_EXISTENT;
				} else {
					ri = MemberDAO.MEMBER_NONEXISTENT;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					pstmt.close();
					con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return ri;
		}
		
		
		
		
		
		
		// �α��� �õ��� ���̵� ��� üũ
		public int userCheck (String id, String pw) {
			int ri  = 0;
			String dbPw;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String query = "select pw from members where id = ?";
			
			try {
				con = getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					dbPw = rs.getString("pw");
					if (dbPw.equals(pw)) {
						ri = MemberDAO.MEMBER_LOGIN_SUCCESS; // �α��� ����						
					} else {
						ri = MemberDAO.MEMBER_LOGIN_PW_NO_GOOD; // ��й�ȣ ����
					}
				} else {
					ri = MemberDAO.MEMBER_LOGIN_IS_NOT; // ���Ե� ȸ���� �ƴ�
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					rs.close();
					pstmt.close();
					con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return ri;
		}
		
		
		
		
		
		
		// ȸ�������� DTO��ü�� ����
		public MemberDTO getMember(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "select * from members where id = ?";
			MemberDTO dto = null;
			
			try {
				con = getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					dto = new MemberDTO();
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("pw"));
					dto.setName(rs.getString("name"));
					dto.seteMail(rs.getString("eMail"));
					dto.setrDate(rs.getTimestamp("rDate"));
					dto.setAddress(rs.getString("address"));					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					pstmt.close();
					con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}				
			} 
			
			return dto;
		}
		
		
		
		
		
		// ȸ������ ����
		public int updateMember(MemberDTO dto) {
			int ri = 0;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			String query = "update members set pw=?, eMail=?, address=? where id=?";
			
			try {
				con = getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, dto.getPw());
				pstmt.setString(2, dto.geteMail());
				pstmt.setString(3, dto.getAddress());
				pstmt.setString(4, dto.getId());
				ri = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					pstmt.close();
					con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}			
			
			return ri;		
			
		}
		
		
		
		
		
		// ���� ����
		private Connection getConnection() {
			Context context = null;
			DataSource dataSource = null;
			Connection con = null;
			
			try {
				context = new InitialContext();
				dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
				con = dataSource.getConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return con;
		}
}

















































