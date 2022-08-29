package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	//아래 부분이 데이터베이스에 접속을 하게 해주는 부분.
	public UserDAO() {
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
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);  //물음표를 대체할 값을 userID로 지정함
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {  //데이터베이스에 저장되어있던 비밀번호 값과 사용자가 입력한 비밀번호가 일치하면 1 반환
					return 1; // 로그인 성공
				}
				else
					return 0; // 비밀번호 불일치
			}
			return -1; //아이디가 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserArea());       //물음표에 각각의 값들을 채워넣을 수 있도록 해줌.
			pstmt.setString(6, user.getUserInterest());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}	
	public User getmember(String userID) {
        String SQL = "select * from USER where userID = ?";
        User us = null;
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs=pstmt.executeQuery();
            if(rs.next()){
                us = new User();
                us.setUserName(rs.getString("userName"));
                us.setUserID(rs.getString("userID"));
                us.setUserPassword(rs.getString("userPassword"));
                us.setUserEmail(rs.getString("userEmail"));
                us.setUserArea(rs.getString("userArea"));
                us.setUserInterest(rs.getString("userInterest"));

                System.out.println("회원정보 저장완료");
            }
            System.out.println("sql구문실행완료");

        }catch(Exception e) {
            e.printStackTrace();
        }
        return us;
    }
	public int updateMember(User user) {
        String SQL = "UPDATE USER SET userName=?, userPassword=?, userEmail=? , userArea=?, userInterest=? "
                + "WHERE userID=?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserName());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserEmail());
            pstmt.setString(4, user.getUserArea());
            pstmt.setString(5, user.getUserInterest());
            pstmt.setString(6, user.getUserID());

            return pstmt.executeUpdate();

        }catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}