package ch06_oracleJDBC;

import java.sql.Connection;
import java.sql.DriverManager;

public class OracleDBTest1 {

	public static void main(String[] args) {
		try {
			// Class.forName("com.mysql.jdbc.Eriver");   // mysql
			Class.forName("oracle.jdbc.OracleDriver");  //oracle 내가 사용하려는 프로그램 넣기
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tjoeun","1234");  //(URL, 사용자, 비밀번호)
			System.out.println("Success");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		

	}

}
