package ch06_oracleJDBC;

public class Bean {
	private String dept_id;
	private String dept_title;
	private String location_id;
	
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_title() {
		return dept_title;
	}
	public void setDept_title(String dept_title) {
		this.dept_title = dept_title;
	}
	public String getLocation_id() {
		return location_id;
	}
	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}
//빈 하나에 한 행 / 3개가 담긴 행을 9개 만듬 /  배열에 행(주소)를 하나씩 담음
}
