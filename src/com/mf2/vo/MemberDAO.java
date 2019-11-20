package com.mf2.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	private DataSource ds; 
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	int result = 0;
	public MemberDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public int isId(String id) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			
			String sql = "select id from member where id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 0;  // 아이디 있다.
			} else {
				result = -1; // 아이디 없다.
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	private void close() {
		try {
			if(rs != null) {rs.close(); rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(con != null) {con.close(); con=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
