package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/Register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Hỗ trợ preflight cho Web
    @Override
    protected void doOptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setStatus(HttpServletResponse.SC_OK);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // CORS
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");

        // Cấu hình JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Đọc body
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String requestBody = sb.toString();

        // Parse JSON
        JSONObject jsonRequest = new JSONObject(requestBody);
        String userName = jsonRequest.getString("userName");
        String password1 = jsonRequest.getString("password1");
        String password2 = jsonRequest.getString("password2");

        JSONObject jsonResponse = new JSONObject();

        // Kiểm tra rỗng và password khớp
        if (userName.isEmpty() || password1.isEmpty() || password2.isEmpty()) {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Vui lòng điền đầy đủ thông tin");
        } else if (!password1.equals(password2)) {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Mật khẩu nhập lại không khớp");
        } else {
            // Ở đây có thể lưu vào DB
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "Register thành công!");
        }

        // Trả JSON
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }
}
