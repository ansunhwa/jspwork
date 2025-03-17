package ajax01;

import java.io.IOException;

import org.json.simple.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxServletController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		MemberDao mDao = new MemberDao();
		Member bean = mDao.getMember(id);
		
		//1. 객체 주소 반환. toString호출-> 값이 문자열로 나옴  toString없으면 값이 주소로 나옴
		response.getWriter().print(bean);  // 문자열로 출력
		
		//2. JSONObject 객체로
		JSONObject jObj = new  JSONObject();
		jObj.put("userId", bean.getId());
		jObj.put("userName", bean.getName());
		jObj.put("gender", bean.getGender());
		jObj.put("email", bean.getEmail());
		
		response.setContentType("application/json");   //json타입은 넣어줘야함
		response.getWriter().print(jObj);
		
		
		
	}

}
