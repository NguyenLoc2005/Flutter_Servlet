package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject; // cần thư viện org.json

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	response.setHeader("Access-Control-Allow-Origin", "*");
    	response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
    	response.setHeader("Access-Control-Allow-Headers", "Content-Type");
    	
    	
    	//Cấu hình
    	response.setContentType("application/json");
    	response.setCharacterEncoding("UTF-8");
    	
    
    	//Đọc body từ request
    	BufferedReader reader = request.getReader();
    	StringBuilder sb = new StringBuilder();
    	String line;
    	
    	while((line=reader.readLine())!=null) {
    		sb.append(line);
    	}
    	
    	String requestBody = sb.toString();
    	
    	//Parse JSON lấy username và pasword
    	JSONObject jsonRequest = new JSONObject(requestBody);
    	String userName = jsonRequest.getString("userName");
    	String password = jsonRequest.getString("password");
    	
    	 //Xử lý login
        JSONObject jsonResponse = new JSONObject();
        if ("admin".equals(userName) && "123".equals(password)) {
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "Login thành công!");
        } else {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Sai userName hoặc password");
        }

        //Trả kết quả JSON về client (Flutter)
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }
}