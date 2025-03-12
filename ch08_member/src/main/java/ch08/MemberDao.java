package ch08;

import java.sql.* ;

public class MemberDao {
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public boolean loginMember(String id, String pwd) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from member where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
			// 아이디와 비번이 맞으면 아이디를 가져옴(true)
			// 아이디는 맞고 비번이 틀리면 다르기 때문에 아무것도 가져오지 않음(false)
			// 나오는 값을 flag에 넣으세요
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
}
