package mvc.book.db;

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

public class BookDAO {
	private DataSource ds; 
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	int result=0;
	
	public BookDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/OracleDB");
		} catch (NamingException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
	}

	public int getListCount() {
		int x = 0;
		try {
			con = ds.getConnection();
			
			String sql = "select count(*) from BOOK";
			pstmt = con.prepareStatement(sql);
		
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
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

	public List<BookBean> getBookList(int page, int limit) {
		String sql = 
				"select * "
				+ "from (select rownum rnum, b.* "
				+		"from (select * from book "
				+			" order by book_id) b"
				+		") "
				+ "where rnum>=? and rnum<=?";
		List<BookBean> list = new ArrayList<BookBean>();
		// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
		int startrow = (page - 1) * limit + 1;
		// 읽기 시작할 row 번호(1 11 21 31 ...
		int endrow = startrow + limit - 1;
		// 읽을 마지막 row 번호(10 20 30 40 ...
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while(rs.next()) {
				BookBean book = new BookBean();
				book.setBook_id(rs.getInt("BOOK_ID"));
				book.setBook_amount(rs.getInt("BOOK_AMOUNT"));
				book.setBook_date(rs.getDate("BOOK_DATE"));
				book.setBook_eticket(rs.getString("BOOK_ETICKET"));
				book.setCard_id(rs.getInt("CARD_ID"));
				book.setConcert_id(rs.getInt("CONCERT_ID"));
				book.setMember_id(rs.getString("MEMBER_ID"));
				list.add(book); //값을 담은 객체를 리스트에 저장합니다.
			}
			return list; // 값을 담은 객체를 저장한 리스틀 호출한 곳으로 가져갑니다.
		}catch(Exception e) {
			System.out.println("getBookList() 에러 : " + e);
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
