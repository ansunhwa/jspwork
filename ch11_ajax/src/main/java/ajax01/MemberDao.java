package ajax01;

import java.sql.*;
import java.util.ArrayList;

public class MemberDao {
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public boolean loginMember(String id, String pwd) {  // 로그인화면->아이디와 비번이 맞으면 아이디를 가져옴(true)
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
	

public boolean chickId(String id) {  // 중복확인버튼->아이디중복확인이 맞으면 아이디를 가져옴(true)
	boolean flag = false;
	try {
		con = pool.getConnection();
		sql = "select id from member where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		flag = rs.next();
		// 아이디중복확인이 맞으면 아이디를 가져옴(true)
		// 아이디가 틀리면 아무것도 가져오지 않음(false)
		// 나오는 값을 flag에 넣으세요
	} catch (Exception e) {
		e.printStackTrace();
	}
	return flag;
}


	public boolean insertMember(Member mbean) {  // 회원정보가update -> 입력받은 회원가입정보가 데이터베이스(sql)에 저장됨
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";  //데이터베이스에 들어올 값
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mbean.getId());  // 여기서 얻어온 아이디 값을 넣으세요
			pstmt.setString(2, mbean.getPwd()); 
			pstmt.setString(3, mbean.getName()); 
			pstmt.setString(4, mbean.getGender()); 
			pstmt.setString(5, mbean.getBirthday()); 
			pstmt.setString(6, mbean.getEmail()); 
			pstmt.setString(7, mbean.getZipcode()); 
			pstmt.setString(8, mbean.getAddress()); 
			pstmt.setString(9, mbean.getDetailaddress()); 
			pstmt.setString(10, String.join("", mbean.getHobby())); 
			
			/*
			 * String hobbyDB = String.join("", mbean.getHobby()); String hobby[] =
			 * hobbyDB.split(" ");   출력 잘 되나 확인한거임
			 */
			pstmt.setString(11, mbean.getJob());
			//pstmt.executeUpdate();     //새로운 값이 들어오면 / 반환값은 update가 되었으면 1반환, 안되면0
			if(pstmt.executeUpdate() ==1)
				flag = true;   //잘 들어왔으면 true
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	// id에 해당하는 데이터 얻어오기(1행)
		public Member getMember(String id) {
			Member bean = new Member();
			try {
				con = pool.getConnection();
				sql = "select id, name, gender, email from member where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setId(rs.getString(1));
					bean.setName(rs.getString(2));
					bean.setGender(rs.getString(3));
					bean.setEmail(rs.getString(4));
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con);
			}
			return bean;
		}
		
		// 전체 member데이터 가져오기
		public ArrayList<Member> getAllMember() {
			ArrayList<Member> alist = new ArrayList<Member>();
			try {
				con = pool.getConnection();
				sql = "select * from member";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Member bean = new Member();
					bean.setId(rs.getString("id"));
					bean.setName(rs.getString("name"));
					bean.setGender(rs.getString("gender"));
					bean.setEmail(rs.getString("email"));
					alist.add(bean);
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con);
			}
			return alist;
	
	
	}
}
