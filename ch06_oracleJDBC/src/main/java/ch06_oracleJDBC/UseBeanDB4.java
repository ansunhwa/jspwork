package ch06_oracleJDBC;

import java.sql.*;

import java.util.ArrayList;

public class UseBeanDB4 {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "tjoeun";
	private final String PASS = "1234";
	
	public UseBeanDB4() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//메소드 : list목록 모두 가져오는 메소드
	public ArrayList<Bean> getList() {    //ArrayList import
		ArrayList<Bean> alist = new ArrayList<Bean>();
		
		try {
			Connection con = DriverManager.getConnection(JDBC_URL, USER, PASS);
			Statement st = con.createStatement();
			String query = "select * from department";
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Bean bean = new Bean();
				//bean.setDept_id(rs.getString(1));  //첫번째 (1)도 가능하고 숫자 넣을 때는 조심!
				bean.setDept_id(rs.getString("dept_id"));  //이름으로 넣어줘도 된다
				bean.setDept_title(rs.getString("dept_title"));
				bean.setLocation_id(rs.getString("location_id"));
				// set 메소드 호출해서값을 넣고 get으로 값을 가져오세요
				alist.add(bean);   //위에서 만든 한행을 list에 담아줌, while을 돌면서 행을 만들어 alist에 담음(9개)
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alist;
	}
	
	
	
}
