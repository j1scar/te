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

import mvc.concert.db.ConcertBean;

public class BookDAO {
	private DataSource ds;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	int result = 0;

	public BookDAO() {
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
			pstmt = con.prepareStatement("select count(*) from book where book.member_id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("getListCount() 에러 : " + e);
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		return x;
	}

	public List<BookBean> getBookList(int page, int limit, String id) {

		String sql = "select * from (select rownum rnum, b.* " + "from (select * from book inner join concert "
				+ "on concert.concert_id=book.concert_id " + "where book.member_id=? order by book.book_id desc) b ) "
				+ "where rnum >= ? and rnum <= ?";
		List<BookBean> list = new ArrayList<BookBean>();

		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				BookBean book = new BookBean();
				book.setBook_id(rs.getInt("BOOK_ID"));
				book.setBook_amount(rs.getInt("BOOK_AMOUNT"));
				book.setBook_date(rs.getDate("BOOK_DATE"));
				book.setBook_eticket(rs.getString("BOOK_ETICKET"));
				book.setMember_id(rs.getString("MEMBER_ID"));
				book.setConcert_day(rs.getDate("CONCERT_DAY"));
				book.setConcert_id(rs.getInt("CONCERT_ID"));
				book.setConcert_name(rs.getString("CONCERT_NAME"));
				list.add(book);

			}
			System.out.println("id=" + id);
			return list; // 값을 담은 객체를 저장한 리스틀 호출한 곳으로 가져갑니다.
		} catch (Exception e) {
			System.out.println("getBookList() 에러 : " + e);
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		return null;
	}

	public boolean isBook(int num, String pass) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");

			String sql = "select * from book where BOOK_ID=?";
			String sql1 = "select member.member_password from member inner join book on member.member_id=book.member_id";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pstmt = con.prepareStatement(sql1);
				rs = pstmt.executeQuery();
				if (pass.equals(rs.getString(1))) {
					System.out.println(pass + "와 " + rs.getString(1) + "는 일치");
					return true;
				}
			}
		} catch (SQLException e) {
			System.out.println("isBook() 에러");
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		return false;
	}

	public boolean bookDelete(int num) {
		String sql = "delete * from book where BOOK_ID = ?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int result = pstmt.executeUpdate();
			System.out.println(result + "개 삭제되었습니다.");
			if (result >= 1)
				return true;
		} catch (Exception e) {
			System.out.println("boardDelete() 에러 : " + e);
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		return false;
	}

	public int bookInsert(BookBean bdata) throws Exception {
		int result = 0;

		try {
			con = ds.getConnection();
			String sql = "insert into Book(BOOK_ID, CONCERT_ID, MEMBER_ID, BOOK_ETICKET, BOOK_AMOUNT, CARD_ID, BOOK_DATE) "
					+ "values(book_seq.nextval, ?, ?, ?, ?, ?, sysdate)";

			// 새로운 book 등록하는 부분.
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bdata.getConcert_id());
			pstmt.setString(2, bdata.getMember_id());
			pstmt.setString(3, bdata.getBook_eticket());
			pstmt.setInt(4, bdata.getBook_amount());
			pstmt.setInt(5, bdata.getCard_id());
			result = pstmt.executeUpdate();
			if (result == 1)
				System.out.println("마이페이지 예약내역에 데이터 삽입완료되었습니다.");

		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}

		return result;
	}
}
