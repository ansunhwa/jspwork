package ch06_oracleJDBC;

import java.sql.* ;
import java.util.ArrayList;

public class UseBeanDB5 {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "tjoeun";
	private final String PASS = "1234";
	
	public UseBeanDB5() {
		try {
			Class.forName(JDBC_DRIVER);           //1.trycatch바꾸기 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Bean2> getList() {
		ArrayList<Bean2> alist = new ArrayList<Bean2>();  //2.improt하기
		
		Connection con;
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASS);//3.<-rtycatch해야함,import하고 *
			Statement st = con.createStatement();
			String query = "select * from JOB";
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()) {
				Bean2 bean = new Bean2();   //빈2를 bean으로 새로 만듬
				bean.setJob_code(rs.getString("job_code"));
				bean.setJob_name(rs.getString("job_name"));
				
				alist.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  
		
		return alist;
	}
	

}
