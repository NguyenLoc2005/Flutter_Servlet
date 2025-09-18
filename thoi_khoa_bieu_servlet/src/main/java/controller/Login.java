package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectDatabase;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 response.setContentType("application/json");
         response.setCharacterEncoding("UTF-8");

    	
    	String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        try (Connection conn = ConnectDatabase.Connect()) {
            String sql = "SELECT * FROM user WHERE userName=? AND password=?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, userName);
                stmt.setString(2, password);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        response.getWriter().print("Login thành công");
                    } else {
                        response.getWriter().print("Sai tài khoản hoặc mật khẩu");
                    }
                }
            }
        } catch (Exception e) {
            response.getWriter().print("Lỗi server");
        }
    }
}
