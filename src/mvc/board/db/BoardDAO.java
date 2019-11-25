package mvc.board.db;

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

public class BoardDAO {
	private DataSource ds; 
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	int result = 0;
	public BoardDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount() {
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCount() 에러 : " + ex);
		} finally {
			close();
		}
		return x;
	}
	
	
	public List<BoardBean> getBoardList(int page, int limit) {
		//page : 페이지
		//limit : 페이지 당 목록의 수
		// BOARD_RE_REF desc, BOARD_RE_SEQ asc에 의해 정렬한 것을
		// 조건절에 맞는 rnum의 범위 만큼 가져오는 쿼리문이다.
		
		String board_list_sql = 
				"select * "
			+   "from (select rownum rnum, b.* "
			+          "from (select * from board "
			+          " order by BOARD_RE_REF desc,"
			+          " BOARD_RE_SEQ asc) b "
			+        ")"
			+   " where rnum >= ? and rnum <= ? ";
		List<BoardBean> list = new ArrayList<BoardBean>();
		// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지...
		int startrow = (page-1) * limit +1;
				//읽기 시작할 row번호 (1 11 21 31 ...)
		int endrow = startrow + limit -1;
				//읽을 마지막 row 번호 (10 20 30 40 ....)
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			//DB에서 가져온 데이터를 VO 객체에 담는다.
			while (rs.next()) {
				BoardBean board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				//board.setBOARD_FILE(rs.getString("BOARD_FILE"));
				//board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				//board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				list.add(board);
			}
			
			return list;
		} catch(Exception ex) {
			System.out.println("getBoardList() 에러 : " + ex);
			ex.printStackTrace();
		} finally {
			close();
		}
		return null;
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
	public void setReadCountUpdate(int num) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			
			String sql = "update board set BOARD_READCOUNT= BOARD_READCOUNT + 1 where BOARD_NUM = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;	  // 업데이트 성공		
			} else {
				result = -1;  // 업데이트 실패(없음)
			}
		} catch(SQLException e) {
			System.out.println("setReadCountUpdate 에러" + e);
			e.printStackTrace();
		}finally {
			close();
		}
		System.out.println("읽음 수 업뎃 결과 = " + result);
	}
	public BoardBean getDetail(int num) {
		BoardBean board = new BoardBean();
		
		try {
		con = ds.getConnection();
		System.out.println("getConnection");
		
		pstmt = con.prepareStatement("select * from board where board_num = ?");
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
			board.setBOARD_NAME(rs.getString("BOARD_NAME"));
			board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
			board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
			board.setBOARD_FILE(rs.getString("BOARD_FILE"));
			board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
			board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
			board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
			board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
			board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
		}
		
		} catch(SQLException e) {
			System.out.println("getDetail() 에러 : " + e);
			e.printStackTrace();
		}finally {
			close();
		}
		
		return board;
		
	}
	
	public boolean boardInsert(BoardBean b) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			//원문의 경우 lev, seq 필드값은 0이다.
			pstmt = con.prepareStatement("INSERT INTO board(board_num, board_name, board_pass, board_subject, board_content, board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date) VALUES (board_seq.nextval, ?, ?, ?, ?,board_seq.nextval, 0, 0, 0 , sysdate)");
	
			pstmt.setString(1, b.getBOARD_NAME());
			pstmt.setString(2, b.getBOARD_PASS());
			pstmt.setString(3, b.getBOARD_SUBJECT());
			pstmt.setString(4, b.getBOARD_CONTENT());
			
			
			result = pstmt.executeUpdate();
			System.out.println("게시판 삽입 결과 = " + result);
		} catch(SQLException e) {
			System.out.println("boardInsert() 에러 : " + e);
			e.printStackTrace();
		}finally {
			close();
		}
		return (result==1) ? true:false;
		
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
