package ajaxReply;

public class Reply {
	private int no;
	private String content;
	private int ref;
	private String name;
	private String rdate;
	
	public Reply(int no, String content, int ref, String name, String rdate) {
		super();
		this.no = no;
		this.content = content;
		this.ref = ref;
		this.name = name;
		this.rdate = rdate;
	}

	public Reply() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "Reply [no=" + no + ", content=" + content + ", ref=" + ref + ", name=" + name + ", rdate=" + rdate
				+ "]";
	}
	
	
	
	
	
	

}
