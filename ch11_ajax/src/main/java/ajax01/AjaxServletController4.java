package ajax01;

import java.io.IOException;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

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
		//response.getWriter().print(bean);  // 문자열로 출력
		
		//2. JSONObject 객체로
		/*
		JSONObject jObj = new  JSONObject();
		jObj.put("userId", bean.getId());
		jObj.put("userName", bean.getName());
		jObj.put("gender", bean.getGender());
		jObj.put("email", bean.getEmail());
		
		response.setContentType("application/json");   //json타입은 넣어줘야함
		response.getWriter().print(jObj);
		*/
		
		//3. 2번을 간단하게 하는 방법 : GSON사용
		// MVNREPOSITORY에서 다운로드하여 lib에 넣기
		/*
		 Gson gson = new Gson();
		 gson.toJson(응답 할 자바객체, 응답할 스트림)
		 */
		
		 //Gson gson = new Gson();
		 //gson.toJson(bean, response.getWriter());
		 
		response.setContentType("application/json");
		//  한줄로
		 new Gson().toJson(bean, response.getWriter());
		
		
	}

}
