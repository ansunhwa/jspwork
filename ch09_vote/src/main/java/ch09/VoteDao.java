package ch09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
	
	// 설문 목록 가져오기
	//votelist 각 행의 갯수만큼 객체(컬럼이들어있음)를 만들고 값을 넣어줌 -> Arraylist를 만들어서 객체를 배열로 만음
	public ArrayList<VoteList> getList() {
		ArrayList<VoteList> alist = new ArrayList<VoteList>();
		
		try {
			con = pool.getConnection();
			sql = "select * from votelist order by num desc";
			Statement st = con.createStatement();
			rs = st.executeQuery(sql);
			// rs = con.createStatement().executeQuery(sql);  -> 한줄로
			while(rs.next()) {
				VoteList vlist = new VoteList();
				vlist.setNum(rs.getInt(1));  //("num");
				vlist.setQuestion(rs.getString("question"));
				vlist.setSdate(rs.getString("sdate"));
				vlist.setEdate(rs.getString("edate"));    //->필요한 것만 가져오기
				alist.add(vlist);   //->
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	
	// 질문의 가장 큰 num 가져오기
	public int getMaxNum() {
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select Max(num) from votelist";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con);
		}
		return maxNum;   //가장 최신의 질문 가져오기
	}

	
	
	//설문폼의 질문과 type 가져오기
	public VoteList getOneVote(int num) {   //번호선택이 안되면 제일 최신의 번호를, 클릭하면 그 번호를
		VoteList vlist = new VoteList();
		
		if(num == 0) {
			num = getMaxNum();
		}
		try {
			con = pool.getConnection();
			sql = "select * from votelist where num=" + num;
			
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				vlist.setQuestion(rs.getString("question"));
				vlist.setType(rs.getInt("type"));
				vlist.setActive(rs.getInt("active"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return vlist;
	}
	
	//설문폼의 item 가져오기
	public ArrayList<String> getItem(int num) {
		ArrayList<String> alist = new ArrayList<String>();
		try {
			con = pool.getConnection();
			if(num == 0) {
				num = getMaxNum();
			}
			sql = "select item from voteitem where listnum=" + num;
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				String re = rs.getString(1);
				alist.add(re);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	
	//투표하기(count 증가)
	public boolean updateCount(int num, String[] itemnum) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update VoteItem set count = count+1 where listnum=? and itemnum=?";
			pstmt = con.prepareStatement(sql);
			if(num == 0) {
				num = getMaxNum();
			}
			
			int result = 0;
			for(int i=0; i<itemnum.length; i++) {  //배열의 갯수만큼 돌아감
				pstmt.setInt(1, num);
				pstmt.setInt(2, Integer.parseInt(itemnum[i]));  // 배열을 int형태로
				result = pstmt.executeUpdate();
			}
			if(result == 1 )
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;  //0이면 안된거, 0보다 크면 된거
	}
	
	// voteitem에서 count의 합계
	public int sumCount(int num) {
		int count = 0;
		
		try {
			con = pool.getConnection();
			sql = "select sum(count) from voteitem where listnum=?";
			pstmt = con.prepareStatement(sql);
			
			if(num == 0)
				pstmt.setInt(1, getMaxNum());
			else
				pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return count;
	}
	
	
	// voteitem의 각 항목의 count 가져오기
	public ArrayList<VoteItem> getView(int num) {
		ArrayList<VoteItem> alist = new ArrayList<VoteItem>();
		
		try {
			con = pool.getConnection();
			sql = "select item, count from voteitem where listnum=?";
			pstmt = con.prepareStatement(sql);
			
			if(num == 0) {
				pstmt.setInt(1, getMaxNum());
			} else {
				pstmt.setInt(1, num);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				VoteItem vitem = new VoteItem();
				
				String item[] = new String[1];
				item[0] = rs.getString("item");
				
				vitem.setItem(item);
				vitem.setCount(rs.getInt("count"));
				alist.add(vitem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	
	}
	
	
}
