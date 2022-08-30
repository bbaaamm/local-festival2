package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReviewDAO {
	private Connection conn;
	private ResultSet rs;
	//아래 부분이 데이터베이스에 접속을 하게 해주는 부분.
	public ReviewDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/festival";
			String dbID = "root";
			String dbPassword = "mysql1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();  //오류가 발생했을 때 프린트스택트레이스를 실행해서 오류가 무엇인지 출력할 수 있도록 해줌.
		}
	}
	public int getNext() {
		String SQL = "SELECT bbsID FROM review ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;  // 첫번째 리뷰일 때
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int write(String bbsStar, String bbsContent, String userID) {
		String SQL = "INSERT INTO review(bbsID, bbsStar, bbsContent, userID, bbsAvailable) VALUES(?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsStar);
			pstmt.setString(3, bbsContent);
			pstmt.setString(4, userID);
			pstmt.setInt(5, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Review> getList(int pageNumber) {
		String SQL = "SELECT * FROM review WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Review> list = new ArrayList<Review>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Review review = new Review();
				review.setBbsID(rs.getInt(1));
				review.setBbsStar(rs.getString(2));
				review.setBbsContent(rs.getString(3));
				review.setUserID(rs.getString(4));
				review.setBbsAvailable(rs.getInt(5));
				list.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM REVIEW WHERE bbsID < ? AND bbsAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
