package today;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TodayDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public TodayDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/health?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "Kjm0408^^";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate()
    {
        String sql = "select now()";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getString(1);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ""; // 데이터베이스 오류
    }
	
	public int register(String todayWeight, String todayFeel, String userID, String todayBreak, String todayLunch,  String todayDinner, int todayID) {
		String SQL = "insert into today values (?, ?, ?, ?, ?, ?, ?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, getDate());
			pstmt.setString(2, todayWeight);
			pstmt.setString(3, todayFeel);
			pstmt.setString(4, userID);
			pstmt.setString(5, todayBreak);
			pstmt.setString(6, todayLunch);
			pstmt.setString(7, todayDinner);
			pstmt.setInt(8, todayID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public List<Today> getList(String userID) {
		List<Today> userInfoList = new ArrayList<>();
		String sql = "select * from today where userID = ?";
	    try {
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, userID);
	    	rs = pstmt.executeQuery();
	    	while(rs.next()) {
	    		Today userInfo = new Today();
	    		userInfo.setTodayDate(rs.getString("todayDate"));
	    		userInfo.setTodayWeight(rs.getString("todayWeight"));
	    		userInfo.setTodayFeel(rs.getString("todayFeel"));
	    		userInfo.setUserID(rs.getString("userID"));
	    		userInfo.setTodayBreak(rs.getString("todayBreak"));
	    		userInfo.setTodayLunch(rs.getString("todayLunch"));
	    		userInfo.setTodayDinner(rs.getString("todayDinner"));
	    		userInfo.setTodayID(rs.getInt("todayID"));
	    		userInfoList.add(userInfo);
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    return userInfoList;
	}
//	
//	public int delete(int todayID) {
//    	String SQL = "delete from today where todayID=?";
//        try {
//            PreparedStatement pstmt = conn.prepareStatement(SQL);
//            pstmt.setInt(1, todayID);
//            return pstmt.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return -1; // 데이터베이스 오류
//    }
}
