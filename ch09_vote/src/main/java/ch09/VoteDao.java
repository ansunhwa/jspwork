package ch09;

import java.sql.* ;

public class VoteDao {
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	/*
	  메소드
	  getinstance-null 
	  con-null 
	  pstmt - null 
	  rs - null 
	  pool의 객체주소
	 */
	
	//설문 등록하기
	public boolean voteInsert(VoteList vlist, VoteItem vitem) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();       //try-catch
			sql = "insert into votelist values(seq_vote.nextval,?,?,?,sysdate,?,default)";   //시퀀스 밸류 - 질문, sdate, edate, def,sysdate
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vlist.getQuestion());
			pstmt.setString(2, vlist.getSdate());
			pstmt.setString(3, vlist.getEdate());
			pstmt.setInt(4, vlist.getType());
			// 물음표의 갯수대로?
			
			int result = pstmt.executeUpdate();  // 질문이 잘 들어가야 아이템을 넣을 수있음
			
			int lastResult = 0;
			if(result ==1) {
				sql = "insert into voteitem values(seq_vote.currval,?,?,default)";
				pstmt = con.prepareStatement(sql);
				String[] item = vitem.getItem();  //배열로 받아야 함
				for(int i=0; i<item.length; i++) {
					if(item[i] == null || item[i].equals("")) {  //아이템의 값이 없던지 or 값이 비어있던지
						break;
					}
					pstmt.setInt(1, i);
					pstmt.setString(2, item[i]);  //값이 3개 들어왔다면 0한식, 1일식, 2중식
					lastResult = pstmt.executeUpdate();   //잘들어가면1, ㄴㄴ=0
				}	
			}
			if(lastResult == 1)
				flag = true;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
}
