package mvc.chat.db;

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

import mvc.book.db.BookBean;

public class ChatDAO {
	private DataSource ds; 
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	int result=0;
	
	public ChatDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/OracleDB");
		} catch (NamingException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
	}
	public int getListCount(String id) {
		int x = 0;
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement("select count(*) from chat where chat.member_id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				//총 count 갯수를 뽑아와서 넣어줌
				x = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("getListCount() 에러 : " + e);
			e.printStackTrace();
		}finally {
	         if(pstmt != null) {
		            try {
		               pstmt.close();
		            } catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		      }
		     if(con!=null) {
		            try {
		               con.close();
		            }catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		     }
		}
		return x;
	}

	public List<ChatBean> getChatList(String id) {

		String sql = "select * from chat where chat.member_id=?";
		List<ChatBean> list = new ArrayList<ChatBean>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while(rs.next()) {
				ChatBean chat = new ChatBean();
				chat.setChat_log_id(rs.getString(1));
				chat.setChat_log_answer(rs.getString(3));
				chat.setChat_log_content(rs.getString(4));
				chat.setChat_log_date(rs.getDate(5));
				list.add(chat);
				
			}
			return list; // 값을 담은 객체를 저장한 리스틀 호출한 곳으로 가져갑니다.
		}catch(Exception e) {
			System.out.println("getChatList() 에러 : " + e);
			e.printStackTrace();
		}finally {
	         if(pstmt != null) {
		            try {
		               pstmt.close();
		            } catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		      }
		     if(con!=null) {
		            try {
		               con.close();
		            }catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		     }
		}
		return null;
	}

}
