package mvc.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import mvc.board.db.BoardBean;

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
			
			String sql = "select member_id from member where member_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 0;  // id 있다.
			} else {
				result = -1;  // id 없다.
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		System.out.println("결과는 = " + result);
		return result;
	}
	public int isId(String id, String pass) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			
			String sql = "select member_id, member_password from member where member_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(2).equals(pass)) {
					result = 1;	 // 비밀번호 일치
				} else {
					result = 0;  // 비밀버놓 일치X
				}				
			} else {
				result = -1;  // id 없다.
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		System.out.println("결과는 = " + result);
		
		return result;
	}
	public int update(Member m) {
		int result = 0;
		try {
			con = ds.getConnection();
			
			String sql = "update member set member_name = ?, "
					+ " member_password = ? , member_address = ?, member_gender = ?, member_phone_number = ? , member_preference = ?"
					+ " where member_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getAddress());
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getPhone_number());
			pstmt.setString(6, m.getPreference());
			pstmt.setString(7, m.getId());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("update에서 오류");
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	public int getListCount(int search_field, String search_word) {
		int x = 0;
		String field = "";
		switch(search_field) {
		case 0:
			field = " where member_id like ";
			field += "'%"+search_word+"%'";
			break;
		case 1:
			field = " where member_name like ";
			field += "'%"+search_word+"%'";
			break;
		case 2:
			field = " where member_address like ";
			field += "'%"+search_word+"%'";
			break;
		case 3:
			field = " where member_gender like ";
			field += "'%"+search_word+"%'";
			break;
		}
		System.out.println(" getListCount field = " + field);
		try { 
			con = ds.getConnection();
			pstmt= con.prepareStatement("select count(*) from member "+field);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Member에 getListCount 에러" + e);
		} finally {
			close();
		}
		return x;
	}
	public List<Member> getList(int search_field, String search_word, int page, int limit) {
		List<Member> list = new ArrayList<Member>();
		String field = "";
		switch(search_field) {
		case 0:
			field = " and member_id like ";
			field += "'%"+search_word+"%'";
			break;
		case 1:
			field = " and member_name like ";
			field += "'%"+search_word+"%'";
			break;
		case 2:
			field = " and member_address like ";
			field += "'%"+search_word+"%'";
			break;
		case 3:
			field = " and member_gender like ";
			search_word = (search_word.equals("남")) ? "1":"2";
			// 성별이 남이 아닐 경우 여자로 값을 넣어줌(유효성으로 필터해야할 필요 있음)
			field += "'%"+search_word+"%'";
			
			break;
		}
		System.out.println("field = " + field);
		
		
		try {
			con = ds.getConnection();
			
			String sql = "select * from (select b.*, rownum rnum "
					+                 " from (select * from member where member_id != 'admin@mfe.com' "
					+                   field
					+ "                 order by member_id) b "
					+ 				   ") "
					+ "         where rnum >= ? and rnum<=? ";
			pstmt = con.prepareStatement(sql);
			int startrow = (page-1) * limit +1;
			int endrow = startrow + limit -1;
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()) {
				Member m = new Member();
				m.setId(rs.getString(1));
				m.setPassword(rs.getString(2));
				m.setName(rs.getString(3));
				m.setAddress(rs.getString(4));
				m.setPhone_number(rs.getString(5));
				m.setPreference(rs.getString(6));
				m.setGender(rs.getString(7));
				list.add(m);
			}
			return list;
		} catch(SQLException e) {
			System.out.println("getList에서 에러");
			e.printStackTrace();
		} finally {
			close();
		}
		
		return null;
	}
	public Member member_info(String id) {
		Member m = null;
		
		try {
			con = ds.getConnection();
			String sql = "select * from member where member_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new Member();
				m.setId(rs.getString(1));
				m.setPassword(rs.getString(2));
				m.setName(rs.getString(3));
				m.setAddress(rs.getString(4));
				m.setPhone_number(rs.getString(5));
				m.setPreference(rs.getString(6));
				m.setGender(rs.getString(7));
				
			}
		} catch(SQLException e) {
			System.out.println("member_info에서 에러");
			e.printStackTrace();
		} finally {
			close();
		}
		return m;
	}
	
	public int delete(String id) {
		result = 0;
		try {
			con=ds.getConnection();
			System.out.println("getConnection");
			
			pstmt = con.prepareStatement("delete from member where member_id = ?");
			pstmt.setString(1,  id);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("delete오류");
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	public Member getDetail(String id) {
		Member m = new Member();
		
		try {
		con = ds.getConnection();
		System.out.println("getConnection");
		
		pstmt = con.prepareStatement("select * from member where member_id = ?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			m.setId(rs.getString(1));
			m.setPassword(rs.getString(2));
			m.setName(rs.getString(3));
			m.setAddress(rs.getString(4));
			m.setPhone_number(rs.getString(5));
			m.setPreference(rs.getString(6));
			m.setGender(rs.getString(7));
		}
		
		} catch(SQLException e) {
			System.out.println("getDetail() 에러 : " + e);
			e.printStackTrace();
		}finally {
			close();
		}
		
		return m;
		
	}
	
	public int insert(Member m) {
		result = 0;
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			
			pstmt = con.prepareStatement("INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getPhone_number());
			pstmt.setString(6, m.getPreference());
			pstmt.setString(7, m.getGender());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
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