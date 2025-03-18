package ajaxReply;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ajaxReplyController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		String name = request.getParameter("name");
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		Reply bean = new Reply(0, content, bnum, name, null);
		//bean.setContent(content);
		//bean.setRef(bnum);
		//bean.setName(name);
		
		int result = new ReplyDao().insertReply(bean);
		
		response.getWriter().print(result);
	}

}
