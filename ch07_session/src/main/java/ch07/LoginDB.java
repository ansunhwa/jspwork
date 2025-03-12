package ch07;

import java.sql.* ;

public class LoginDB {
	private DBConnectionMgr pool;
	
	public LoginDB() {   //생성자만듬
		pool = DBConnectionMgr.getInstance();
	}
	//login 메소드
	public boolean loginMethod(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;  //값들을 여러개 넣어야 할 때
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			String query = "select count(*) from test where userid=? and userpw =?"; // 띄어쓰기필요 and는 꼭!
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);  //?표에 넣어 줄 값 생성
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next() && rs.getInt(1) > 0) 
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	

}
